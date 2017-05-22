$s = Get-NetEventSession
if($s -eq $null)
{
    $s = New-NetEventSession -Name SimpleCaptureScriptTrace
    $p = Add-NetEventPacketCaptureProvider -SessionName SimpleCaptureScriptTrace -TruncationLength 0
}
if($s.Name -eq "SimpleCaptureScriptTrace")
{
    Start-NetEventSession -Name SimpleCaptureScriptTrace
}
Get-NetEventSession

