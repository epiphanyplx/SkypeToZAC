# SkypeToZAC
Forked from SkypeToTeams by CB954: https://github.com/CB954/SkypeToTeams
<br>Ended up changing it to use mshta as you could still see the popup with previous method.

# Information
The Script creates a ps1 file in C:\SkypeToZAC. The ps1 file converts the skype call to one accepted by ZAC. 
<br>I built this for ConnectWise Manage as it only integrates with Skype - fat client integrates with TAPI as well but ZAC does not support TAPI. The ps1 file was needed because the call to skype has "?call" on the end of the phone number and ZAC will throw an error.

# Installation
1. Open PowerShell.exe and run:.
```powershell
irm https://raw.githubusercontent.com/epiphanyplx/SkypeToZAC/master/SkypeToZACInstall.ps1 | iex
```
2. Make sure the tel: url is set to ZAC. You can check this in powershell: 
```powershell
Start-Process "tel:18000000000"
``` 
^If this does not open ZAC then you need to set ZAC as the default app. 
<br>**Windows 10:** Settings>Apps>Default Apps>Choose Default Apps by Protocol>find tel and set to ZAC
