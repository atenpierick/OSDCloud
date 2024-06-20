Write-Host  -ForegroundColor Cyan "Starting OSDCloud ..."
Start-Sleep -Seconds 5

#Updating the OSD PowerShell Module
Write-Host  -ForegroundColor Cyan "Updating the OSD PowerShell Module"
Install-Module OSD -Force

Write-Host  -ForegroundColor Cyan "Importing the OSD PowerShell Module"
Import-Module OSD -Force

#Start OSDCloud ZTI
Write-Host  -ForegroundColor Cyan "Start OSDCloud ZTI Mode"
#Start-OSDCloud -OSName "Windows 10 22H2 x64" -OSLanguage nl-nl -OSEdition Pro -ZTI
Start-OSDCloud

#Restart from WinPE
Write-Host  -ForegroundColor Cyan "Restarting in 20 seconds!"
Start-Sleep -Seconds 20
wpeutil reboot
