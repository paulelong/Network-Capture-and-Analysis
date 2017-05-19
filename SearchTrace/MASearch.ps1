Param(
[parameter(Mandatory=$true, Position=1)]
[alias("p")]
$TracePath,
[parameter(Mandatory=$true, Position=2)]
[alias("f")]
$Filter
)

Write-Host $TracePath
Write-Host $Filter

$d = Get-ChildItem -path $TracePath -include *.cap,*.etl,*.pcap,*.pcapng -Recurse
$list = $d | Select-Object -Property FullName
foreach($item in $list)
{
    Write-Host ($item.FullName)
#  $s = New-PefTraceSession -Filter $Filter -Name $item.FullName -Silent
#    Add-PefMessageProvider $item.FullName -PefSession $s
#    Start-PefTraceSession -PefSession $s
    New-PefTraceSession -Filter $Filter -Name $item.FullName -Silent | Add-PefMessageSource -Source $item.FullName | Start-PefTraceSession
}

