# SkypeToZAC
Forked from SkypeToTeams by CB954: https://github.com/CB954/SkypeToTeams

# Information
The Script creates a bat file in C:\SkypeToZAC. The bat file converts the skype call to one accepted by ZAC. I built this for ConnectWise Manage as it only integrates with Skype - fat client integrated with TAPI as well but ZAC does not support TAPI. The bat file was needed because the call to skype has "?call" on the end of the phone number and ZAC will throw an error.

# Installation
1. Make sure Skype is removed from the computer. Elevated PowerShell Session:
 ```powershell
Get-AppxPackage Microsoft.SkypeApp -AllUsers -ErrorAction SilentlyContinue -WarningAction SilentlyContinue | Remove-AppPackage -AllUsers -ErrorAction SilentlyContinue -WarningAction SilentlyContinue
```
2. Open PowerShell.exe as the logged in user NOT ADMIN and run:.
```powershell
irm https://github.com/epiphanyplx/SkypeToZAC/blob/master/SkypeToZAC.ps1 | iex
```
3. Make sure the tel: url is set to ZAC. You can check this in powershell: 
```powershell
Start-Process "tel:18000000000"
``` 
^If this does not open ZAC then you need to set ZAC as the default app. 
<br>**Windows 10:** Settings>Apps>Default Apps>Choose Default Apps by Protocol find tel and set to ZAC
