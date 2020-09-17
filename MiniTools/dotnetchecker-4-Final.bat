@echo off
setlocal enableextensions enabledelayedexpansion
goto checkerone

:checkerone
reg query HKEY_LOCAL_MACHINE\SOFTWARE\dotnet\Setup\InstalledVersions\x64\sharedhost /v Version /f  3.1.4>nul

if errorlevel 1 (
echo Oh no, you dont have dotnet
echo Oh no, you dont have dotnet - %TIME%>>log.log
goto checkertwo
pause
) else (
echo DotNet One checker is found the version
echo DotNet One checker is found the version - %TIME%>>log.log
goto checkertwo
pause
)


:dotnet
echo you need dotnet
echo dotnet downloader started - %TIME%>>log.log
start https://dotnet.microsoft.com/download/dotnet-core/thank-you/sdk-3.1.402-windows-x64-installer
pause


:checkertwo
if exist "C:\Program Files\dotnet\dotnet.exe" (
echo DotNet Two checker is found the version
echo DotNet Two checker is found the version - %TIME%>>log.log
pause
goto end
) else (
goto dotnet
)

:end
exit