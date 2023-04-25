<#
.Synopsis
   This powershell script will convert skype: URL calls to ZAC.
   This was created to intergrate ZAC with ConnectWise Manage.
.DESCRIPTION
   This script creates/updates the registry keys for skype: URL/Classes and creates a bat file in C:\SkypeToZAC.
   The bat file is to convert the ConnectWise Manage skype:number?call URL to a ZAC supported format.
.NOTES
   Version:       1.0
   Author:        Andrew Kolhoff
   Creation Date: 4/25/2023
#>

#Create/Modify Reg Keys
Write-Host -ForegroundColor Green "Modifying Registry"
New-Item "HKCU:\Software\Classes\skype\shell\open\command" -Force | Out-Null
New-ItemProperty "HKCU:\Software\Classes\skype" -Name '(Default)' -Value 'URL:skype' -Force | Out-Null
New-ItemProperty "HKCU:\Software\Classes\skype" -Name 'URL Protocol' -Force | Out-Null
New-ItemProperty "HKCU:\Software\Classes\skype\shell\open\command" -Name '(Default)' -Value '"C:\SkypeToZAC\SkypeToZAC.bat" "%1"' -Force | Out-Null

#Make sure C:\SkypeToTeams folder exists
Write-Host -ForegroundColor Green "Creating Directory C:\SkypeToZAC"
if (!(Test-Path C:\SkypeToTeams)) {New-Item -Type Directory 'C:\SkypeToZAC'}

#Create Bat file
Write-Host -ForegroundColor Green "Creating .bat file"
$BatFile = "@echo off
set origNumber=%1
set number=%origNumber:?call=%
'"C:\Program Files (x86)\Zultys\ZAC\ZAC.exe" call=%number%'
$BatFile | Out-file -Encoding "ASCII" C:\SkypeToZAC\SkypeToZAC.bat

#Create README File
Write-Host -ForegroundColor Green "Creating README File"
$ReadMeFile = "This is used to convert Skype URL calls to ZAC. It was written and tested for ConnectWise Manage.

The bat file converts the skype call to one accepted by ZAC. 

https://github.com/epiphanyplx/SkypeToZAC"
$ReadMeFile | Out-file -Encoding "ASCII" C:\SkypeToZAC\README.txt

Write-Host -ForegroundColor Green "Completed..."
