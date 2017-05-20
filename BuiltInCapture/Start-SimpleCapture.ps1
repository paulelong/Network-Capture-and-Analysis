$s = Get-NetEventSession
if($s -eq $null)
{
    New-NetEventSession -Name trc
    Add-NetEventPacketCaptureProvider -SessionName trc -TruncationLength 0
}
Start-NetEventSession -Name trc
