$s = Get-NetEventSession
if(($s -eq $null) -or ($s.name -ne "SimpleCaptureScriptTrace"))
{
    echo "Trace not started yet."
}