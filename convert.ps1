$mytableNew = Import-Csv -Path job.csv  -Delimiter ","
$HashTableClean=@{}
foreach($r in $mytableNew)
{
    $HashTableClean[$r.ID]=$r.Data
}
$files = Get-ChildItem *.pdf
$HashTableClean.GetEnumerator() | ForEach-Object {
    $entry = $_
    $files | Where-Object { $_.Name.StartsWith($entry.Key) } |
        ForEach-Object {
          
            $newName = $entry.Value
            $_ | Rename-Item -NewName $newName 
        }       
}


//after
//Get-ChildItem | Where-Object {!$_.Name.EndsWith(".pdf")} | rename-item -new {$_.Name + ".pdf"}
