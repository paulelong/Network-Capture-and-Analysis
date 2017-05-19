<#
 
.SYNOPSIS
Searches specified files for traces or logs that meet the filter.
 
.DESCRIPTION
Searches specified files for traces or logs that meet the filter.  This requires Message Analyzer to be installed as it leverages its CmdLets.
 
.EXAMPLE
SearchTrace *.cap tcp.port==80

Displays all files wihch have tcp port 80 traffic. 

.PARAMETER Path
Path to search. 

.PARAMETER Filter
Message Analyzer filter to look for. 

.NOTES
Message Analyzer install is required.  See http://aka.ms/MessageAnalyzer
 
.LINK
https://github.com/paulelong/Network-Capture-and-Analysis
 
#>

Param(
[parameter(Mandatory=$true, Position=1)]
[alias("Path")]
$TracePath,
[parameter(Mandatory=$true, Position=2)]
[alias("Filter")]
$MAFilter
)

$d = Get-ChildItem -path $TracePath -include *.cap,*.etl,*.pcap,*.pcapng -Recurse
$list = $d | Select-Object -Property FullName
foreach($item in $list)
{
    $ps = New-PefTraceSession -Filter $MAFilter -Silent
    $r = $ps | Add-PefMessageSource -Source $item.FullName | Start-PefTraceSession
    if($r.FilteredMessages -gt 0){
        echo ($r.FilteredMessages.ToString() + " messages found in " + $item.FullName)
    }
}

