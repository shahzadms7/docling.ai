#requires -Version 5.1
[CmdletBinding()]param([Parameter(Mandatory=$true)][string]$Model)
$ErrorActionPreference='Stop'
if(!(Get-Command ollama -ErrorAction SilentlyContinue)){throw '[STOP] Ollama not found.'}
$body=@{model=$Model;prompt='Reply with exactly: benchmark-pass';stream=$false;options=@{temperature=0}}|ConvertTo-Json -Depth 8
try{$r=Invoke-RestMethod -Method Post -Uri 'http://127.0.0.1:11434/api/generate' -ContentType 'application/json' -Body $body}
catch{throw ('[STOP] Local Ollama API benchmark failed: '+$_.Exception.Message)}
$ns=1000000000.0
$result=[ordered]@{
 model=$r.model;created_at=$r.created_at;prompt_eval_count=$r.prompt_eval_count;eval_count=$r.eval_count;
 prompt_eval_seconds=[math]::Round($r.prompt_eval_duration/$ns,3);generation_seconds=[math]::Round($r.eval_duration/$ns,3);
 prompt_tokens_per_second=if($r.prompt_eval_duration){[math]::Round($r.prompt_eval_count/($r.prompt_eval_duration/$ns),2)}else{$null};
 generation_tokens_per_second=if($r.eval_duration){[math]::Round($r.eval_count/($r.eval_duration/$ns),2)}else{$null};
 total_seconds=[math]::Round($r.total_duration/$ns,3);response=$r.response
}
$result.GetEnumerator()|ForEach-Object{Write-Host ('{0,-28} {1}' -f $_.Key,$_.Value)}
