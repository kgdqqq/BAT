     @echo off
    
  set "Apply=%*"
    cd /d "%~dp0" && ( if exist "%temp%\getadmin.vbs" del "%temp%\getadmin.vbs" ) && fsutil dirty query %systemdrive% 1>nul 2>nul || (  cmd /u /c echo Set UAC = CreateObject^("Shell.Application"^) : UAC.ShellExecute "cmd.exe", "/k cd ""%~sdp0"" && %~s0 %Apply%", "", "runas", 1 >> "%temp%\getadmin.vbs" && "%temp%\getadmin.vbs" && exit /B )
    color 1f
    title   Windows  ��ͥ�濪�� hyper-v
    pushd "%~dp0"
    setlocal enabledelayedexpansion
    cls
    if /i "%PROCESSOR_IDENTIFIER:~0,3%"=="x86" (
    set "bit=x86"
    ) else (
    set "bit=x64"
        )

    echo ---------------------------------------------------------------
    echo     �ű���֧�� Windows  ���ð棬����  hyper-v    ���������
    echo     ����ϵͳ�������д˽ű���
    echo ---------------------------------------------------------------
    echo     ���������ʼ���� Ctrl+C �˳��ű���
    pause >nul

    cls
    :menu
    echo ---------------------------------------------------------------
    echo     ��ѡ������
    echo ---------------------------------------------------------------
    echo ---------------------------------------------------------------
    echo     [1] ���� hyper-v
    echo     [2] ���� ���������
    echo     [3] �˳��ű�
    echo ---------------------------------------------------------------
    choice /n /c 123 /m "����������ѡ��:"
    cls
    echo ---------------------------------------------------------------
    if errorlevel 3 exit
    if errorlevel 2 goto 153
    if errorlevel 1 goto 152



:152

dir /b %SystemRoot%\servicing\Packages\*Hyper-V*.mum >hyper-v.txt
for /f %%i in ('findstr /i . hyper-v.txt 2^>nul') do dism /online /norestart /add-package:"%SystemRoot%\servicing\Packages\%%i"
del hyper-v.txt
Dism /online /enable-feature /featurename:Microsoft-Hyper-V-All /LimitAccess /ALL
goto menu

:153
dir /b C:\Windows\servicing\Packages\Microsoft-Windows-GroupPolicy-ClientExtensions-Package~3*.mum >List.txt
dir /b C:\Windows\servicing\Packages\Microsoft-Windows-GroupPolicy-ClientTools-Package~3*.mum >>List.txt
for /f %%i in ('findstr /i . List.txt 2^>nul') do dism /online /norestart /add-package:"C:\Windows\servicing\Packages\%%i"
goto menu
