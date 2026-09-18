# Expected XLSX Extraction Result
Input: `101-sample-source-workbook.xlsx`

Expected:
- every worksheet inventoried, including hidden state when present
- cell/range values and formulas distinguished
- merged ranges, names, notes/comments, links, charts/drawings/images inventoried where supported
- citations use workbook/sheet/range or cell coordinates
- reconciliation reports no silent loss

Example citation:
`[SOURCE synthetic-xlsx-001 | sheet=Inventory | range=A1:F5]`
