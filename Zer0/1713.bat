@shift /0

::ignore this above its for batch to exe conversion

@echo off
setlocal enableextensions
setlocal enabledelayedexpansion
set homepath=%cd%
set username=

::                        +hmNNNmh+    
::                       yMMMMMMMMMy  
::                       mMMMh hMMMd  
::                       mMMMh:oso:.  
::                       mMMMMMMMMMs  
::                       mMMNdNNhmMd  
::                       mMMs  `-sMd  
::          Rainbow Six  mMMy smMMMd    
::     Modding Community mMMy mMMMMd  
::                       hMMy.NMMMMy  discord.gg/u7PBEr7
::                       `ohmNMNmh+   
:: Zer0Bytes#4428 https://i.imgur.com/nBKIDOX.png

set r6manifestversion=2.4.9.5
set discord=discord.gg/EvrGzAV / discord.gg/q8ZmEzE

:: Exe Config 
:: Product Name :  R6 Manifest Tool
:: Version : 2.4.9.2
:: Copyright : Zer0Bytes#4428
:: Company : R6 Modding Community discord.gg/q8ZmEzE
:: Description : Tool Designed to Download Older Versions of R6

echo ------------------------------------->>log.log
echo Started R6 Manifest Tool (%r6manifestversion%)>>log.log
echo ------------------------------------->>log.log
echo.>>log.log

mkdir "Resources"
echo going to dotnetcheck // %TIME%>>log.log
goto dotnetcheck
::setup-x86_64.exe -P --packages curl

:7zipcheck
Title R6 Manifest Tool - Checking 7zip....
echo checking 7zip // %TIME%>>log.log
if exist "Resources\7z.exe" (
echo 7zip exists going to mainmenu // %TIME%>>log.log
goto mainmenu

) else (
Title R6 Manifest Tool - Downloading 7zip....
echo 7zip not detected starting download // %TIME%>>log.log
MODE 78,20
echo ------------------------------------------------------------------------------
echo                              Downloading 7-Zip...
echo ------------------------------------------------------------------------------
curl -L  "https://github.com/DataCluster0/R6TBBatchTool/raw/master/Requirements/7z.exe" --output 7z.exe
echo Moving 7z.exe to Resources // %TIME%>>log.log
move "7z.exe" "Resources"
goto mainmenu
)


:downloaddotnet 
echo install .NET Core Runtime prompt // %TIME%>>log.log
MODE 40,10
echo ---------------------------------------
echo      Install .NET Core Runtime !!
echo ---------------------------------------
echo      Press Space after install
echo      Then Launch The Tool Again
echo ---------------------------------------
start www.tinyurl.com/dotnetruntimer6
pause
echo ------------------------------------->>log.log
echo Closed R6 Manifest Tool Reason : .NET Core Runtime install // %TIME%>>log.log
echo ------------------------------------->>log.log
exit



:dotnetcheck
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\dotnet\Setup\InstalledVersions\x64\sharedhost" /v Version 2>nul
if errorlevel 1 (
    ::clscls
    echo .NET Core Runtime = not installed // %TIME%>>log.log
    goto downloaddotnet
    
) else (
  ::clscls
  echo .NET Core Runtime = Installed // %TIME%>>log.log
    goto 7zipcheck
)


::test










:mainmenu
cls
MODE 60,20
Title R6 Manifest Tool
echo ----------------------------NOTES---------------------------[93m
curl -L  "https://raw.githubusercontent.com/DataCluster0/R6TBBatchTool/master/Requirements/notes"
echo.[0m
echo Got Patchnotes // %TIME%>>log.log
echo ---------------------------SELECT---------------------------
echo  Discord    : [94m%discord%[0m 
echo  Version    : [92m%r6manifestversion%[0m
echo  Steam User : [96m%username%[0m
echo ---------------------------SELECT---------------------------
echo  [92m1 // [93mDepotDownloader
echo  [92m2 // [93mis Battleye Running?
echo  [92m3 // Hack The Star System[0m
echo ------------------------------------------------------------
echo  [92m4 // [93mChange LOGIN Steam Username[0m ([31mRequired[0m)
::echo  5 = Change Username (codex)
echo ------------------------------------------------------------
set /p mainmenu2="Enter Number : "


if %mainmenu2%==1 (
  echo Selected DepotDownloader // %TIME%>>log.log
  goto DepotCheck
  cls
)

if %mainmenu2%==2 (
  echo Selected isBattleyeRunning? // %TIME%>>log.log
  goto BattleyeCheck
  cls
)


::funny video
if %mainmenu2%==3 (
  echo Selected funny haha // %TIME%>>log.log
  ::change funny haha here
  start www.youtube.com/embed/kYlhqcwhKfc?autoplay=1
  cls
  goto mainmenu
)
::steam user
if %mainmenu2%==4 (
  goto steamusername
  cls
)

@echo off
if %mainmenu2%==blue (
  start /min www.youtube.com/embed/KPSeTM4Rn98?autoplay=1
  cls
goto mainmenu
)


::codex ini check and change
::if %mainmenu2%==5 (
::  goto changenamecodex
::  cls
::)
::------------------------------------------------change steam user



::choose steam username
:steamusername
Title R6 Manifest Tool - Select Steam User
echo Selecting Steam User // %TIME%>>log.log
set username=
set /p username="Enter Steam Username : "
echo Set Steam User Going Back to MainMenu // %TIME%>>log.log
goto mainmenu



:BattleyeCheck
Title IsBattleyeRunning?
MODE 31,10
set EXE=RainbowSix_BE.exe
FOR /F %%x IN ('tasklist /NH /FI "IMAGENAME eq %EXE%"') DO IF %%x == %EXE% goto ProcessFound
goto ProcessNotFound
:ProcessFound
cls
Title IsBattleyeRunning?
echo BattleyeCheck = On  // %TIME%>>log.log
echo ------------------------------
echo    Battleye is running
echo ------------------------------
pause
goto mainmenu
:ProcessNotFound
Title IsBattleyeRunning?
cls
echo BattleyeCheck = Off  // %TIME%>>log.log
echo ------------------------------
echo    Battleye is not running
echo ------------------------------
pause
goto mainmenu


:downloaddepotdownloader
Title R6 Manifest Tool - Downloading Depot Downloader.....
cls
MODE 78,20
echo Downloading DepotDownloader (depot.zip)  // %TIME%>>log.log
echo ------------------------------------------------------------------------------
echo                        Downloading DepotDownloader...
echo ------------------------------------------------------------------------------
curl -L  "https://github.com/SteamRE/DepotDownloader/releases/download/DepotDownloader_2.3.6/depotdownloader-2.3.6.zip" --output depot.zip
echo Downloaded DepotDownloader (depot.zip)  // %TIME%>>log.log
cls
Title R6 Manifest Tool - Extracting Depot Downloader....
for %%I in ("depot.zip") do (
  echo Extracting depot.zip to "Resources\DepotDownloader"   // %TIME%>>log.log
  "Resources\7z.exe" x -y -o"Resources\DepotDownloader" "%%I" && del %%I
cls
echo Extracted DepotDownloader Going Back to DepotCheck // %TIME%>>log.log
goto DepotCheck
)



:DepotCheck
Title R6 Manifest Tool - Checking Depot Downloader....
cls
echo Checking if DepotDownload Exists  // %TIME%>>log.log
if exist "Resources\DepotDownloader\DepotDownloader.dll" (
  echo DepotDownloader Exists going to verifieddepotcheck  // %TIME%>>log.log
  ::return back to start
  goto verifieddepotcheck 
) else (
  ::download depot downloader
  echo Depot Downloader Does Not Exist Going To downloaddepotdownloader // %TIME%>>log.log
  goto downloaddepotdownloader
)




:::codexcheck
::set filelocation=
::if exist "R6Downloads\Y1S0_Vanilla\CODEX.ini" (
::  set filelocation="R6Downloads\Y1S0_Vanilla\CODEX.ini"
::  echo Set Codex Location : "%filelocation%" // %TIME%>>log.log
::  echo 1>>log.log
::  goto changenamecodex 
::) 
::if exist "R6Downloads\Y1S3_SkullRain\CODEX.ini" (
::  set filelocation="R6Downloads\Y1S3_SkullRain\CODEX.ini"
::  echo Set Codex Location : "%filelocation%" // %TIME%>>log.log
::  echo 2>>log.log
::  goto changenamecodex 
::)
::if exist "R6Downloads\Y2S3_BloodOrchid\CODEX.ini" (
::  set filelocation="R6Downloads\Y2S3_BloodOrchid\CODEX.ini"
::  echo Set Codex Location : "%filelocation%" // %TIME%>>log.log
::  echo 3>>log.log
::  goto changenamecodex 
::)
::if exist "R6Downloads\Y3S1_Chimera_Outbreak\CODEX.ini" (
::  set filelocation="R6Downloads\Y3S1_Chimera_Outbreak\CODEX.ini"
::  echo 4>>log.log
::  echo Set Codex Location : "%filelocation%" // %TIME%>>log.log
::  goto changenamecodex 
::)
::if exist "R6Downloads\Y4S2_PhantomSight_Showdown\CODEX.ini" (
::  set  filelocation="R6Downloads\Y4S2_PhantomSight_Showdown\CODEX.ini"
::  echo 5>>log.log
::  echo Set Codex Location : "%filelocation%" // %TIME%>>log.log
::  echo File found
::  goto changenamecodex 
::) else (
::  echo No Codex Locations Found // %TIME%>>log.log
::  echo ----------------------------------------------
::  echo Codex Locations not found.
::  echo ----------------------------------------------
::  pause
::  goto mainmenu
::)
::
::
:::changenamecodex
::





::cls
::
:::changename confirm
::set /p inputname="Enter Ingame name: "
::
:: IF "%inputname%"=="" ( 
::   echo Set Codex Name Was Invalid : "%inputname%" // %TIME%>>log.log
::    echo Can't be nothing 
::	pause
::    goto :changenamecodex
::) ELSE (
::  echo Set Codex Name Was valid : "%inputname%" // %TIME%>>log.log
::    set Incodexname=%inputname%
::    goto codexchangenameevent
::)
::
::
::
:::codexchangenameevent


::last here
::implement codex system here and above







:menudepot
goto DepotCheck
:verifieddepotcheck
iF [%username%]==[] (
MODE 46,5
echo You need set a steam username in the main menu
pause
cls
goto mainmenu             
) else (
  goto continuedepot
)
:continuedepot
Title R6 Manifest Tool - Depot Downloader
MODE 49,40
echo [0m-------------------------------------------------[0m
echo # [92m1 // [0mBack To Main Menu
echo [0m-------------------------------------------------[0m
echo # [92minfo // [0minstalled versions ([93mR6Downloads[0m)
echo # [92mfix // [0mReDownload Binaries / Data
echo [0m-------------------------------------------------[0m
echo # [92m2  // [0mLanguages and High Res Textures
echo [0m-------------------------------------------------[0m
:: y1
echo # [92m3  // [37mVanilla [92m 1.0[0m 
echo # [92m4  // [37mBlack Ice[0m
echo # [92m5  // [37mDust Line[0m
echo # [92m6  // [37mSkull Rain [92m 4.2[0m
echo # [92m7  // [37mRed Crow[0m
echo [0m-------------------------------------------------[0m
::y2
echo # [92m8  // [94mVelvet Shell[0m
echo # [92m9  // [94mOperation Health[0m
echo # [92m10 // [94mBlood Orchid [92m 2.3.1.1[0m
echo # [92m11 // [94mWhite Noise[0m
echo [0m-------------------------------------------------[0m
::y3
echo # [92m12 // [32mChimera [92m 3.1.0[0m ([93mOutbreak[0m)
echo # [92m13 // [32mPara Bellum[0m
echo # [92m14 // [32mGrim Sky[0m ([93mMad House[0m)
echo # [92m15 // [32mWind Bastion[0m
echo [0m-------------------------------------------------[0m
::y4
echo # [92m16 // [96mBurnt Horizon [92m 4.1.0[0m ([93mRainbow Is Magic[0m)
echo # [92m17 // [96mPhantom Sight [92m 4.2.0[0m ([93mShowdown[0m)
echo # [92m18 // [96mEmber Rise [0m ([93mDoktors Curse[0m)
echo # [92m19 // [96mShifting Tides [0m ([93mStadium[0m)
echo [0m-------------------------------------------------[0m
::y5
echo # [92m20 // [91mVoid Edge [0m ([93mGrand Larceny / Golden Gun[0m)
echo # [92m21 // [91mSteel Wave [92m 5.3.0[0m ([93mMute Protocol[0m)
echo # [92m22 // [91mSteel Wave [92m 5.3.1.1[0m ([93mOmega/Mute Protocol[0m)
echo [0m-------------------------------------------------[0m
set /p selectversiontodownload="Enter Number : "




if %selectversiontodownload%==info ( 
cls
goto info
)

if %selectversiontodownload%==fix ( 
cls
goto redownload
)

if %selectversiontodownload%==1 ( 
cls

goto mainmenu
)

if %selectversiontodownload%==2 ( 
cls
goto Languages
)












::------------------------------------------------------------------------------------------------depots

::vanila 1.0
if %selectversiontodownload%==3 (
Title Downloading Vanilla 1.0.....
echo Download Started For Vanilla 1.0  // %TIME%>>log.log
MODE 120,20
dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 8358812283631269928 -username %username% -remember-password -dir "R6Downloads\Y1S0_Vanilla" -validate -max-servers 15 -max-downloads 10
dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 3893422760579204530 -username %username% -remember-password -dir "R6Downloads\Y1S0_Vanilla" -validate -max-servers 15 -max-downloads 10
  echo Vanilla 1.0 Download Finished  // %TIME%>>log.log
goto downloadcomplete
)


::Black Ice
if %selectversiontodownload%==4 ( 
  Title Downloading Black Ice.....
echo Download Started For Black Ice  // %TIME%>>log.log
MODE 120,20
dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 5188997148801516344 -username %username% -remember-password -dir "R6Downloads\Y1S1_BlackIce" -validate -max-servers 15 -max-downloads 10
dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 7932785808040895147 -username %username% -remember-password -dir "R6Downloads\Y1S1_BlackIce" -validate -max-servers 15 -max-downloads 10
  echo Black Ice Download Finished  // %TIME%>>log.log
goto downloadcomplete
)

::Dust Line
if %selectversiontodownload%==5 ( 
  Title Downloading Dust Line.....
echo Download Started For Dust Line  // %TIME%>>log.log
MODE 120,20
dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 2303064029242396590 -username %username% -remember-password -dir "R6Downloads\Y1S2_DustLine" -validate -max-servers 15 -max-downloads 10
dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 2206497318678061176 -username %username% -remember-password -dir "R6Downloads\Y1S2_DustLine" -validate -max-servers 15 -max-downloads 10
  echo Dust Line Download Finished  // %TIME%>>log.log
goto downloadcomplete
)


::Skull Rain 4.2
if %selectversiontodownload%==6 ( 
  Title Downloading Skull Rain.....
echo Download Started For Skull Rain  // %TIME%>>log.log
MODE 120,20
dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 5819137024728546741 -username %username% -remember-password -dir "R6Downloads\Y1S3_SkullRain" -validate -max-servers 15 -max-downloads 10
dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 5851804596427790505 -username %username% -remember-password -dir "R6Downloads\Y1S3_SkullRain" -validate -max-servers 15 -max-downloads 10
  echo Skull Rain Download Finished  // %TIME%>>log.log
goto downloadcomplete
)

::Red Crow
if %selectversiontodownload%==7 ( 
  Title Downloading Red Crow.....
echo Download Started For Red Crow  // %TIME%>>log.log
MODE 120,20
dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 3576607363557872807 -username %username% -remember-password -dir "R6Downloads\Y1S4_RedCrow" -validate -max-servers 15 -max-downloads 10
dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 8569920171217002292 -username %username% -remember-password -dir "R6Downloads\Y1S4_RedCrow" -validate -max-servers 15 -max-downloads 10
  echo Red Crow Download Finished  // %TIME%>>log.log
goto downloadcomplete
)

::Velvet Shell
if %selectversiontodownload%==8 ( 
  Title Downloading Velvet Shell.....
echo Download Started For Velvet Shell  // %TIME%>>log.log
MODE 120,20
dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 2248734317261478192 -username %username% -remember-password -dir "R6Downloads\Y2S1_VelvetShell" -validate -max-servers 15 -max-downloads 10
dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 8006071763917433748 -username %username% -remember-password -dir "R6Downloads\Y2S1_VelvetShell" -validate -max-servers 15 -max-downloads 10
  echo Velvet Shell Download Finished  // %TIME%>>log.log
goto downloadcomplete
)


::Operation Health
if %selectversiontodownload%==9 ( 
  Title Downloading Operation Health.....
echo Download Started For Operation Health  // %TIME%>>log.log
MODE 120,20
dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 5875987479498297665 -username %username% -remember-password -dir "R6Downloads\Y2S2_Health_FixingAndRepairingTheGame" -validate -max-servers 15 -max-downloads 10
dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 708773000306432190 -username %username% -remember-password -dir "R6Downloads\Y2S2_Health_FixingAndRepairingTheGame" -validate -max-servers 15 -max-downloads 10
  echo Operation Health Download Finished  // %TIME%>>log.log
goto downloadcomplete
)

::Blood Orchid 2.3.1.1
if %selectversiontodownload%==10 (
  Title Downloading Blood Orchid.....
  echo Download Started For Blood Orchid  // %TIME%>>log.log
  MODE 120,20
dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 6708129824495912434 -username %username% -remember-password -dir "R6Downloads\Y2S3_BloodOrchid" -validate -max-servers 15 -max-downloads 10
dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 1613631671988840841 -username %username% -remember-password -dir "R6Downloads\Y2S3_BloodOrchid" -validate -max-servers 15 -max-downloads 10
  echo Blood Orchid Download Finished  // %TIME%>>log.log
goto downloadcomplete
)

::White Noise
if %selectversiontodownload%==11 (
  Title Downloading White Noise.....
  echo Download Started For White Noise  // %TIME%>>log.log
  MODE 120,20
dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 8748734086032257441 -username %username% -remember-password -dir "R6Downloads\Y2S4_WhiteNoise" -validate -max-servers 15 -max-downloads 10
dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 4221297486420648079 -username %username% -remember-password -dir "R6Downloads\Y2S4_WhiteNoise" -validate -max-servers 15 -max-downloads 10
  echo White Noise Download Finished  // %TIME%>>log.log
goto downloadcomplete
)

::Chimera 3.1.0 
if %selectversiontodownload%==12 (
 Title Downloading Chimera....
 echo Download Started For Chimera  // %TIME%>>log.log
 MODE 120,20
dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 5071357104726974256 -username %username% -remember-password -dir "R6Downloads\Y3S1_Chimera_Outbreak" -validate -max-servers 15 -max-downloads 10
dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 4701787239566783972 -username %username% -remember-password -dir "R6Downloads\Y3S1_Chimera_Outbreak" -validate -max-servers 15 -max-downloads 10
  echo Chimera Download Finished  // %TIME%>>log.log
goto downloadcomplete
)

::Para Bellum
if %selectversiontodownload%==13 (
Title Downloading Para Bellum.....
echo Download Started For Para Bellum // %TIME%>>log.log
MODE 120,20
dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 8312108283310615233 -username %username% -remember-password -dir "R6Downloads\Y3S2_ParaBellum" -validate -max-servers 15 -max-downloads 10
dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 8765715607275074515 -username %username% -remember-password -dir "R6Downloads\Y3S2_ParaBellum" -validate -max-servers 15 -max-downloads 10
  echo Para Bellum Download Finished  // %TIME%>>log.log
goto downloadcomplete
)

::Grim Sky
if %selectversiontodownload%==14 (
Title Downloading Grim Sky.....
echo Download Started For Grim Sky // %TIME%>>log.log
MODE 120,20
dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 5562094852451837435 -username %username% -remember-password -dir "R6Downloads\Y3S3_GrimSky_MadHouse" -validate -max-servers 15 -max-downloads 10
dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 7781202564071310413 -username %username% -remember-password -dir "R6Downloads\Y3S3_GrimSky_MadHouse" -validate -max-servers 15 -max-downloads 10
  echo Para Bellum Download Finished  // %TIME%>>log.log
goto downloadcomplete
)


::Windbastion
if %selectversiontodownload%==15 (
Title Downloading Wind Bastion.....
echo Download Started For Wind Bastion // %TIME%>>log.log
MODE 120,20
dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 6502258854032233436 -username %username% -remember-password -dir "R6Downloads\Y3S4_WindBastion" -validate -max-servers 15 -max-downloads 10
dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 7659555540733025386 -username %username% -remember-password -dir "R6Downloads\Y3S4_WindBastion" -validate -max-servers 15 -max-downloads 10
  echo Wind Bastion Download Finished  // %TIME%>>log.log
goto downloadcomplete
)

::Burnt Horizon 4.1.0
if %selectversiontodownload%==16 (
Title Downloading Burnt Horizon.....
echo Download Started For Burnt Horizon // %TIME%>>log.log
MODE 120,20
dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 8356277316976403078 -username %username% -remember-password -dir "R6Downloads\Y4S1_BurntHorizon_RainbowisMagic" -validate -max-servers 15 -max-downloads 10
dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 5935578581006804383 -username %username% -remember-password -dir "R6Downloads\Y4S1_BurntHorizon_RainbowisMagic" -validate -max-servers 15 -max-downloads 10
  echo Burnt Horizon Download Finished  // %TIME%>>log.log
goto downloadcomplete
)


::Phantom Sight 4.2.0
if %selectversiontodownload%==17 (
  Title Downloading Phantom Sight.....
  echo Download Started For Phantom Sight  // %TIME%>>log.log
  MODE 120,20
dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 693082837425613508 -username %username% -remember-password -dir "R6Downloads\Y4S2_PhantomSight_Showdown" -validate -max-servers 15 -max-downloads 10
dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 5408324128694463720 -username %username% -remember-password -dir "R6Downloads\Y4S2_PhantomSight_Showdown" -validate -max-servers 15 -max-downloads 10
  echo Phantom Sight Download Finished  // %TIME%>>log.log
goto downloadcomplete
)


:: Ember Rise
if %selectversiontodownload%==18 (
  Title Downloading Ember Rise.....
  echo Download Started For Ember Rise  // %TIME%>>log.log
  MODE 120,20
dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 3546781236735558235 -username %username% -remember-password -dir "R6Downloads\Y4S3_EmberRise_DoktorsCurse" -validate -max-servers 15 -max-downloads 10
dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 7869081741739849703 -username %username% -remember-password -dir "R6Downloads\Y4S3_EmberRise_DoktorsCurse" -validate -max-servers 15 -max-downloads 10
  echo Ember Rise Download Finished  // %TIME%>>log.log
goto downloadcomplete
)


:: shifting tides
if %selectversiontodownload%==19 (
  Title Downloading Shifting Tides.....
  echo Download Started For Shifting Tides  // %TIME%>>log.log
  MODE 120,20
dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 299124516841461614 -username %username% -remember-password -dir "R6Downloads\Y4S4_ShiftingTides_Stadium" -validate -max-servers 15 -max-downloads 10
dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 1842268638395240106 -username %username% -remember-password -dir "R6Downloads\Y4S4_ShiftingTides_Stadium" -validate -max-servers 15 -max-downloads 10
  echo Shifting Tides Download Finished  // %TIME%>>log.log
goto downloadcomplete
)


:: void edge
if %selectversiontodownload%==20 (
  Title Downloading Void Edge.....
  echo Download Started For Void Edge  // %TIME%>>log.log
  MODE 120,20
dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 1378283477131353042 -username %username% -remember-password -dir "R6Downloads\Y5S1_VoidEdge_GangDestruction" -validate -max-servers 15 -max-downloads 10
dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 1739364586766771991 -username %username% -remember-password -dir "R6Downloads\Y5S1_VoidEdge_GangDestruction" -validate -max-servers 15 -max-downloads 10
  echo Void Edge Download Finished  // %TIME%>>log.log
goto downloadcomplete
)


:: steel wave Y5S2.3.0_C5433707_D1028748_S38774_14603060
if %selectversiontodownload%==21 (
  Title Downloading Steel Wave.....
  echo Download Started For Steel Wave  // %TIME%>>log.log
  MODE 120,20
dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 2287849678928593252 -username %username% -remember-password -dir "R6Downloads\Y5S2_SteelWave_Morphues" -validate -max-servers 15 -max-downloads 10
dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 1610834739284564851 -username %username% -remember-password -dir "R6Downloads\Y5S2_SteelWave_Morphues" -validate -max-servers 15 -max-downloads 10
  echo Steel Wave Download Finished  // %TIME%>>log.log
  goto downloadcomplete
)

:: steel wave Y5S2.3.1.1pc_C5493616_D1043836_S38774_14664131
if %selectversiontodownload%==22 (
  Title Downloading Steel Wave v2.3.1.1.....
  echo Download Started For Steel Wave v2.3.1.1  // %TIME%>>log.log
  MODE 120,20
dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 4367817844736324940 -username %username% -remember-password -dir "R6Downloads\Y5S2_SteelWave_Morphues_V2311" -validate -max-servers 15 -max-downloads 10
dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 893971391196952070 -username %username% -remember-password -dir "R6Downloads\Y5S2_SteelWave_Morphues_V2311" -validate -max-servers 15 -max-downloads 10
  echo Steel Wave v2.3.1.1 Download Finished  // %TIME%>>log.log
  goto downloadcomplete
)


:downloadcomplete
cls
  echo ---------------------------------------
  echo          Download Complete
  echo ---------------------------------------
pause
cls
goto menudepot




::-----------------------------------------------------------------------info
:info
echo ------------------------------------->>log.log
echo Started Version Check // %TIME%>>log.log
echo ------------------------------------->>log.log
echo.>>log.log
cls
echo ----------------------------------------------
goto chainstart

::call version chain
:chainstart
::y1
:chain1
if exist "R6Downloads\Y1S0_Vanilla\RainbowSix.exe" (
  echo "Vanilla = installed">>log.log
  echo [[92m+[0m] Vanilla        // installed
  goto chain2
) else (
  echo "Vanilla = not installed">>log.log
  echo [[91m-[0m] Vanilla        // not installed
  goto chain2
)
:chain2
if exist "R6Downloads\Y1S1_BlackIce\RainbowSix.exe" (
  echo "Black Ice = installed">>log.log
  echo [[92m+[0m] Black Ice      // installed
  goto chain3
) else (
  echo "Black Ice = not installed">>log.log
  echo [[91m-[0m] Black Ice      // not installed
  goto chain3
)
:chain3
if exist "R6Downloads\Y1S2_DustLine\RainbowSix.exe" (
  echo "Dust Line = installed">>log.log
  echo [[92m+[0m] Dust Line      // installed
  goto chain4
) else (
  echo "Dust Line = not installed">>log.log
  echo [[91m-[0m] Dust Line      // not installed
  goto chain4
)
:chain4
if exist "R6Downloads\Y1S3_SkullRain\RainbowSix.exe" (
  echo "Skull Rain = installed">>log.log
  echo [[92m+[0m] Skull Rain     // installed
  goto chain5
) else (
  echo "Skull Rain = not installed">>log.log
  echo [[91m-[0m] Skull Rain     // not installed
  goto chain5
)
:chain5
if exist "R6Downloads\Y1S4_RedCrow\RainbowSix.exe" (
  echo "Red Crow = installed">>log.log
  echo [[92m+[0m] Red Crow       // installed
  goto chain6
) else (
  echo "Red Crow = not installed">>log.log
  echo [[91m-[0m] Red Crow       // not installed
  goto chain6
)
::y2
:chain6
if exist "R6Downloads\Y2S1_VelvetShell\RainbowSix.exe" (
  echo "Velvet Shell = installed">>log.log
  echo [[92m+[0m] Velvet Shell   // installed
  goto chain7
) else (
  echo "Velvet Shell = not installed">>log.log
  echo [[91m-[0m] Velvet Shell   // not installed
  goto chain7
)
:chain7
if exist "R6Downloads\Y2S2_Health_FixingAndRepairingTheGame\RainbowSix.exe" (
  echo "Health = installed">>log.log
  echo [[92m+[0m] Health         // installed
  goto chain8
) else (
  echo "Health = not installed">>log.log
  echo [[91m-[0m] Health         // not installed
  goto chain8
)
:chain8
if exist "R6Downloads\Y2S3_BloodOrchid\RainbowSix.exe" (
  echo "Blood Orchid = installed">>log.log
  echo [[92m+[0m] Blood Orchid   // installed
  goto chain9
) else (
  echo "Blood Orchid = not installed">>log.log
  echo [[91m-[0m] Blood Orchid   // not installed
  goto chain9
)
:chain9
if exist "R6Downloads\Y2S4_WhiteNoise\RainbowSix.exe" (
  echo "White Noise = installed">>log.log
  echo [[92m+[0m] White Noise    // installed
  goto chain10
) else (
  echo "White Noise = not installed">>log.log
  echo [[91m-[0m] White Noise    // not installed
  goto chain10
)
::y3
:chain10
if exist "R6Downloads\Y3S1_Chimera_Outbreak\RainbowSix.exe" (
  echo "Chimera = installed">>log.log
  echo [[92m+[0m] Chimera        // installed
  goto chain11
) else (
  echo "Chimera = not installed">>log.log
  echo [[91m-[0m] Chimera        // not installed
  goto chain11
)
:chain11
if exist "R6Downloads\Y3S2_ParaBellum\RainbowSix.exe" (
  echo "Para Bellum = installed">>log.log
  echo [[92m+[0m] Para Bellum    // installed
  goto chain12
) else (
  echo "Para Bellum = not installed">>log.log
  echo [[91m-[0m] Para Bellum    // not installed
  goto chain12
)
:chain11
if exist "R6Downloads\Y3S3_GrimSky_MadHouse\RainbowSix.exe" (
  echo "Grim Sky = installed">>log.log
  echo [[92m+[0m] Grim Sky       // installed
  goto chain12
) else (
  echo "Grim Sky = not installed">>log.log
  echo [[91m-[0m] Grim Sky       // not installed
  goto chain12
)
:chain12
if exist "R6Downloads\Y3S4_WindBastion\RainbowSix.exe" (
  echo "Wind Bastion = installed">>log.log
  echo [[92m+[0m] Wind Bastion   // installed
  goto chain13
) else (
  echo "Wind Bastion = not installed">>log.log
  echo [[91m-[0m] Wind Bastion   // not installed
  goto chain13
)
::y4
:chain13
if exist "R6Downloads\Y4S1_BurntHorizon_RainbowisMagic\RainbowSix.exe" (
  echo "Burnt Horizon = installed">>log.log
  echo [[92m+[0m] Burnt Horizon  // installed
  goto chain14
) else (
  echo "Burnt Horizon = not installed">>log.log
  echo [[91m-[0m] Burnt Horizon  // not installed
  goto chain14
)
:chain14
if exist "R6Downloads\Y4S2_PhantomSight_Showdown\RainbowSix.exe" (
  echo "Phantom Sight = installed">>log.log
  echo [[92m+[0m] Phantom Sight  // installed
  goto chain15
) else (
  echo "Phantom Sight = not installed">>log.log
  echo [[91m-[0m] Phantom Sight  // not installed
  goto chain15
)
:chain15
if exist "R6Downloads\Y4S3_EmberRise_DoktorsCurse\RainbowSix.exe" (
  echo "Ember Rise = installed">>log.log
  echo [[92m+[0m] Ember Rise     // installed
  goto chain16
) else (
  echo "Ember Rise = not installed">>log.log
  echo [[91m-[0m] Ember Rise     // not installed
  goto chain16
)
:chain16
if exist "R6Downloads\Y4S4_ShiftingTides_Stadium\RainbowSix.exe" (
  echo "Shifting Tides = installed">>log.log
  echo [[92m+[0m] Shifting Tides // installed
  goto chain17
) else (
  echo "Shifting Tides = not installed">>log.log
  echo [[91m-[0m] Shifting Tides // not installed
  goto chain17
)
::y5
:chain17
if exist "R6Downloads\Y5S1_VoidEdge_GangDestruction\RainbowSix.exe" (
  echo "Void Edge = installed">>log.log
  echo [[92m+[0m] Void Edge      // installed
  goto chain18
) else (
  echo "Void Edge = not installed">>log.log
  echo [[91m-[0m] Void Edge      // not installed
  goto chain18
)
:chain18
if exist "R6Downloads\Y5S2_SteelWave_Morphues\RainbowSix.exe" (
  echo "Steel Wave = installed">>log.log
  echo [[92m+[0m] Steel Wave     // installed
  goto chain19
) else (
  echo "Steel Wave = not installed">>log.log
  echo [[91m-[0m] Steel Wave     // not installed
  goto chain19
)

:chain19
if exist "R6Downloads\Y5S2_SteelWave_Morphues_V2311\RainbowSix.exe" (
  echo "Steel Wave V2.3.1.1 = installed">>log.log
  echo [[92m+[0m] SW V2.3.1.1    // installed
  goto chainend
) else (
  echo "Steel Wave V2.3.1.1 = not installed">>log.log
  echo [[91m-[0m] SW V2.3.1.1    // not installed
  goto chainend
)




:chainend
echo ----------------------------------------------
echo ------------------------------------->>log.log
echo.>>log.log
echo Chain End // %TIME%>>log.log
pause
cls
echo Chain Going to Mainmenu // %TIME%>>log.log
goto menudepot


::-----------------------------------------------------------------------info chain end





:Languages
Title R6 Manifest Tool - Languages and HD Textures
MODE 46,20
echo ----------------------------------------------
echo # 1 - Back To Version Downloader
echo ----------------------------------------------
echo       HD Texture and Language select
echo ----------------------------------------------
echo # 2 = Vanilla 
echo # 3 = Blood Orchid
echo # 4 = Chimera
echo # 5 = Burnt Horizon
echo # 6 = Phantom Sight
echo ----------------------------------------------
set /p selectLanguages="Enter Number : "

if %selectLanguages%==1 (
  goto menudepot
)




if %selectLanguages%==2 (
  goto vanillags1
)

if %selectLanguages%==3 (
  goto bloordorchidlags
)

if %selectLanguages%==4 (
  goto chimeralangs
)


if %selectLanguages%==5 (
  goto burnthorizonlangs
)


if %selectLanguages%==6 (
  goto phantomsightlangs 
)




:vanillags1
Title R6 Manifest Tool - Languages and HD Textures
MODE 46,20
echo ----------------------------------------------
echo # 1 - Back To Languages and HD Textures
echo ----------------------------------------------
echo # 2 = Vanilla HD Textures  
echo # 3 = Vanilla German 
echo # 4 = Vanilla Spanish 
echo # 5 = Vanilla Brazilian
echo # 6 = Vanilla Japanese 
echo # 7 = Vanilla Russian 
echo # 8 = Vanilla French 
echo # 9 = Vanilla italian 
echo ----------------------------------------------
set /p vanillangs="Enter Number : "


if %vanillangs%==1 (
  echo vanillags1 -> Langueges // %TIME%>>log.log
  cls
goto Languages
)

::--------------------------------------------------------------------------------------------------- vanilla Languages 
::Vanilla HD
if %vanillangs%==2 (
  Title Downloading Vanilla HD.....
  echo Download Started For Vanilla HD  // %TIME%>>log.log
  MODE 120,20
dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377239 -manifest 8394183851197739981 -username %username% -remember-password -dir "R6Downloads\Y1S0_Vanilla" -validate -max-servers 15 -max-downloads 10
  echo Vanilla HD Download Finished  // %TIME%>>log.log
  cls
  echo ---------------------------------------
  echo          Download Complete
  echo ---------------------------------------
pause
cls
goto Languages
)

::Vanilla german
if %vanillangs%==3 (
  Title Downloading Vanilla german.....
  echo Download Started For Vanilla german  // %TIME%>>log.log
  MODE 120,20
dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359555 -manifest 3953006809848583127 -username %username% -remember-password -dir "R6Downloads\Y1S0_Vanilla" -validate -max-servers 15 -max-downloads 10
  echo Vanilla german Download Finished  // %TIME%>>log.log

  cls
  echo ---------------------------------------
  echo          Download Complete
  echo ---------------------------------------
pause
cls
goto Languages
)

::Vanilla spanish
if %vanillangs%==4 (
  Title Downloading Vanilla spanish.....
  echo Download Started For Vanilla spanish  // %TIME%>>log.log
  MODE 120,20
dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359556 -manifest 6248979332984503061 -username %username% -remember-password -dir "R6Downloads\Y1S0_Vanilla" -validate -max-servers 15 -max-downloads 10
  echo Vanilla spanish Download Finished  // %TIME%>>log.log
  cls
  echo ---------------------------------------
  echo          Download Complete
  echo ---------------------------------------
pause
cls
goto Languages
)
::Vanilla brazilian
if %vanillangs%==5 (
  Title Downloading Vanilla brazilian.....
  echo Download Started For Vanilla brazilian  // %TIME%>>log.log
  MODE 120,20
dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359557 -manifest 4246528818872796970 -username %username% -remember-password -dir "R6Downloads\Y1S0_Vanilla" -validate -max-servers 15 -max-downloads 10
  echo Vanilla brazilian Download Finished  // %TIME%>>log.log
  cls
  echo ---------------------------------------
  echo          Download Complete
  echo ---------------------------------------
pause
cls
goto Languages
)
::Vanilla japanese
if %vanillangs%==6 (
  Title Downloading Vanilla japanese.....
  echo Download Started For Vanilla japanese  // %TIME%>>log.log
  MODE 120,20
dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377235 -manifest 3426628477659109421 -username %username% -remember-password -dir "R6Downloads\Y1S0_Vanilla" -validate -max-servers 15 -max-downloads 10
  echo Vanilla japanese Download Finished  // %TIME%>>log.log
  cls
  echo ---------------------------------------
  echo          Download Complete
  echo ---------------------------------------
pause
cls
goto Languages
)
::Vanilla Russian
if %vanillangs%==7 (

  Title Downloading Vanilla Russian.....
  echo Download Started For Vanilla Russian  // %TIME%>>log.log
  MODE 120,20
dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377236 -manifest 4326401341058506434 -username %username% -remember-password -dir "R6Downloads\Y1S0_Vanilla" -validate -max-servers 15 -max-downloads 10
  echo Vanilla Russian Download Finished  // %TIME%>>log.log

  cls
  echo ---------------------------------------
  echo          Download Complete
  echo ---------------------------------------
pause
cls
goto Languages
)
::Vanilla French
if %vanillangs%==8 (

  Title Downloading Vanilla French.....
  echo Download Started For Vanilla French  // %TIME%>>log.log
  MODE 120,20
dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359553 -manifest 940838089858119714 -username %username% -remember-password -dir "R6Downloads\Y1S0_Vanilla" -validate -max-servers 15 -max-downloads 10
  echo Vanilla French Download Finished  // %TIME%>>log.log

  cls
  echo ---------------------------------------
  echo          Download Complete
  echo ---------------------------------------
pause
cls
goto Languages
)
::Vanilla French
if %vanillangs%==9 (

  Title Downloading Vanilla French.....
  echo Download Started For Vanilla French  // %TIME%>>log.log
  MODE 120,20
dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359554 -manifest 7179158265062294015 -username %username% -remember-password -dir "R6Downloads\Y1S0_Vanilla" -validate -max-servers 15 -max-downloads 10
  echo Vanilla French Download Finished  // %TIME%>>log.log

  cls
  echo ---------------------------------------
  echo          Download Complete
  echo ---------------------------------------
pause
cls
goto Languages
)
::---------------------------------------------------------------------------------------------------







:bloordorchidlags
Title R6 Manifest Tool - Languages and HD Textures
MODE 46,20
echo ----------------------------------------------
echo # 1 - Back To Languages and HD Textures
echo ----------------------------------------------
echo # 2 = Blood Orchid HD Textures  
echo # 3 = Blood Orchid German 
echo # 4 = Blood Orchid Spanish 
echo # 5 = Blood Orchid Brazilian
echo # 6 = Blood Orchid Japanese 
echo # 7 = Blood Orchid French 
echo # 8 = Blood Orchid italian 
echo ----------------------------------------------
set /p bloodorchidlangs="Enter Number : "


if %bloodorchidlangs%==1 (
  echo vanillags1 -> Langueges // %TIME%>>log.log
  cls
goto Languages
)
::--------------------------------------------------------------------------------------------------- Blood Orchid Languages 

::Blood Orchid HD
if %bloodorchidlangs%==2 (

  Title Downloading Blood Orchid HD.....
  echo Download Started For Blood Orchid HD  // %TIME%>>log.log
  MODE 120,20
dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377239 -manifest 6420469519659049757 -username %username% -remember-password -dir "R6Downloads\Y2S3_BloodOrchid" -validate -max-servers 15 -max-downloads 10
  echo Blood Orchid HD Download Finished  // %TIME%>>log.log
  cls
  echo ---------------------------------------
  echo          Download Complete
  echo ---------------------------------------
pause
cls
goto Languages
)

::Blood Orchid german
if %bloodorchidlangs%==3 (

  Title Downloading Blood Orchid german.....
  echo Download Started For Blood Orchid german  // %TIME%>>log.log
  MODE 120,20
dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359555 -manifest 633861069103225490 -username %username% -remember-password -dir "R6Downloads\Y2S3_BloodOrchid" -validate -max-servers 15 -max-downloads 10
  echo Blood Orchid german Download Finished  // %TIME%>>log.log

  cls
  echo ---------------------------------------
  echo          Download Complete
  echo ---------------------------------------
pause
cls
goto Languages
)

::Blood Orchid spanish
if %bloodorchidlangs%==4 (

  Title Downloading Blood Orchid spanish.....
  echo Download Started For Blood Orchid spanish  // %TIME%>>log.log
  MODE 120,20
dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359556 -manifest 5021367039292610416 -username %username% -remember-password -dir "R6Downloads\Y2S3_BloodOrchid" -validate -max-servers 15 -max-downloads 10
  echo Blood Orchid spanish Download Finished  // %TIME%>>log.log

  cls
  echo ---------------------------------------
  echo          Download Complete
  echo ---------------------------------------
pause
cls
goto Languages
)
::Blood Orchid brazilian
if %bloodorchidlangs%==5 (

  Title Downloading Blood Orchid brazilian.....
  echo Download Started For Blood Orchid brazilian  // %TIME%>>log.log
  MODE 120,20
dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359557 -manifest 8777677445681226676 -username %username% -remember-password -dir "R6Downloads\Y2S3_BloodOrchid" -validate -max-servers 15 -max-downloads 10
  echo Blood Orchid brazilian Download Finished  // %TIME%>>log.log

  cls
  echo ---------------------------------------
  echo          Download Complete
  echo ---------------------------------------
pause
cls
goto Languages
)
::Blood Orchid japanese
if %bloodorchidlangs%==6 (

  Title Downloading Blood Orchid japanese.....
  echo Download Started For Blood Orchid japanese  // %TIME%>>log.log
  MODE 120,20
dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377235 -manifest 1264611426492480643 -username %username% -remember-password -dir "R6Downloads\Y2S3_BloodOrchid" -validate -max-servers 15 -max-downloads 10
  echo Blood Orchid japanese Download Finished  // %TIME%>>log.log

  cls
  echo ---------------------------------------
  echo          Download Complete
  echo ---------------------------------------
pause
cls
goto Languages
)
:: ::Blood Orchid Russian
:: if %bloodorchidlangs%==7 (
:: 
::   Title Downloading Blood Orchid Russian.....
::   echo Download Started For Blood Orchid Russian  // %TIME%>>log.log
:: dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377236 -manifest 4326401341058506434 -username %username% -remember-password -dir "R6Downloads\Y2S3_BloodOrchid" -validate -max-servers 15 -max-downloads 10
::   echo Blood Orchid Russian Download Finished  // %TIME%>>log.log
:: 
::   cls
::   echo ---------------------------------------
::   echo          Download Complete
::   echo ---------------------------------------
:: pause
:: cls
:: goto Languages
:: )
::Blood Orchid French
if %bloodorchidlangs%==7 (

  Title Downloading Blood Orchid French.....
  echo Download Started For Blood Orchid French  // %TIME%>>log.log
  MODE 120,20
dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359553 -manifest 838721240709370593 -username %username% -remember-password -dir "R6Downloads\Y2S3_BloodOrchid" -validate -max-servers 15 -max-downloads 10
  echo Blood Orchid French Download Finished  // %TIME%>>log.log

  cls
  echo ---------------------------------------
  echo          Download Complete
  echo ---------------------------------------
pause
cls
goto Languages
)
::Blood Orchid French
if %bloodorchidlangs%==9 (

  Title Downloading Blood Orchid French.....
  echo Download Started For Blood Orchid French  // %TIME%>>log.log
  MODE 120,20
dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359554 -manifest 517536193576958217 -username %username% -remember-password -dir "R6Downloads\Y2S3_BloodOrchid" -validate -max-servers 15 -max-downloads 10
  echo Blood Orchid French Download Finished  // %TIME%>>log.log

  cls
  echo ---------------------------------------
  echo          Download Complete
  echo ---------------------------------------
pause
cls
goto Languages
)



::chimera Languages 


:chimeralangs
Title R6 Manifest Tool - Languages and HD Textures
MODE 46,20
echo ----------------------------------------------
echo # 1 - Back To Languages and HD Textures
echo ----------------------------------------------
echo # 2 = Chimera HD Textures  
echo # 3 = Chimera German 
echo # 4 = Chimera Spanish 
echo # 5 = Chimera Brazilian
echo # 6 = Chimera Japanese 
echo # 7 = Chimera Russian 
echo # 8 = Chimera French 
echo # 9 = Chimera italian 
echo ----------------------------------------------
set /p chimeralangs="Enter Number : "


if %chimeralangs%==1 (
  echo vanillags1 -> Langueges // %TIME%>>log.log
  cls
goto Languages
)


::Chimera HD
if %chimeralangs%==2 (

  Title Downloading Chimera HD.....
  echo Download Started For Chimera HD  // %TIME%>>log.log
  MODE 120,20
dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377239 -manifest 1668513364192382097 -username %username% -remember-password -dir "R6Downloads\Y3S1_Chimera_Outbreak" -validate -max-servers 15 -max-downloads 10
  echo Chimera HD Download Finished  // %TIME%>>log.log
  cls
  echo ---------------------------------------
  echo          Download Complete
  echo ---------------------------------------
pause
cls
goto Languages
)

::Chimera german
if %chimeralangs%==3 (

  Title Downloading Chimera german.....
  echo Download Started For Chimera german  // %TIME%>>log.log
  MODE 120,20
dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359555 -manifest 365667853833643908 -username %username% -remember-password -dir "R6Downloads\Y3S1_Chimera_Outbreak" -validate -max-servers 15 -max-downloads 10
  echo Chimera german Download Finished  // %TIME%>>log.log

  cls
  echo ---------------------------------------
  echo          Download Complete
  echo ---------------------------------------
pause
cls
goto Languages
)

::Chimera spanish
if %chimeralangs%==4 (

  Title Downloading Chimera spanish.....
  echo Download Started For Chimera spanish  // %TIME%>>log.log
  MODE 120,20
dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359556 -manifest 723936785330189072 -username %username% -remember-password -dir "R6Downloads\Y3S1_Chimera_Outbreak" -validate -max-servers 15 -max-downloads 10
  echo Chimera spanish Download Finished  // %TIME%>>log.log

  cls
  echo ---------------------------------------
  echo          Download Complete
  echo ---------------------------------------
pause
cls
goto Languages
)
::Chimera brazilian
if %chimeralangs%==5 (

  Title Downloading Chimera brazilian.....
  echo Download Started For Chimera brazilian  // %TIME%>>log.log
  MODE 120,20
dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359557 -manifest 4967060442376701942 -username %username% -remember-password -dir "R6Downloads\Y3S1_Chimera_Outbreak" -validate -max-servers 15 -max-downloads 10
  echo Chimera brazilian Download Finished  // %TIME%>>log.log

  cls
  echo ---------------------------------------
  echo          Download Complete
  echo ---------------------------------------
pause
cls
goto Languages
)
::Chimera japanese
if %chimeralangs%==6 (

  Title Downloading Chimera japanese.....
  echo Download Started For Chimera japanese  // %TIME%>>log.log
  MODE 120,20
dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377235 -manifest 8184994692095456862 -username %username% -remember-password -dir "R6Downloads\Y3S1_Chimera_Outbreak" -validate -max-servers 15 -max-downloads 10
  echo Chimera japanese Download Finished  // %TIME%>>log.log

  cls
  echo ---------------------------------------
  echo          Download Complete
  echo ---------------------------------------
pause
cls
goto Languages
)
::Chimera Russian
if %chimeralangs%==7 (

  Title Downloading Chimera Russian.....
  echo Download Started For Chimera Russian  // %TIME%>>log.log
  MODE 120,20
dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377236 -manifest 5994322749665877802 -username %username% -remember-password -dir "R6Downloads\Y3S1_Chimera_Outbreak" -validate -max-servers 15 -max-downloads 10
  echo Chimera Russian Download Finished  // %TIME%>>log.log

  cls
  echo ---------------------------------------
  echo          Download Complete
  echo ---------------------------------------
pause
cls
goto Languages
)
::Chimera French
if %chimeralangs%==8 (

  Title Downloading Chimera French.....
  echo Download Started For Chimera French  // %TIME%>>log.log
  MODE 120,20
dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359553 -manifest 6830763708591031513 -username %username% -remember-password -dir "R6Downloads\Y3S1_Chimera_Outbreak" -validate -max-servers 15 -max-downloads 10
  echo Chimera French Download Finished  // %TIME%>>log.log

  cls
  echo ---------------------------------------
  echo          Download Complete
  echo ---------------------------------------
pause
cls
goto Languages
)
::Chimera French
if %chimeralangs%==9 (

  Title Downloading Chimera French.....
  echo Download Started For Chimera French  // %TIME%>>log.log
  MODE 120,20
dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359554 -manifest 8951270584274959688 -username %username% -remember-password -dir "R6Downloads\Y3S1_Chimera_Outbreak" -validate -max-servers 15 -max-downloads 10
  echo Chimera French Download Finished  // %TIME%>>log.log

  cls
  echo ---------------------------------------
  echo          Download Complete
  echo ---------------------------------------
pause
cls
goto Languages
)





::
:burnthorizonlangs
Title R6 Manifest Tool - Languages and HD Textures
MODE 46,20
echo ----------------------------------------------
echo # 1 - Back To Languages and HD Textures
echo ----------------------------------------------
echo # 2 = Burnt Horizon HD Textures  
echo # 3 = Burnt Horizon German 
echo # 4 = Burnt Horizon Spanish 
echo # 5 = Burnt Horizon Brazilian
echo # 6 = Burnt Horizon Japanese 
echo # 7 = Burnt Horizon Russian 
echo # 8 = Burnt Horizon French 
echo # 9 = Burnt Horizon italian 
echo ----------------------------------------------
set /p burnthorizonlangs="Enter Number : "


if %burnthorizonlangs%==1 (
  echo vanillags1 -> Langueges // %TIME%>>log.log
  cls
goto Languages
)

::--------------------------------------------------------------------------------------------------- Burnt Horizon Languages 
::Burnt Horizon HD
if %burnthorizonlangs%==2 (

  Title Downloading Burnt Horizon HD.....
  echo Download Started For Burnt Horizon HD  // %TIME%>>log.log
  MODE 120,20
dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377239 -manifest 888629411354320742 -username %username% -remember-password -dir "R6Downloads\Y4S1_BurntHorizon_RainbowisMagic" -validate -max-servers 15 -max-downloads 10
  echo Burnt Horizon HD Download Finished  // %TIME%>>log.log
  cls
  echo ---------------------------------------
  echo          Download Complete
  echo ---------------------------------------
pause
cls
goto Languages
)

::Burnt Horizon german
if %burnthorizonlangs%==3 (

  Title Downloading Burnt Horizon german.....
  echo Download Started For Burnt Horizon german  // %TIME%>>log.log
  MODE 120,20
dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359555 -manifest 6166102473910342218 -username %username% -remember-password -dir "R6Downloads\Y4S1_BurntHorizon_RainbowisMagic" -validate -max-servers 15 -max-downloads 10
  echo Burnt Horizon german Download Finished  // %TIME%>>log.log

  cls
  echo ---------------------------------------
  echo          Download Complete
  echo ---------------------------------------
pause
cls
goto Languages
)

::Burnt Horizon spanish
if %burnthorizonlangs%==4 (

  Title Downloading Burnt Horizon spanish.....
  echo Download Started For Burnt Horizon spanish  // %TIME%>>log.log
  MODE 120,20
dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359556 -manifest 8980928302668128431 -username %username% -remember-password -dir "R6Downloads\Y4S1_BurntHorizon_RainbowisMagic" -validate -max-servers 15 -max-downloads 10
  echo Burnt Horizon spanish Download Finished  // %TIME%>>log.log

  cls
  echo ---------------------------------------
  echo          Download Complete
  echo ---------------------------------------
pause
cls
goto Languages
)
::Burnt Horizon brazilian
if %burnthorizonlangs%==5 (

  Title Downloading Burnt Horizon brazilian.....
  echo Download Started For Burnt Horizon brazilian  // %TIME%>>log.log
  MODE 120,20
dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359557 -manifest 5742909617569886590 -username %username% -remember-password -dir "R6Downloads\Y4S1_BurntHorizon_RainbowisMagic" -validate -max-servers 15 -max-downloads 10
  echo Burnt Horizon brazilian Download Finished  // %TIME%>>log.log

  cls
  echo ---------------------------------------
  echo          Download Complete
  echo ---------------------------------------
pause
cls
goto Languages
)
::Burnt Horizon japanese
if %burnthorizonlangs%==6 (

  Title Downloading Burnt Horizon japanese.....
  echo Download Started For Burnt Horizon japanese  // %TIME%>>log.log
  MODE 120,20
dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377235 -manifest 6205462284383635854 -username %username% -remember-password -dir "R6Downloads\Y4S1_BurntHorizon_RainbowisMagic" -validate -max-servers 15 -max-downloads 10
  echo Burnt Horizon japanese Download Finished  // %TIME%>>log.log

  cls
  echo ---------------------------------------
  echo          Download Complete
  echo ---------------------------------------
pause
cls
goto Languages
)
::Burnt Horizon Russian
if %burnthorizonlangs%==7 (

  Title Downloading Burnt Horizon Russian.....
  echo Download Started For Burnt Horizon Russian  // %TIME%>>log.log
  MODE 120,20
dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377236 -manifest 5305534200661405563 -username %username% -remember-password -dir "R6Downloads\Y4S1_BurntHorizon_RainbowisMagic" -validate -max-servers 15 -max-downloads 10
  echo Burnt Horizon Russian Download Finished  // %TIME%>>log.log

  cls
  echo ---------------------------------------
  echo          Download Complete
  echo ---------------------------------------
pause
cls
goto Languages
)
::Burnt Horizon French
if %burnthorizonlangs%==8 (

  Title Downloading Burnt Horizon French.....
  echo Download Started For Burnt Horizon French  // %TIME%>>log.log
  MODE 120,20
dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359553 -manifest 2489165098014835664 -username %username% -remember-password -dir "R6Downloads\Y4S1_BurntHorizon_RainbowisMagic" -validate -max-servers 15 -max-downloads 10
  echo Burnt Horizon French Download Finished  // %TIME%>>log.log

  cls
  echo ---------------------------------------
  echo          Download Complete
  echo ---------------------------------------
pause
cls
goto Languages
)
::Burnt Horizon French
if %burnthorizonlangs%==9 (

  Title Downloading Burnt Horizon French.....
  echo Download Started For Burnt Horizon French  // %TIME%>>log.log
  MODE 120,20
dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359554 -manifest 5912470135426316642 -username %username% -remember-password -dir "R6Downloads\Y4S1_BurntHorizon_RainbowisMagic" -validate -max-servers 15 -max-downloads 10
  echo Burnt Horizon French Download Finished  // %TIME%>>log.log

  cls
  echo ---------------------------------------
  echo          Download Complete
  echo ---------------------------------------
pause
cls
goto Languages
)












:phantomsightlangs
Title R6 Manifest Tool - Languages and HD Textures
MODE 46,20
echo ----------------------------------------------
echo # 1 - Back To Languages and HD Textures
echo ----------------------------------------------
echo # 2 = Phantom Sight HD Textures  
echo # 3 = Phantom Sight German 
echo # 4 = Phantom Sight Spanish 
echo # 5 = Phantom Sight Brazilian
echo # 6 = Phantom Sight Japanese 
echo # 7 = Phantom Sight Russian 
echo # 8 = Phantom Sight French 
echo # 9 = Phantom Sight italian 
echo ----------------------------------------------
set /p phantomsightlangs="Enter Number : "


if %phantomsightlangs%==1 (
  echo vanillags1 -> Langueges // %TIME%>>log.log
  cls
goto Languages
)

::--------------------------------------------------------------------------------------------------- Phantom Sight Languages 
::Phantom Sight HD
if %phantomsightlangs%==2 (

  Title Downloading Phantom Sight HD.....
  echo Download Started For Phantom Sight HD  // %TIME%>>log.log
  MODE 120,20
dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377239 -manifest 4107080515154236795 -username %username% -remember-password -dir "R6Downloads\Y4S2_PhantomSight_Showdown" -validate -max-servers 15 -max-downloads 10
  echo Phantom Sight HD Download Finished  // %TIME%>>log.log
  cls
  echo ---------------------------------------
  echo          Download Complete
  echo ---------------------------------------
pause
cls
goto Languages
)

::Phantom Sight german
if %phantomsightlangs%==3 (

  Title Downloading Phantom Sight german.....
  echo Download Started For Phantom Sight german  // %TIME%>>log.log
  MODE 120,20
dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359555 -manifest 2945239480726569964 -username %username% -remember-password -dir "R6Downloads\Y4S2_PhantomSight_Showdown" -validate -max-servers 15 -max-downloads 10
  echo Phantom Sight german Download Finished  // %TIME%>>log.log

  cls
  echo ---------------------------------------
  echo          Download Complete
  echo ---------------------------------------
pause
cls
goto Languages
)

::Phantom Sight spanish
if %phantomsightlangs%==4 (

  Title Downloading Phantom Sight spanish.....
  echo Download Started For Phantom Sight spanish  // %TIME%>>log.log
  MODE 120,20
dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359556 -manifest 3119251800260595817 -username %username% -remember-password -dir "R6Downloads\Y4S2_PhantomSight_Showdown" -validate -max-servers 15 -max-downloads 10
  echo Phantom Sight spanish Download Finished  // %TIME%>>log.log

  cls
  echo ---------------------------------------
  echo          Download Complete
  echo ---------------------------------------
pause
cls
goto Languages
)
::Phantom Sight brazilian
if %phantomsightlangs%==5 (

  Title Downloading Phantom Sight brazilian.....
  echo Download Started For Phantom Sight brazilian  // %TIME%>>log.log
  MODE 120,20
dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359557 -manifest 2060894578496472402 -username %username% -remember-password -dir "R6Downloads\Y4S2_PhantomSight_Showdown" -validate -max-servers 15 -max-downloads 10
  echo Phantom Sight brazilian Download Finished  // %TIME%>>log.log

  cls
  echo ---------------------------------------
  echo          Download Complete
  echo ---------------------------------------
pause
cls
goto Languages
)
::Phantom Sight japanese
if %phantomsightlangs%==6 (

  Title Downloading Phantom Sight japanese.....
  echo Download Started For Phantom Sight japanese  // %TIME%>>log.log
  MODE 120,20
dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377235 -manifest 735237222551525964 -username %username% -remember-password -dir "R6Downloads\Y4S2_PhantomSight_Showdown" -validate -max-servers 15 -max-downloads 10
  echo Phantom Sight japanese Download Finished  // %TIME%>>log.log

  cls
  echo ---------------------------------------
  echo          Download Complete
  echo ---------------------------------------
pause
cls
goto Languages
)
::Phantom Sight Russian
if %phantomsightlangs%==7 (

  Title Downloading Phantom Sight Russian.....
  echo Download Started For Phantom Sight Russian  // %TIME%>>log.log
  MODE 120,20
dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377236 -manifest 8063779007427415388 -username %username% -remember-password -dir "R6Downloads\Y4S2_PhantomSight_Showdown" -validate -max-servers 15 -max-downloads 10
  echo Phantom Sight Russian Download Finished  // %TIME%>>log.log

  cls
  echo ---------------------------------------
  echo          Download Complete
  echo ---------------------------------------
pause
cls
goto Languages
)
::Phantom Sight French
if %phantomsightlangs%==8 (

  Title Downloading Phantom Sight French.....
  echo Download Started For Phantom Sight French  // %TIME%>>log.log
  MODE 120,20
dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359553 -manifest 8209966773310799535 -username %username% -remember-password -dir "R6Downloads\Y4S2_PhantomSight_Showdown" -validate -max-servers 15 -max-downloads 10
  echo Phantom Sight French Download Finished  // %TIME%>>log.log

  cls
  echo ---------------------------------------
  echo          Download Complete
  echo ---------------------------------------
pause
cls
goto Languages
)
::Phantom Sight French
if %phantomsightlangs%==9 (

  Title Downloading Phantom Sight French.....
  echo Download Started For Phantom Sight French  // %TIME%>>log.log
  MODE 120,20
dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359554 -manifest 5551310338808720316 -username %username% -remember-password -dir "R6Downloads\Y4S2_PhantomSight_Showdown" -validate -max-servers 15 -max-downloads 10
  echo Phantom Sight French Download Finished  // %TIME%>>log.log

  cls
  echo ---------------------------------------
  echo          Download Complete
  echo ---------------------------------------
pause
cls
goto Languages
)

::---------------------------------------------------------------------------------------------------









:redownload
Title R6 Manifest Tool - Redownload
MODE 46,20
echo ----------------------------------------------
echo # 1 - Back To Main Menu
echo ----------------------------------------------
echo # 2 = Redownload Binaries
echo # 3 = Redownload Data
echo ----------------------------------------------
set /p redownloadselect="Enter Number : "


if %redownloadselect%==1 (
  cls
goto verifieddepotcheck
)


if %redownloadselect%==2 (
  cls
goto redownloadbinaries
)

if %redownloadselect%==3 (
  cls
goto redownloaddata
)






::--------------------------------------------------------------------------------------------------- redownload

:redownloadbinaries
Title R6 Manifest Tool - Binaries
MODE 46,20
echo ----------------------------------------------
echo # 1 - Back To Main Menu
echo ----------------------------------------------
echo # 2 = vanilla Binaries  
echo # 3 = Skull Rain Binaries
echo # 4 = Blood Orchid Binaries
echo # 5 = Chimera Binaries
echo # 6 = Burnt Horizon Binaries
echo # 7 = Phantom Sight Binaries 
echo ----------------------------------------------
set /p binaries="Enter Number : "


if %binaries%==1 (
  echo binaries -> mainmenu // %TIME%>>log.log
  cls
goto redownload
)




::vanila 1.0
if %binaries%==2 (
  Title ReDownloading Vanilla 1.0 Binaries.....
echo ReDownload Started For Vanilla 1.0 Binaries  // %TIME%>>log.log
MODE 120,20
dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 8358812283631269928 -username %username% -remember-password -dir "R6Downloads\Y1S0_Vanilla_Binaries" -validate -max-servers 15 -max-downloads 10
  echo Vanilla 1.0 ReDownload Finished  // %TIME%>>log.log
  del /Q /F "R6Downloads\Y1S3_SkullRain\RainbowSix_BE.exe"
  echo Deleted Battleye  // %TIME%>>log.log
  cls
  echo ---------------------------------------
  echo          ReDownload Complete
  echo ---------------------------------------
pause
cls
goto menudepot
)

::Skull Rain 4.2
if %binaries%==3 ( 
  Title ReDownloading Skull Rain Binaries.....
echo ReDownload Started For Skull Rain Binaries  // %TIME%>>log.log
MODE 120,20
dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 5819137024728546741 -username %username% -remember-password -dir "R6Downloads\Y1S3_SkullRain_Binaries" -validate -max-servers 15 -max-downloads 10
  echo Skull Rain Binaries ReDownload Finished  // %TIME%>>log.log
  del /Q /F "R6Downloads\Y1S3_SkullRain\RainbowSix_BE.exe"
  echo Deleted Battleye  // %TIME%>>log.log
  cls
  echo ---------------------------------------
  echo          ReDownload Complete
  echo ---------------------------------------
pause
cls
goto menudepot
)

::Blood Orchid 2.3.1.1
if %binaries%==4 (
  Title Downloading Blood Orchid Binaries.....
  echo Download Started For Blood Orchid Binaries  // %TIME%>>log.log
  MODE 120,20
dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 6708129824495912434 -username %username% -remember-password -dir "R6Downloads\Y2S3_BloodOrchid_Binaries" -validate -max-servers 15 -max-downloads 10
  echo Blood Orchid Binaries ReDownload Finished  // %TIME%>>log.log
  del /Q /F "R6Downloads\Y2S3_BloodOrchid\RainbowSix_BE.exe"
  echo Deleted Battleye  // %TIME%>>log.log
  cls
  echo ---------------------------------------
  echo          ReDownload Complete
  echo ---------------------------------------
pause
cls
goto menudepot
)

::Chimera 3.1.0 
if %binaries%==5 (
 Title Downloading Chimera Binaries....
 echo Download Started For Chimera Binaries  // %TIME%>>log.log
 MODE 120,20
dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 5071357104726974256 -username %username% -remember-password -dir "R6Downloads\Y3S1_Chimera_Outbreak_Binaries" -validate -max-servers 15 -max-downloads 10
  echo Chimera Binaries ReDownload Finished  // %TIME%>>log.log
  del /Q /F "R6Downloads\Y3S1_Chimera_Outbreak\RainbowSix_BE.exe"
  echo Deleted Battleye  // %TIME%>>log.log
  cls
  echo ---------------------------------------
  echo          ReDownload Complete
  echo ---------------------------------------
pause
cls
goto menudepot
)

::Burnt Horizon 4.1.0
if %binaries%==6 (
Title Downloading Burnt Horizon Binaries.....
echo Download Started For Burnt Horizon Binaries // %TIME%>>log.log
MODE 120,20
dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 8356277316976403078 -username %username% -remember-password -dir "R6Downloads\Y4S1_BurntHorizon_RainbowisMagic_Binaries" -validate -max-servers 15 -max-downloads 10
  echo Burnt Horizon Binaries ReDownload Finished  // %TIME%>>log.log
  del /Q /F "R6Downloads\Y4S1_BurntHorizon_RainbowisMagic\RainbowSix_BE.exe"
  echo Deleted Battleye  // %TIME%>>log.log
  cls
  echo ---------------------------------------
  echo          ReDownload Complete
  echo ---------------------------------------
pause
cls
goto menudepot
)

::Phantom Sight 4.2.0
if %binaries%==7 (
  Title Downloading Phantom Sight Binaries.....
  echo Download Started For Phantom Sight Binaries  // %TIME%>>log.log
  MODE 120,20
dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 693082837425613508 -username %username% -remember-password -dir "R6Downloads\Y4S2_PhantomSight_Showdown_Binaries" -validate -max-servers 15 -max-downloads 10
  echo Phantom Sight Binaries ReDownload Finished  // %TIME%>>log.log
  del /Q /F "R6Downloads\Y4S2_PhantomSight_Showdown\RainbowSix_BE.exe"
  echo Deleted Battleye  // %TIME%>>log.log
  cls
  echo ---------------------------------------
  echo          ReDownload Complete
  echo ---------------------------------------
pause
cls
goto menudepot
)







:redownloadData
Title R6 Manifest Tool - Data
MODE 46,20
echo ----------------------------------------------
echo # 1 - Back To Main Menu
echo ----------------------------------------------
echo # 2 = vanilla Data  
echo # 3 = Skull Rain Data
echo # 4 = Blood Orchid Data
echo # 5 = Chimera Data
echo # 6 = Burnt Horizon Data
echo # 7 = Phantom Sight Data 
echo ----------------------------------------------
set /p Data="Enter Number : "


if %data%==1 (
  cls
goto redownload
)


::vanila 1.0
if %data%==2 (
  Title ReDownloading Vanilla 1.0 Data.....
echo ReDownload Started For Vanilla 1.0 Data  // %TIME%>>log.log
MODE 120,20
dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 3893422760579204530 -username %username% -remember-password -dir "R6Downloads\Y1S0_Vanilla_Data" -validate -max-servers 15 -max-downloads 10
  echo Vanilla 1.0 Data ReDownload Finished  // %TIME%>>log.log
  cls
  echo ---------------------------------------
  echo          ReDownload Complete
  echo ---------------------------------------
pause
cls
goto menudepot
)

::Skull Rain 4.2
if %data%==3 ( 
  Title ReDownloading Skull Rain Data.....
echo ReDownload Started For Skull Rain Data  // %TIME%>>log.log
MODE 120,20
dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 5851804596427790505 -username %username% -remember-password -dir "R6Downloads\Y1S3_SkullRain_Data" -validate -max-servers 15 -max-downloads 10
  echo Skull Rain Data ReDownload Finished  // %TIME%>>log.log

  cls
  echo ---------------------------------------
  echo          ReDownload Complete
  echo ---------------------------------------
pause
cls
goto menudepot
)

::Blood Orchid 2.3.1.1
if %data%==4 (
  Title Downloading Blood Orchid Data.....
  echo Download Started For Blood Orchid Data  // %TIME%>>log.log
  MODE 120,20
dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 1613631671988840841 -username %username% -remember-password -dir "R6Downloads\Y2S3_BloodOrchid_Data" -validate -max-servers 15 -max-downloads 10
  echo Blood Orchid Data ReDownload Finished  // %TIME%>>log.log
  cls
  echo ---------------------------------------
  echo          ReDownload Complete
  echo ---------------------------------------
pause
cls
goto menudepot
)

::Chimera 3.1.0 
if %data%==5 (
 Title Downloading Chimera Data....
 echo Download Started For Chimera Data  // %TIME%>>log.log
 MODE 120,20
dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 4701787239566783972 -username %username% -remember-password -dir "R6Downloads\Y3S1_Chimera_Outbreak_Data" -validate -max-servers 15 -max-downloads 10
  echo Chimera Data ReDownload Finished  // %TIME%>>log.log
  cls
  echo ---------------------------------------
  echo          ReDownload Complete
  echo ---------------------------------------
pause
cls
goto menudepot
)

::Burnt Horizon 4.1.0
if %data%==6 (
Title Downloading Burnt Horizon Data.....
echo Download Started For Burnt Horizon Data // %TIME%>>log.log
MODE 120,20
dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 5935578581006804383 -username %username% -remember-password -dir "R6Downloads\Y4S1_BurntHorizon_RainbowisMagic_Data" -validate -max-servers 15 -max-downloads 10
  echo Burnt Horizon Data ReDownload Finished  // %TIME%>>log.log
  cls
  echo ---------------------------------------
  echo          ReDownload Complete
  echo ---------------------------------------
pause
cls
goto menudepot
)

::Phantom Sight 4.2.0
if %data%==7 (
  Title Downloading Phantom Sight Data.....
  echo Download Started For Phantom Sight Data  // %TIME%>>log.log
  MODE 120,20
dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 5408324128694463720 -username %username% -remember-password -dir "R6Downloads\Y4S2_PhantomSight_Showdown_Data" -validate -max-servers 15 -max-downloads 10
  echo Phantom Sight Data ReDownload Finished  // %TIME%>>log.log
  cls
  echo ---------------------------------------
  echo          ReDownload Complete
  echo ---------------------------------------
pause
cls
goto menudepot
)
