$s = Get-NetEventSession
if(($s -eq $null) -or ($s.name -ne "SimpleCaptureScriptTrace"))
{
    echo "Trace not started yet."
} else {
    if($s.SessionStatus -eq "Running")
    {
        $s | Stop-NetEventSession
    }
    else {
        echo "Trace is already stopped"
    }
}
echo ("Trace is location " + $s.LocalFilePath)