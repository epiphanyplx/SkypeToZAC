Param
  (
    [Parameter(Mandatory=$false)]
    [string]$uri
  )
  
$number = $uri.replace("skype:","")
$number = $number.replace("?call","")
start-process "C:\Program Files (x86)\Zultys\ZAC\ZAC.exe" call=$number