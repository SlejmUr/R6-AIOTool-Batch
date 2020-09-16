@echo off
setlocal enableextensions enabledelayedexpansion
goto checkerone

:checkerone
reg query HKEY_LOCAL_MACHINE\SOFTWARE\dotnet\Setup\InstalledVersions\x64\sharedhost /v Version /f  3.1.4>nul

if errorlevel 1 (
echo Oh no, you dont have dotnet
goto checkertwo
pause
) else (
echo DotNet One checker is found the version
goto checkertwo
pause
)


:dotnet
echo you need dotnet
start https://dotnet.microsoft.com/download/dotnet-core/thank-you/sdk-3.1.400-windows-x64-installer
pause


:checkertwo
if exist "C:\Program Files\dotnet\dotnet.exe" (
echo DotNet Two checker is found the version
pause
goto end
) else (
goto dotnet
)

:end
exit
