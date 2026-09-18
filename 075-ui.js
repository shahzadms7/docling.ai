const $=s=>document.querySelector(s), $$=s=>[...document.querySelectorAll(s)];
const state={files:[],health:null};

function setView(id){
  $$('.view').forEach(v=>v.classList.toggle('active',v.id===id));
  $$('.navItem').forEach(b=>b.classList.toggle('active',b.dataset.view===id));
  const names={overview:['Command Center','Evidence-first local knowledge workspace'],intake:['Add Documents','Controlled local intake'],library:['Library','Accounted source evidence'],search:['Hybrid Search','Exact + keyword + semantic when certified'],chat:['AI Chat','Local retrieval-grounded conversation'],create:['Create','Governed evidence-backed outputs'],exceptions:['Exceptions','Visible failures and review queue'],health:['System Health','Runtime and evidence-boundary status']};
  $('#viewTitle').textContent=names[id]?.[0]||'Command Center'; $('#viewSubtitle').textContent=names[id]?.[1]||'';
  location.hash=id;
}
$$('.navItem').forEach(b=>b.addEventListener('click',()=>setView(b.dataset.view)));
$$('[data-jump]').forEach(b=>b.addEventListener('click',()=>setView(b.dataset.jump)));
const THEMES=['white','black','microsoft','google'];
function applyTheme(name){
  const theme=THEMES.includes(name)?name:'white';
  document.documentElement.dataset.theme=theme;
  localStorage.setItem('docling-ai-theme',theme);
  const select=$('#themeSelect'); if(select && select.value!==theme) select.value=theme;
}
const savedTheme=localStorage.getItem('docling-ai-theme')||'white';
applyTheme(savedTheme);
$('#themeSelect').addEventListener('change',e=>applyTheme(e.target.value));

function esc(v){return String(v??'').replace(/[&<>"']/g,m=>({'&':'&amp;','<':'&lt;','>':'&gt;','"':'&quot;',"'":'&#39;'}[m]))}
function status(s){return '<span class="status '+esc(s)+'">'+esc(s)+'</span>'}
function table(files){
 if(!files.length)return '<div class="muted">No files admitted yet.</div>';
 return '<div class="tableWrap"><table><thead><tr><th>File</th><th>Type</th><th>Status</th><th>Size</th><th>Source ID</th></tr></thead><tbody>'+
 files.map(f=>'<tr><td>'+esc(f.relative_path)+'</td><td>'+esc(f.file_type||'')+'</td><td>'+status(f.processing_status)+'</td><td>'+Number(f.size_bytes||0).toLocaleString()+'</td><td title="'+esc(f.source_id)+'">'+esc((f.source_id||'').slice(0,12))+'…</td></tr>').join('')+
 '</tbody></table></div>';
}

async function api(path,opts){const r=await fetch(path,opts);const j=await r.json().catch(()=>({}));if(!r.ok)throw new Error(j.error||('HTTP '+r.status));return j}
async function refresh(){
 try{
   const [h,f]=await Promise.all([api('/api/health'),api('/api/files')]);
   state.health=h;state.files=f.files||[];
   $('#kpiFiles').textContent=state.files.length;
   $('#kpiExceptions').textContent=state.files.filter(x=>['FAILED','PARTIAL','UNSUPPORTED','ENCRYPTED','PENDING_REVIEW'].includes(x.processing_status)).length;
   $('#kpiModel').textContent=h.ollama_model||'Not selected';
   $('#kpiHealth').textContent=h.status||'UNKNOWN';
   $('#railHealth').textContent=h.local_only?'Local only':'Review network';
   $('#recentTable').innerHTML=table(state.files.slice(0,8));
   $('#libraryTable').innerHTML=table(state.files);
   $('#exceptionsTable').innerHTML=table(state.files.filter(x=>!['SUCCESS','DUPLICATE','INTENTIONALLY_EXCLUDED'].includes(x.processing_status)));
   $('#healthGrid').innerHTML=Object.entries(h).map(([k,v])=>'<article class="card metric"><span>'+esc(k.replaceAll('_',' '))+'</span><strong>'+esc(v)+'</strong></article>').join('');
 }catch(e){$('#kpiHealth').textContent='DEGRADED';console.error(e)}
}
$('#refreshBtn').addEventListener('click',refresh);

async function uploadFile(file){
 const row=document.createElement('div');row.className='queueItem';row.innerHTML='<strong>'+esc(file.name)+'</strong><small class="muted"> • '+file.size.toLocaleString()+' bytes</small><div class="progress"><i></i></div><div class="muted note">Preparing…</div>';
 $('#uploadQueue').prepend(row);const bar=row.querySelector('i'),note=row.querySelector('.note');
 return new Promise((resolve,reject)=>{
   const x=new XMLHttpRequest();x.open('POST','/api/upload');x.setRequestHeader('X-Filename',encodeURIComponent(file.name));x.setRequestHeader('Content-Type','application/octet-stream');
   x.upload.onprogress=e=>{if(e.lengthComputable)bar.style.width=((e.loaded/e.total)*100).toFixed(1)+'%'};
   x.onload=()=>{try{const j=JSON.parse(x.responseText);if(x.status>=300)throw new Error(j.error||x.status);bar.style.width='100%';note.textContent=j.message||'Complete';resolve(j)}catch(err){note.textContent='FAILED: '+err.message;reject(err)}};
   x.onerror=()=>{note.textContent='FAILED: network/local server error';reject(new Error('upload failed'))};x.send(file);
 });
}
async function handleFiles(files){for(const f of files){try{await uploadFile(f)}catch(e){console.error(e)}}await refresh()}
$('#fileInput').addEventListener('change',e=>handleFiles([...e.target.files]));
const drop=$('#dropZone');drop.addEventListener('dragover',e=>{e.preventDefault();drop.classList.add('over')});drop.addEventListener('dragleave',()=>drop.classList.remove('over'));drop.addEventListener('drop',e=>{e.preventDefault();drop.classList.remove('over');handleFiles([...e.dataTransfer.files])});

$('#searchBtn').addEventListener('click',async()=>{
 const q=$('#searchInput').value.trim();if(!q)return;$('#searchResults').innerHTML='<div class="muted">Searching…</div>';
 try{const r=await api('/api/search?q='+encodeURIComponent(q));$('#searchResults').innerHTML=(r.results||[]).map(x=>'<article class="result"><strong>'+esc(x.relative_path)+'</strong><p>'+esc(x.snippet||'')+'</p><small class="muted">'+esc(x.locator||'')+'</small></article>').join('')||'<div class="muted">No evidence matched.</div>'}catch(e){$('#searchResults').textContent='Search failed: '+e.message}
});

$('#chatBtn').addEventListener('click',async()=>{
 const q=$('#chatInput').value.trim();if(!q)return;const u=document.createElement('div');u.className='msg user';u.textContent=q;$('#chatLog').append(u);$('#chatInput').value='';
 const a=document.createElement('div');a.className='msg ai';a.textContent='Thinking locally…';$('#chatLog').append(a);$('#chatLog').scrollTop=$('#chatLog').scrollHeight;
 try{const r=await api('/api/chat',{method:'POST',headers:{'Content-Type':'application/json'},body:JSON.stringify({question:q})});a.textContent=r.answer||'';$('#evidencePanel').innerHTML=(r.evidence||[]).map(e=>'<div class="result"><strong>'+esc(e.relative_path)+'</strong><br><small>'+esc(e.locator||'')+'</small></div>').join('')||'<div class="muted">No evidence returned.</div>'}catch(e){a.textContent='Chat unavailable: '+e.message}
});
$('#searchInput').addEventListener('keydown',e=>{if(e.key==='Enter')$('#searchBtn').click()});
$('#chatInput').addEventListener('keydown',e=>{if((e.ctrlKey||e.metaKey)&&e.key==='Enter')$('#chatBtn').click()});
if(location.hash)setView(location.hash.slice(1));refresh();
