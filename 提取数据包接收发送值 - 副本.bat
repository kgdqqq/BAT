@echo off
C:\Windows\System32\PING.EXE -n 4 www.baidu.com|C:\Windows\System32\FIND.EXE "���ݰ�" > d:\bb.log
for /f "tokens=6" %%b in (d:\bb.log) do (    set a=%%b)
set  get=%a:~0,1%
echo %get%