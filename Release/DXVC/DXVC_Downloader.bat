@echo off
chcp 65001
setlocal enableextensions enabledelayedexpansion
set homepath=%cd%

goto DepotCheck
::7zip start
:move7
move 7z.exe Requirements
goto 7zipcheck

:7zipcheck
MODE 62,50
if exist "Requirements\7z.exe" (
  goto mainmenu
) else (
  mkdir Requirements
  goto no7zip
)

:no7zip
MODE 78,20
echo ------------------------------------------------------------------------------
echo                              Downloading 7-Zip...
echo ------------------------------------------------------------------------------
curl -L  "https://github.com/SlejmUr/OldR6S/raw/master/Requirements/7z.exe" --output 7z.exe
cls
goto move7
cls
)
::7zip end



:mainmenu
cls
MODE 100,20
echo -----------------------------------------------------------
echo DirectX + VC Redist Downloader
echo -----------------------------------------------------------
echo 0 = Download
echo -----------------------------------------------------------
set /p option="Write 0 here:"

if %option%==0 (
cls
goto dxvcredist
)
goto mainmenu

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
  echo 2
  "Requirements\7z.exe" x -y -o"Requirements\DepotDownloader" "%%I" && del %%I
cls
goto DepotCheck
)

:DepotCheck
cls
if exist "Requirements\DepotDownloader\DepotDownloader.dll" (
  goto DownloadMenu 
) else (
  goto DepotDownloader
)


:dxvcredist
Title DirectX + VC Redist Downloader
MODE 40,10
echo Which one do you want to download?
echo - 0 : Back to Menu
echo - 1 : DirectX
echo - 10 : VC 2010 Redist	
echo - 12 : VC 2012 Redist	
echo - 15 : VC 2015 Redist	
echo - 17 : VC 2017 Redist
set /p downdxvc="Enter Number:"
if %downdxvc%==0 (
cls
goto mainmenu
)
MODE 100,40
set /p username="Enter Steam Username:"


if %downdxvc%==1 (
dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 228990 -manifest 1829726630299308803 -username %username% -remember-password -dir "dxvcredist\DirectX" -validate -max-servers 15 -max-downloads 10
pause
cls
echo Download complete!
echo It's DirectX!
goto mainmenu
)
if %downdxvc%==10 (
dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 228983 -manifest 8124929965194586177 -username %username% -remember-password -dir "dxvcredist\VC_2010_Redist" -validate -max-servers 15 -max-downloads 10
pause
cls
echo Download complete!
echo It's VC 2010 Redist!
goto mainmenu
)
if %downdxvc%==12 (
dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 228984 -manifest 2547553897526095397 -username %username% -remember-password -dir "dxvcredist\VC_2012_Redist" -validate -max-servers 15 -max-downloads 10
pause
cls
echo Download complete!
echo It's VC 2012 Redist!
goto mainmenu
)
if %downdxvc%==15 (
dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 228986 -manifest 8782296191957114623 -username %username% -remember-password -dir "dxvcredist\VC_2015_Redist" -validate -max-servers 15 -max-downloads 10
pause
cls
echo Download complete!
echo It's VC 2015 Redist!
goto mainmenu
)
if %downdxvc%==17 (
dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 228987 -manifest 4302102680580581867 -username %username% -remember-password -dir "dxvcredist\VC_2017_Redist" -validate -max-servers 15 -max-downloads 10
pause
cls
echo Download complete!
echo It's VC 2017 Redist!
goto mainmenu
)
goto dxvcredist
