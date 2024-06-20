Write-Host  -ForegroundColor Cyan "Starting OSDCloud ..."
Start-Sleep -Seconds 5

#Updating the OSD PowerShell Module
#Write-Host  -ForegroundColor Cyan "Updating the OSD PowerShell Module"
#Update-Module OSD -Force -SkipPublisherCheck

Write-Host  -ForegroundColor Cyan "Importing the OSD PowerShell Module"
Import-Module OSD -Force

# Choice Windows Version

$Win10Online = New-Object System.Management.Automation.Host.ChoiceDescription 'Win10 Online &','Windows 10 Online'
$Win11Online = New-Object System.Management.Automation.Host.ChoiceDescription 'Win11 Online &','Windows 11 Online'
$WinOffline = New-Object System.Management.Automation.Host.ChoiceDescription  'WinOffline &','Offline Windows'



$options = [System.Management.Automation.Host.ChoiceDescription[]]($Win10Online, $Win11Online,$WinOffline)

$title = 'Windows version'
$message = 'Select the Windows version you want to install?'
$result = $host.ui.PromptForChoice($title, $message, $options, 2)

if ($result -eq "0") {
Write-Host Installing Windows 10 Pro
Start-OSDCloud -OSVersion 'Windows 10 22H2 x64' -OSEdition Pro -ZTI -Restart
}
elseif ($result -eq "1") {
Write-Host Installing Windows 11 Pro
Start-OSDCloud -OSVersion 'Windows 11 23H2 x64' -OSEdition Pro -ZTI -Restart
}
elseif ($result -eq "2") {
Write-Host Installing Offline Windows 
Start-OSDCloud -FindImageFile -Restart
}


#Start OSDCloud ZTI
#Write-Host  -ForegroundColor Cyan "Start OSDCloud ZTI Mode"
#Start-OSDCloud -OSName "Windows 10 22H2 x64" -OSLanguage nl-nl -OSEdition Pro -ZTI
#Start-OSDCloud


#Restart from WinPE
Write-Host  -ForegroundColor Cyan "Restarting in 20 seconds!"
Start-Sleep -Seconds 20
wpeutil reboot
