<#
.Synopsis
   This powershell script will convert skype: URL calls to ZAC.
   This was created to intergrate ZAC with ConnectWise Manage.
.DESCRIPTION
   This script creates/updates the registry keys for skype: URL/Classes and creates a ps1 file in C:\SkypeToZAC.
   The ps1 file is to convert the ConnectWise Manage skype:number?call URL to a ZAC supported format.
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
New-ItemProperty "HKCU:\Software\Classes\skype\shell\open\command" -Name '(Default)' -Value 'mshta vbscript:Execute("CreateObject(""Wscript.Shell"").Run ""powershell -NoLogo -ExecutionPolicy Bypass -Command """"& 'c:\SkypeToZAC\SkypeToZAC.ps1' -uri %1"""""", 0: window.close")' -Force | Out-Null


#Make sure C:\SkypeToZAC folder exists
Write-Host -ForegroundColor Green "Creating Directory C:\SkypeToZAC"
if (!(Test-Path C:\SkypeToZAC)) {New-Item -Type Directory 'C:\SkypeToZAC'}

#Create Bat file
Write-Host -ForegroundColor Green "Downloading .ps1 file"
iwr -URI https://raw.githubusercontent.com/epiphanyplx/SkypeToZAC/master/SkypeToZAC.ps1 -outfile c:\SkypeToZAC\SkypeToZAC.ps1

#Create README File
Write-Host -ForegroundColor Green "Creating README File"
$ReadMeFile = "This is used to convert Skype URL calls to ZAC. It was written and tested for ConnectWise Manage.

The ps1 file converts the skype call to one accepted by ZAC. 

https://github.com/epiphanyplx/SkypeToZAC"
$ReadMeFile | Out-file -Encoding "ASCII" C:\SkypeToZAC\README.txt

Write-Host -ForegroundColor Green "Completed..."
