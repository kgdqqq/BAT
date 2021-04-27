@echo off

C:\Windows\System32\ipconfig /all |C:\Windows\System32\FIND.EXE "IPv4 地址" > d:\ip.log
C:\Windows\System32\ipconfig /all |C:\Windows\System32\FIND.EXE "物理地址." > d:\mac.log
for /f "tokens=6" %%b in (d:\ip.log) do (    set a=%%b)
set  get=%a:~0,1%
echo %get%
start d:\ip.log
start d:mac.log