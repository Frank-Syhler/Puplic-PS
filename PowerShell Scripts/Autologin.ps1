$RegPath = "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon"
Set-ItemProperty $RegPath "AutoAdminLogon" -Value "1" -type String
Set-ItemProperty $RegPath "DefaultUserName" -Value "UserAccount" -type String
Set-ItemProperty $RegPath "DefaultPassword" -Value "Password" -type String