@echo off
taskkill /f /im OneDrive.exe
if exist "%SystemRoot%\SysWOW64\OneDriveSetup.exe" cd /d "%SystemRoot%\SysWOW64\OneDriveSetup.exe /uninstall"
if exist "%SystemRoot%\System32\OneDriveSetup.exe" cd /d "%SystemRoot%\System32\OneDriveSetup.exe /uninstall"


清理OneDrive注册表
REG Delete "HKEY_CLASSES_ROOTCLSID{018D5C66-4533-4307-9B53-224DE2ED1FE6}" /f
REG Delete "HKEY_CLASSES_ROOTWow6432NodeCLSID{018D5C66-4533-4307-9B53-224DE2ED1FE6}" /f



清理OneDrive残留数据
rd "%UserProfile%OneDrive" /Q /S
rd "%LocalAppData%MicrosoftOneDrive" /Q /S
rd "%ProgramData%Microsoft OneDrive" /Q /S
rd "C:OneDriveTemp" /Q /S

