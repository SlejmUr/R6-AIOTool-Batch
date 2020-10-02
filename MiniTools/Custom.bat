@echo off
setlocal enableextensions enabledelayedexpansion

:mainmenu
MODE 100,40
echo 	CUSTOM Siege Manifest Downloader!
echo 		Please Choose:
echo 	1 - I dont have DepotDownloader
echo 	2 - I have DepotDownloader 
echo 	0 - Quit
set /p version="Enter Selection:"

if %version%==0 (
cls
exit
)
if %version%==1 (
cls
goto 7zipcheck
)
if %version%==2 (
cls
goto IhaveDD
)
goto mainmenu

::7zip start
:7zipcheck
MODE 62,50
if exist "Requirements\7z.exe" (
  goto DepotCheck
) else (
  mkdir Requirements
  goto no7zip
)

:no7zip
MODE 78,20
echo ------------------------------------------------------------------------------
echo                              Downloading 7-Zip...
echo ------------------------------------------------------------------------------
curl -L  "https://github.com/SlejmUr/R6-AIOTool/raw/master/Requirements/7z.exe" --output 7z.exe
cls
goto move7
cls
)

:move7
move 7z.exe Requirements
goto 7zipcheck
::7zip end


::DD start
:DepotCheck
cls
if exist "Requirements\DepotDownloader\DepotDownloader.dll" (
  goto DepotDone 
) else (
  goto DepotDownloader
)

:DepotDownloader
cls
MODE 78,20
echo ------------------------------------------------------------------------------
echo                        Downloading DepotDownloader...
echo ------------------------------------------------------------------------------
curl -L  "https://github.com/SteamRE/DepotDownloader/releases/download/DepotDownloader_2.3.6/depotdownloader-2.3.6.zip" --output depot.zip
cls
goto extractDD

:extractDD
for %%I in ("depot.zip") do (
  echo extractDD
  "Requirements\7z.exe" x -y -o"Requirements\DepotDownloader" "%%I" && del %%I
cls
goto DepotCheck
)
::DD end

:DepotDone
MODE 100,40
echo Your DepotDownloader is Downloaded!
pause
cls
goto mainmenu


:IhaveDD
MODE 100,40
echo What DepotDownloader you have?
echo 0 - Back
echo 1 - I use Shey Tool
echo 2 - I use AIO-Tool
echo 3 - Downloaded with this tool
set /p version="Enter Selection:"

if %version%==0 (
cls
goto mainmenu
)
if %version%==1 (
cls
goto Shey-Tool
)
if %version%==2 (
cls
goto AIO-Tool
)
if %version%==3 (
cls
goto DDWithThis
)
goto IhaveDD

:DDWithThis
echo Use valid DepotID;manifestID and name!
set /p depotID="DepotID:"
set /p manifestID="manifestID:"
set /p username="Enter Steam Username:"
dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot %depotID% -manifest %manifestID% -username %username% -remember-password -dir "Downloads\TEST" -validate -max-servers 15 -max-downloads 10
pause
cls
echo Custom Manifest!
goto mainmenu

:Shey-Tool
echo Use valid DepotID;manifestID and name!
set /p depotID="DepotID:"
set /p manifestID="manifestID:"
set /p username="Enter Steam Username:"
dotnet Resources\DepotDownloader.dll -app 359550 -depot %depotID% -manifest %manifestID% -username %username% -remember-password -dir "Downloads\TEST" -validate -max-servers 15 -max-downloads 10
pause
cls
echo Custom Manifest!
goto mainmenu

:AIO-Tool
echo Use valid DepotID;manifestID and name!
set /p depotID="DepotID:"
set /p manifestID="manifestID:"
set /p username="Enter Steam Username:"
dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot %depotID% -manifest %manifestID% -username %username% -remember-password -dir "Downloads\TEST" -validate -max-servers 15 -max-downloads 10
pause
cls
echo Custom Manifest!
goto mainmenu