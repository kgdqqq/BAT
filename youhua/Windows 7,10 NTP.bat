::Windows 7,10 客户端时间更新脚本NTP(管理员身份运行)  
@ECHO off
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\DateTime\Servers" /ve /t REG_SZ /d 2 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\DateTime\Servers" /v 1 /t REG_SZ /d ntp5.aliyun.com /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\DateTime\Servers" /v 2 /t REG_SZ /d ntp1.aliyun.com /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\W32Time\Parameters" /v NtpServer /t REG_SZ /d 210.72.145.44  /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\W32Time\TimeProviders\NtpClient" /v SpecialPollInterval /t REG_DWORD /d 3600 /f
sc config w32time start= auto
ping -n 3 127.0.0.1 >nul
net stop w32time
ping -n 3 127.0.0.1 >nul
net start w32time
ping -n 3 127.0.0.1 >nul
w32tm /config /manualpeerlist:"ntp1.aliyun.com" /syncfromflags:manual /reliable:yes /update
ping -n 3 127.0.0.1 >nul
w32tm /resync