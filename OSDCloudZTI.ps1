Write-Host  -ForegroundColor Cyan "Starting OSDCloud ..."
Start-Sleep -Seconds 5

#Updating the OSD PowerShell Module
#Write-Host  -ForegroundColor Cyan "Updating the OSD PowerShell Module"
#Update-Module OSD -Force -SkipPublisherCheck

Write-Host  -ForegroundColor Cyan "Importing the OSD PowerShell Module"
Import-Module OSD -Force

# Choice Windows Version

$title = 'Windows version'
$number = 2
$options = 'A', 'B', 'C' | ForEach-Object {
  [System.Management.Automation.Host.ChoiceDescription]::new(
    "Option $_&$number`b",  # NOTE: `b on display erases the number.
    "Help for option $_"
  )
  ++$number
}

$selection = $Host.UI.PromptForChoice($title, '', $options, 0)

# Handle the user’s selection
switch ($selection) {
  0 { 
    Write-Host Installing Windows 10 Pro
    Start-OSDCloud -OSVersion 'Windows 10 22H2 x64' -OSEdition Pro -ZTI -Restart
  }
  1 {
  Write-Host Installing Windows 11 Pro
Start-OSDCloud -OSVersion 'Windows 11 23H2 x64' -OSEdition Pro -ZTI -Restart
  }
  2 { 
  Write-Host Installing Offline Windows 
  Start-OSDCloud -FindImageFile -Restart
  }
}



#Restart from WinPE
Write-Host  -ForegroundColor Cyan "Restarting in 20 seconds!"
Start-Sleep -Seconds 20
wpeutil reboot
