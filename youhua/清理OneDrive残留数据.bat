@echo off
rd "%UserProfile%OneDrive" /Q /S
rd "%LocalAppData%MicrosoftOneDrive" /Q /S
rd "%ProgramData%Microsoft OneDrive" /Q /S
rd "C:OneDriveTemp" /Q /S