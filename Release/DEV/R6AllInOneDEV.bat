@echo off
chcp 65001
::hun char ^^
color 04
setlocal enableextensions enabledelayedexpansion
set homepath=%cd%
set AllInOneVersion=DEV

if exist "log.log" (
  del "log.log"
  cls
  echo You are using %AllInOneVersion% version>>log.log
  goto verifydotnet
  ) else (
  echo You are using %AllInOneVersion% version>>log.log
  goto verifydotnet
  )


::Dotnet start
:verifydotnet
  MODE 50,20
  reg query HKEY_LOCAL_MACHINE\SOFTWARE\dotnet\Setup\InstalledVersions\x64\sharedhost /v Version /f  3.1.4>nul

  if errorlevel 1 (
  echo Oh no, registery editor not found dotnet
  echo Oh no, registery editor not found dotnet - %TIME% >>log.log
  goto checkertwo
  ) else (
  echo DotNet One checker is found the version
  echo DotNet One reg query checker is found the version - %TIME% >>log.log
  goto checkertwo
  )

:dotnet
  MODE 40,10
  echo ---------------------------------------
  echo       Install .NET Runtime !!
  echo ---------------------------------------
  echo Install .NET Runtime - %TIME% >>log.log
  start https://dotnet.microsoft.com/download/dotnet-core/thank-you/sdk-3.1.402-windows-x64-installer
  pause
  echo      Press Space after install
  echo ---------------------------------------
  goto verifydotnet

:checkertwo
  if exist "C:\Program Files\dotnet\dotnet.exe" (
  echo DotNet Two checker is found the version
  echo DotNet Two exist checker is found the version - %TIME% >>log.log
  goto 7zipcheck
  ) else (
  goto dotnet
  )
::dotnet end


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
echo Download 7zip - %TIME%>>log.log
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
  goto chechinstallbat 
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
echo Download DepotDownloader - %TIME%>>log.log
cls
goto extractDD

:extractDD
for %%I in ("depot.zip") do (
  echo extractDD
  echo extractDD - %TIME%>>log.log
  "Requirements\7z.exe" x -y -o"Requirements\DepotDownloader" "%%I" && del %%I
cls
goto DepotCheck
)
::DD end


::installer start
:chechinstallbat
  MODE 60,10
  cls
  if exist "Requirements\Install.bat" (
  echo                     Install.bat Founded
  echo  If you are using old version please update new version
  echo  Please run Requirements\Install.bat for update version
  pause
  goto PlazaCheck
  ) else (
  echo Install.bat Not Founded
  goto installbat
  )

:installbat
  cls
  MODE 78,20
  echo ------------------------------------------------------------------------------
  echo                              Downloading Install.bat...
  echo ------------------------------------------------------------------------------
  curl -L  "https://github.com/SlejmUr/R6-AIOTool/raw/master/Installer/Install.bat" --output Install.bat
  echo Download Install.bat - %TIME%>>log.log
  move Install.bat Requirements
  goto chechinstallbat
  )
::installer end


::Plaza Start
:PlazaCheck
cls
if exist "Requirements\Plazas\PLAZA_BO\CODEX.ini" (
  goto LibCheck 
) else (
  goto GetPlaza
)

:GetPlaza
cls
MODE 78,20
echo ------------------------------------------------------------------------------
echo                        Downloading Plazas...
echo ------------------------------------------------------------------------------
curl -L  "https://cdn.discordapp.com/attachments/722089860755881996/743466352475635832/Plazas.zip" --output plazas.zip
echo Download Plazas - %TIME%>>log.log
cls
goto extractPlaza

:extractPlaza
for %%I in ("plazas.zip") do (
  echo extractPlaza
  echo extractPlaza - %TIME%>>log.log
  "Requirements\7z.exe" x -y -o"Requirements\" "%%I" && del %%I
cls
goto PlazaCheck
)
::Plaza End


::Liberator Start
:LibCheck
cls
if exist "Requirements\Liberators" (
  goto mainmenu 
) else (
  goto GetLib
)

:GetLib
cls
MODE 78,20
echo ------------------------------------------------------------------------------
echo                        Downloading Liberators...
echo ------------------------------------------------------------------------------
curl -L  "http://download1650.mediafire.com/6dy1ugxw06kg/kzhc3j1g3gaxmqx/Liberators.zip" --output lib.zip
echo Download Liberators - %TIME%>>log.log
cls
goto extractLib

:extractLib
for %%I in ("lib.zip") do (
  echo extractLib
  echo extractLib - %TIME%>>log.log
  "Requirements\7z.exe" x -y -o"Requirements\" "%%I" && del %%I
cls
goto LibCheck
)
::Liberator End


::MainMenu START
:mainmenu
color 0f
cls
Title R6S Version AllInOne Downloader
MODE 62,22
echo MainMenu loaded>>log.log
echo --------------------------------------------------------------
echo  Rainbow Six Siege Old Version Downloader
echo  You MUST have a copy of Siege on Steam to use the downloader.
echo  ADDED ALL SEASON!
echo  Tool Version: %AllInOneVersion%
echo  Time : %TIME%
echo  Read FAQ!
echo --------------------------------------------------------------
echo  What would you like to select?
echo  (1) FAQ and Notes
echo  (2) Game Menu 
echo  (3) Extra Language - Getting Manifests 
echo  (4) 4K Textures 
echo  (5) DirectX + VC Redist Downloader 
echo  (6) Credits
echo  (7) JOIN Throwback community!
echo  (8) BattlEye Checker
echo  (9) Open LOG!
echo  (0) Close
echo --------------------------------------------------------------
set /p option="Enter Selection:"

if %option%==0 (
echo Exited - %TIME%>>log.log
cls
exit
)
if %option%==1 (
echo FAQ Choosed>>log.log
cls
goto faq
)
if %option%==2 (
echo GameMenu Choosed>>log.log
cls
goto GameMenu
)
if %option%==3 (
echo Extra Menu Choosed>>log.log
cls
goto Extra
)
if %option%==4 (
echo TextureMenu Choosed>>log.log
cls
goto TextureMenu
)
if %option%==5 (
echo dxvcredist Choosed>>log.log
cls
goto dxvcredist
)
if %option%==6 (
echo Credit Choosed>>log.log
cls
goto Credit
)
if %option%==7 (
echo Modding community Discord Opened>>log.log
cls
start http://r6modding.com/
pause
goto mainmenu
)
if %option%==8 (
echo BattlEyeChecker Choosed>>log.log
cls
goto BattlEyeChecker
)
if %option%==9 (
echo Open LOG - %TIME%>>log.log
cls
start log.log
pause
goto mainmenu
)
goto mainmenu
::MainMenu END



::FAQ and notes START
:faq
Title FAQ
MODE 120,45
echo  1.
echo  Q: Is it safe to enter my password?
echo  A: Yes it is. You can view the source code for Depot Downloader here: https://github.com/SteamRE/DepotDownloader
echo  2
echo  Q: Why can't i see my password?
echo  A: You are typing its invisible 
echo  3
echo  Q: Where can i change my name?
echo  A: In the Codex.ini file line 28 "UserName=CODEX"
echo  4
echo  Q: Why is my game crashing at the start screen?
echo  A: In the Codex.ini file line 20 "GameName=RainbowSixSiege" change it to something else
echo  5
echo  Q: Why am i getting "Encountered unexpected error downloading chunk xxxxxxxxxxxx: The operation was canceled." errors?
echo  A: Its normal ignore them, prefer to always download again
echo  6
echo  Q: Why is my Anti-Virus detecting blocking some of the downloaded files?
echo  A: Its a false positive, whitelist all of the files provided
echo  7
echo  Q: Why is my download stuck at X percent?
echo  A: The last few files in a build are larger than the rest and may take longer to download, please be patient.
echo  Best way to tell if it's still working is to check if it's using your network in task manager.
echo  8
echo  Use plaza_bo, if it doesn't work, use plaza_new
echo  If the game is stuck on preparing content go into codex.ini and set offline=1 to offline=0
echo  Or set StoreConnected to 0 in codex.ini
echo  Once you have a version downloaded grab the PLAZA's below and copy its contents to your game folder.
echo  When it asks to overwrite a few files click yes. If your anti-virus blocks these files then make sure to allow them. 
echo  9
echo  Q: I downloaded with manifest X version of Siege Liberator why said "Build is not supported"?
echo  A: Wait the new version of Manifest and Liberator
echo  10
echo  Q: What version is Liberator support?
echo  A: Read the #tool-releases, or go to Liberator "About" button
echo  11
echo  What is CODEX, DepotDownloader,R6Liberator?
echo  CODEX : Applied to play Old Siege Version
echo  R6Downloader: Download R6 Old Version, it use DepotDownloader
echo  DepotDownloader: Created by SteamRE, you can download any manifest once you have the game
echo  R6Liberator: Created by Cheato, Applied to play Old Events
echo  R6-AIOTool : AllInOne Tool, many function. Created by SlejmUr
pause
cls
goto Notes

:Notes
Title Notes
MODE 110,20
echo  Notes:
echo  Not all Manifest support Liberator!
echo  I'm not tested this manifests: (ALL not have GB option) and ALL 4K Textures, and ALL Language!
echo  If you want to join testing phase, DM me on Discord! SlejmUr#4007
echo  Planning to add Extra Language option in Events!
echo  If Cheato Update Liberator , I update this Tool!
echo  If you have a problem this tool, DM me on Discord! SlejmUr#4007
echo FAQ and Notes Readed!>>log.log
pause
cls
goto mainmenu
::FAQ and notes END


::GameMenu START
:GameMenu
 Title Rainbow Six Siege GameMenu
 echo GameMenu loaded>>log.log
 MODE 33,10
 echo   Rainbow Six Siege Game Menu
 echo ---------------------------------
 echo  (0) Back 
 echo ---------------------------------
 echo  (1) Install Rainbow Six Siege
 echo  (2) Uninstall Rainbow Six Siege
 echo  (3) Starting Rainbow Six Siege
 echo ---------------------------------
set /p option="Enter Selection:"

if %option%==0 (
echo Back>>log.log
cls
goto mainmenu
)
if %option%==1 (
echo DownloadMenu Choosed>>log.log
cls
goto DownloadMenu
)
if %option%==2 (
echo UninstallMenu Choosed>>log.log
cls
goto UninstallMenu
)
if %option%==3 (
echo StartGame Choosed>>log.log
cls
goto StartGame
)
goto GameMenu
::GameMenu END




::DownloadMenu START
:DownloadMenu
cls
Title Rainbow Six Siege DownloadMenu
MODE 50,40
echo 		Version Downloader
echo 	What would you like to select?
echo --------------------------------------------------
echo # 0 - Back
echo # 99 - Download Events
echo --------------------------------------------------
echo # 1 = Vanilla 1.0 (Y1S0) [14.2 GB]
echo # 2 = Black Ice (Y1S1_release) [16.7 GB]
echo # 3 = Dust Line (Y1S2_release) [20.9 GB]
echo # 4 = Skull Rain (Y1S3_release) [24.6 GB]
echo # 41 = Skull Rain (Shey Manifest) 
echo # 5 = Red Crow (Y1S4_release)
echo # 6 = Velvet Shell (Y2S1_release)
echo # 7 = Health (Y2S2_release)
echo # 71 = Health (Shey Manifest)
echo # 8 = Blood Orchid (Y2S3_release)
echo # 81 = Blood Orchid (Shey Manifest)
echo # 9 = White Noise (Y2S4_release)
echo # 91=  White Noise (Shey Manifest)
echo # 10 = Chimera [(Y3S1_release)]
echo # 11 = Para Bellum (Y3S2_release) [60.6 GB]
echo # 12 = Grim Sky (Y3S3_release)
echo # 121= Grim Sky (Shey Manifest)
echo # 13 = Wind Bastion (Y3S4_release) [76.9 GB]
echo # 14 = Burnt Horizon (Y3S1_release)
echo # 141= Burnt Horizon (Shey Manifest)
echo # 15 = Phantom Sight (Y4S2_release)
echo # 16 = Ember Rise (Y4S3_release)
echo # 161= Ember Rise (Shey Manifest)
echo # 17 = Shifting Tides (Y4S4_release) [75.2 GB]
echo # 18 = Void Edge (Y5S1_release)
echo # 181= Void Edge (Shey Manifest)
echo # 19 = Steel Wave (Y5S2_release)
echo # 191 = Steel Wave (Shey Manifest)
echo # 20 = Shadow Legacy (Y5S3_release)
echo # 21 = Placeholder
echo --------------------------------------------------
set /p version="Enter Selection:"
if %version%==0 (
cls
goto mainmenu
)
if %version%==99 (
echo EventMenu choosed >>log.log
cls
goto EventMenu
)
MODE 100,40
set /p username="Enter Steam Username:"


::Vanilla
if %version%==1 (
dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 8358812283631269928 -username %username% -remember-password -dir "Downloads\Y1S0_Vanilla" -validate -max-servers 15 -max-downloads 10
dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 3893422760579204530 -username %username% -remember-password -dir "Downloads\Y1S0_Vanilla" -validate -max-servers 15 -max-downloads 10
pause
cls
echo Vanilla Choosed (v8194013)>>log.log
echo Download complete!
echo It's Vanilla! (v8194013)
goto mainmenu
)
::BLACK ICE Released
if %version%==2 (
dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 5188997148801516344 -username %username% -remember-password -dir "Downloads\Y1S1_Black_Ice" -validate -max-servers 15 -max-downloads 10
dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 7932785808040895147 -username %username% -remember-password -dir "Downloads\Y1S1_Black_Ice" -validate -max-servers 15 -max-downloads 10
pause
cls
echo BLACK ICE (v11726982) Choosed>>log.log
echo Download complete!
echo It's BLACK ICE Released! [IDK how but (v11726982)]
goto mainmenu
)
::DUST LINE Released
if %version%==3 (
dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 2303064029242396590 -username %username% -remember-password -dir "Downloads\Y1S2_Dust_Line" -validate -max-servers 15 -max-downloads 10
dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 2206497318678061176 -username %username% -remember-password -dir "Downloads\Y1S2_Dust_Line" -validate -max-servers 15 -max-downloads 10
pause
cls
echo DUST LINE (v9132097) Choosed>>log.log
echo Download complete!
echo It's DUST LINE Released! (v9132097)
goto mainmenu
)
::SKULL Rain Released
if %version%==4 (
dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 3552784069501585540 -username %username% -remember-password -dir "Downloads\Y1S3_Skull_Rain" -validate -max-servers 15 -max-downloads 10
dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 6528040263176897081 -username %username% -remember-password -dir "Downloads\Y1S3_Skull_Rain" -validate -max-servers 15 -max-downloads 10
pause
cls
echo SKULL Rain (v9654076) Choosed>>log.log
echo Download complete!
echo It's SKULL Rain Released! (v9654076)
goto mainmenu
)
::Skull Rain 4.2
if %version%==41 (
dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 5819137024728546741 -username %username% -remember-password -dir "Downloads\Y1S3_SkullRain" -validate -max-servers 15 -max-downloads 10
dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 5851804596427790505 -username %username% -remember-password -dir "Downloads\Y1S3_SkullRain" -validate -max-servers 15 -max-downloads 10
pause
cls
echo Skull Rain 4.2 (v9860556) Choosed>>log.log
echo Download complete!  Thanks Shey!
echo ? (v9860556)
goto mainmenu
)
::RED CROW Released
if %version%==5 (
dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 3576607363557872807 -username %username% -remember-password -dir "Downloads\Y1S4_Red_Crow" -validate -max-servers 15 -max-downloads 10
dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 8569920171217002292 -username %username% -remember-password -dir "Downloads\Y1S4_Red_Crow" -validate -max-servers 15 -max-downloads 10
pause
cls
echo RED CROW Choosed>>log.log
echo Download complete!
echo It's RED CROW Released!
goto mainmenu
)
::VELVET SHELL Released
if %version%==6 (
dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 2248734317261478192 -username %username% -remember-password -dir "Downloads\Y2S1_Velvet_Shell" -validate -max-servers 15 -max-downloads 10
dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 8006071763917433748 -username %username% -remember-password -dir "Downloads\Y2S1_Velvet_Shell" -validate -max-servers 15 -max-downloads 10
pause
cls
echo VELVET SHELL Choosed>>log.log
echo Download complete!
echo It's VELVET SHELL Released
goto mainmenu
)
::Health Released
if %version%==7 (
dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 2786501509753402970 -username %username% -remember-password -dir "Downloads\Y2S2_Health" -validate -max-servers 15 -max-downloads 10
dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 2332919753188284154 -username %username% -remember-password -dir "Downloads\Y2S2_Health" -validate -max-servers 15 -max-downloads 10
pause
cls
echo Health Choosed>>log.log
echo Download complete!
echo It's Health Released!
goto mainmenu
)
if %version%==71 (
::Health Manifest
dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 5875987479498297665 -username %username% -remember-password -dir "Downloads\Y2S2_Health_2" -validate -max-servers 15 -max-downloads 10
dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 708773000306432190 -username %username% -remember-password -dir "Downloads\Y2S2_Health_2" -validate -max-servers 15 -max-downloads 10
pause
cls
echo Health (Shey) Choosed>>log.log
echo Download complete! Thanks Shey!
goto mainmenu
)
::BLOOD ORCHID Released
if %version%==8 (
dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 8948840210977117778 -username %username% -remember-password -dir "Downloads\Y2S3_Blood_Orchid" -validate -max-servers 15 -max-downloads 10
dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 2410147212125863824 -username %username% -remember-password -dir "Downloads\Y2S3_Blood_Orchid" -validate -max-servers 15 -max-downloads 10
pause
cls
echo BLOOD ORCHID Choosed>>log.log
echo Download complete!
echo It's BLOOD ORCHID Released!
goto mainmenu
)
::Blood Orchid 2.3.1.1
if %version%==81 (
dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 6708129824495912434 -username %username% -remember-password -dir "Downloads\Y2S3_BloodOrchid" -validate -max-servers 15 -max-downloads 10
dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 1613631671988840841 -username %username% -remember-password -dir "Downloads\Y2S3_BloodOrchid" -validate -max-servers 15 -max-downloads 10
pause
cls
echo Blood Orchid 2.3.1.1 Choosed>>log.log
echo Download complete! Thanks Shey!
goto mainmenu
)
::WHITE NOISE Released
if %version%==9 (
dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 2066250193950057921 -username %username% -remember-password -dir "Downloads\Y2S4_White_Noise" -validate -max-servers 15 -max-downloads 10
dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 2783803489764777627 -username %username% -remember-password -dir "Downloads\Y2S4_White_Noise" -validate -max-servers 15 -max-downloads 10
pause
cls
echo WHITE NOISE Choosed>>log.log
echo Download complete!
echo It's WHITE NOISE  Released!
goto mainmenu
)
::WHITE NOISE Manifest
if %version%==91 (
dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 8748734086032257441 -username %username% -remember-password -dir "Downloads\Y2S4_WhiteNoise" -validate -max-servers 15 -max-downloads 10
dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 4221297486420648079 -username %username% -remember-password -dir "Downloads\Y2S4_WhiteNoise" -validate -max-servers 15 -max-downloads 10
pause
cls
echo WHITE NOISE (Shey) Choosed>>log.log
echo Download complete! Thanks Shey!
goto mainmenu
)
::CHIMERA Released
if %version%==10 (
dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 5071357104726974256 -username %username% -remember-password -dir "Downloads\Y3S1_Chimera" -validate -max-servers 15 -max-downloads 10
dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 4701787239566783972 -username %username% -remember-password -dir "Downloads\Y3S1_Chimera" -validate -max-servers 15 -max-downloads 10
pause
cls
echo CHIMERA Choosed>>log.log
echo Download complete!
echo It's CHIMERA  Released
goto mainmenu
)
::PARA BELLUM Released
if %version%==11 (
dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 8312108283310615233 -username %username% -remember-password -dir "Downloads\Y3S2_Para_Bellum" -validate -max-servers 15 -max-downloads 10
dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 8765715607275074515 -username %username% -remember-password -dir "Downloads\Y3S2_Para_Bellum" -validate -max-servers 15 -max-downloads 10
pause
cls
echo PARA BELLUM Choosed>>log.log
echo Download complete!
echo It's PARA BELLUM Released!
goto mainmenu
)
::GRIM SKY Released
if %version%==12 (
dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 7286067994760020542 -username %username% -remember-password -dir "Downloads\Y3S3_Grim_Sky" -validate -max-servers 15 -max-downloads 10
dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 4133951394045241747 -username %username% -remember-password -dir "Downloads\Y3S3_Grim_Sky" -validate -max-servers 15 -max-downloads 10
pause
cls
echo GRIM SKY Choosed>>log.log
echo Download complete!
echo It's GRIM SKY Released!
goto mainmenu
)
::GRIM SKY Manifest
if %version%==121 (
dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 5562094852451837435 -username %username% -remember-password -dir "Downloads\Y3S3_GrimSky" -validate -max-servers 15 -max-downloads 10
dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 7781202564071310413 -username %username% -remember-password -dir "Downloads\Y3S3_GrimSky" -validate -max-servers 15 -max-downloads 10
pause
cls
echo GRIM SKY (Shey) Choosed>>log.log
echo Download complete! Thanks Shey!
goto mainmenu
)
::WIND BASTION Released
if %version%==13 (
dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 6502258854032233436 -username %username% -remember-password -dir "Downloads\Y3S4_Wind_Bastion" -validate -max-servers 15 -max-downloads 10
dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 7659555540733025386 -username %username% -remember-password -dir "Downloads\Y3S4_Wind_Bastion" -validate -max-servers 15 -max-downloads 10
pause
cls
echo WIND BASTION (v12512571) Choosed>>log.log
echo Download complete!
echo It's WIND BASTION Released! (v12512571)
goto mainmenu
)
::BURNT HORIZON Released
if %version%==14 (
dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 8985694971177711792 -username %username% -remember-password -dir "Downloads\Y4S1_Burnt_Horizon" -validate -max-servers 15 -max-downloads 10
dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 4355229858723790756 -username %username% -remember-password -dir "Downloads\Y4S1_Burnt_Horizon" -validate -max-servers 15 -max-downloads 10
pause
cls
echo BURNT HORIZON Choosed>>log.log
echo Download complete!
echo It's BURNT HORIZON Released!
goto mainmenu
)
if %version%==141 (
dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 8356277316976403078 -username %username% -remember-password -dir "Downloads\Y4S1_BurntHorizon" -validate -max-servers 15 -max-downloads 10
dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 5935578581006804383 -username %username% -remember-password -dir "Downloads\Y4S1_BurntHorizon" -validate -max-servers 15 -max-downloads 10
pause
cls
echo BURNT HORIZON (Shey) Choosed>>log.log
echo Download complete! Thanks Shey!
goto mainmenu
)
::PHANTOM SIGHT Released
if %version%==15 (
dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 693082837425613508 -username %username% -remember-password -dir "Downloads\Y4S2_Phantom_Sight" -validate -max-servers 15 -max-downloads 10
dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 5408324128694463720 -username %username% -remember-password -dir "Downloads\Y4S2_Phantom_Sight" -validate -max-servers 15 -max-downloads 10
pause
cls
echo PHANTOM SIGHT Choosed>>log.log
echo Download complete!
echo It's PHANTOM SIGHT Released!
goto mainmenu
)
::EMBER RISE Released
if %version%==16 (
dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 7309481042294838052 -username %username% -remember-password -dir "Downloads\Y4S3_Ember_Rise" -validate -max-servers 15 -max-downloads 10
dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 5429930338066808153 -username %username% -remember-password -dir "Downloads\Y4S3_Ember_Rise" -validate -max-servers 15 -max-downloads 10
pause
cls
echo EMBER RISE Choosed>>log.log
echo Download complete!
echo It's EMBER RISE Released!
goto mainmenu
)
if %version%==161 (
dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 3546781236735558235 -username %username% -remember-password -dir "Downloads\Y4S3_EmberRise" -validate -max-servers 15 -max-downloads 10
dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 7869081741739849703 -username %username% -remember-password -dir "Downloads\Y4S3_EmberRise" -validate -max-servers 15 -max-downloads 10
pause
cls
echo EMBER RISE (Shey) Choosed>>log.log
echo Download complete! Thanks Shey!
goto mainmenu
)
::SHIFTING TIDES Released
if %version%==17 (
dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 299124516841461614 -username %username% -remember-password -dir "Downloads\Y4S4_Shifting_Tides" -validate -max-servers 20 -max-downloads 15
dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 1842268638395240106 -username %username% -remember-password -dir "Downloads\Y4S4_Shifting_Tides" -validate -max-servers 20 -max-downloads 15
pause
cls
echo SHIFTING TIDES Choosed>>log.log
echo Download complete!
echo It's SHIFTING TIDES Released!
goto mainmenu
)
::VOID EDGE Released
if %version%==18 (
dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 8007091753837589034 -username %username% -remember-password -dir "Downloads\Y5S1_Void_Edge" -validate -max-servers 15 -max-downloads 10
dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 2810676266503656332 -username %username% -remember-password -dir "Downloads\Y5S1_Void_Edge" -validate -max-servers 15 -max-downloads 10
pause
cls
echo VOID EDGE Choosed>>log.log
echo Download complete!
echo It's VOID EDGE Released!
goto mainmenu
)
if %version%==181 (
dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 4736360397583523381 -username %username% -remember-password -dir "Downloads\Y5S1_VoidEdge" -validate -max-servers 15 -max-downloads 10
dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 6296533808765702678 -username %username% -remember-password -dir "Downloads\Y5S1_VoidEdge" -validate -max-servers 15 -max-downloads 10
pause
cls
echo VOID EDGE (Shey) Choosed>>log.log
echo Download complete! Thanks Shey!
goto mainmenu
)
::STEEL WAVE
if %version%==19 (
dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 7032500641931923367 -username %username% -remember-password -dir "Downloads\Y5S2_Steel_Wave" -validate -max-servers 15 -max-downloads 10
dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 8083217055977195199 -username %username% -remember-password -dir "Downloads\Y5S2_Steel_Wave" -validate -max-servers 15 -max-downloads 10
pause
cls
echo STEEL WAVE Choosed>>log.log
echo Download complete!
echo It's STEEL WAVE Released!
goto mainmenu
)
::SteelWave
if %version%==191 (
dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 4367817844736324940 -username %username% -remember-password -dir "Downloads\Y5S2_SteelWave" -validate -max-servers 15 -max-downloads 10
dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 893971391196952070 -username %username% -remember-password -dir "Downloads\Y5S2_SteelWave" -validate -max-servers 15 -max-downloads 10
pause
cls
echo STEEL WAVE (Shey) Choosed>>log.log
echo Download complete! Thanks Shey!
goto mainmenu
)
::Shadow Legacy
if %version%==20 (
dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 885453180592640750 -username %username% -remember-password -dir "Downloads\Y5S3_Shadow_Legacy" -validate -max-servers 15 -max-downloads 10
dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 7750070106878890861 -username %username% -remember-password -dir "Downloads\Y5S3_Shadow_Legacy" -validate -max-servers 15 -max-downloads 10
pause
cls
echo Shadow Legacy Choosed>>log.log
echo Download complete!
echo It's Shadow Legacy Released!
goto mainmenu
)
if %version%==21 (
dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest %manifest% -username %username% -remember-password -dir "Downloads\Placeholder" -validate -max-servers 15 -max-downloads 10
dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest %manifest% -username %username% -remember-password -dir "Downloads\Placeholder" -validate -max-servers 15 -max-downloads 10
pause
cls
echo Placeholder Choosed>>log.log
echo Download complete!
echo It's Placeholder
goto mainmenu
)
goto DownloadMenu
::DownloadMenu END



::UninstallMenu START
:UninstallMenu
 Title Rainbow Six Siege UninstallMenu
 echo UninstallMenu loaded>>log.log
 MODE 50,50
 echo                  Version Uninstaller
 echo           What would you like to select?
 echo --------------------------------------------------
 echo # 0 - Back
 echo --------------------------------------------------
 echo # 1 = Vanilla 1.0 (Y1S0)
 echo # 2 = Black Ice (Y1S1_release)
 echo # 3 = Dust Line (Y1S2_release)
 echo # 4 = Skull Rain (Y1S3_release)
 echo # 41 = Skull Rain (Shey Manifest) 
 echo # 5 = Red Crow (Y1S4_release)
 echo # 6 = Velvet Shell (Y2S1_release)
 echo # 7 = Health (Y2S2_release)
 echo # 71 = Health (Shey Manifest)
 echo # 8 = Blood Orchid (Y2S3_release)
 echo # 81 = Blood Orchid (Shey Manifest)
 echo # 9 = White Noise (Y2S4_release)
 echo # 91 =  White Noise (Shey Manifest)
 echo # 10 = Chimera [(Y3S1_release)]
 echo # 11 = Para Bellum (Y3S2_release)
 echo # 12 = Grim Sky (Y3S3_release)
 echo # 120 = Mad House
 echo # 121 = Grim Sky (Shey Manifest)
 echo # 13 = Wind Bastion (Y3S4_release)
 echo # 14 = Burnt Horizon (Y3S1_release)
 echo # 140 = Rainbow is Magic
 echo # 141= Burnt Horizon (Shey Manifest)
 echo # 15 = Phantom Sight (Y4S2_release)
 echo # 16 = Ember Rise (Y4S3_release)
 echo # 161 = Ember Rise (Shey Manifest)
 echo # 17 = Shifting Tides (Y4S4_release)
 echo # 18 = Void Edge (Y5S1_release)
 echo # 180 = The Grand Larceny / Golden Gun
 echo # 181 = Void Edge (Shey Manifest)
 echo # 19 = Steel Wave (Y5S2_release) 
 echo # 190 = M.U.T.E Protocol
 echo # 191 = Steel Wave (Shey Manifest)
 echo # 20 = Shadow Legacy (Y5S3_release)
 echo # 21 = Placeholder
 echo --------------------------------------------------
 set /p version="Enter Selection:"


 if %version%==1 (
 rd /s /q "Downloads\Y1S0_Vanilla"
 timeout /t 4
 cls
 echo Vanilla Choosed [U]>>log.log
 echo Delete complete!
 goto mainmenu
 )
 if %version%==2 (
 rd /s /q "Downloads\Y1S1_Black_Ice"
 timeout /t 4
 cls
 echo Y1S1_Black_Ice Choosed [U]>>log.log
 echo Delete complete!
 goto mainmenu
 )
 if %version%==3 (
 rd /s /q "Downloads\Y1S2_Dust_Line"
 timeout /t 4
 cls
 echo Y1S2_Dust_Line Choosed [U]>>log.log
 echo Delete complete!
 goto mainmenu
 )
 if %version%==4 (
 rd /s /q "Downloads\Y1S3_Skull_Rain"
 timeout /t 4
 cls
 echo Y1S3_Skull_Rain Choosed [U]>>log.log
 echo Delete complete!
 goto mainmenu
 )
 if %version%==41 (
 rd /s /q "Downloads\Y1S3_SkullRain"
 timeout /t 4
 cls
 echo Y1S3_SkullRain Choosed [U]>>log.log
 echo Delete complete!
 goto mainmenu
 )
 if %version%==5 (
 rd /s /q "Downloads\Y1S4_Red_Crow"
 timeout /t 4
 cls
 echo Y1S4_Red_Crow Choosed [U]>>log.log
 echo Delete complete!
 goto mainmenu
 )
 if %version%==6 (
 rd /s /q "Downloads\Y2S1_Velvet_Shell"
 timeout /t 4
 cls
 echo Y2S1_Velvet_Shell Choosed [U]>>log.log
 echo Delete complete!
 goto mainmenu
 )
 if %version%==7 (
 rd /s /q "Downloads\Y2S2_Health"
 timeout /t 4
 cls
 echo Y2S2_Health Choosed [U]>>log.log
 echo Delete complete!
 goto mainmenu
 )
 if %version%==71 (
 rd /s /q "Downloads\Y2S2_Health_2"
 timeout /t 4
 cls
 echo Y2S2_Health_2 Choosed [U]>>log.log
 echo Delete complete!
 goto mainmenu
 )
 if %version%==8 (
 rd /s /q "Downloads\Y2S3_Blood_Orchid"
 timeout /t 4
 cls
 echo Y2S3_Blood_Orchid Choosed [U]>>log.log
 echo Delete complete!
 goto mainmenu
 )
 if %version%==81 (
 rd /s /q "Downloads\Y2S3_BloodOrchid"
 timeout /t 4
 cls
 echo Y2S3_BloodOrchid Choosed [U]>>log.log
 echo Delete complete!
 goto mainmenu
 )
 if %version%==9 (
 rd /s /q "Downloads\Y2S4_White_Noise"
 timeout /t 4
 cls
 echo Y2S4_White_Noise Choosed [U]>>log.log
 echo Delete complete!
 goto mainmenu
 )
 if %version%==91 (
 rd /s /q "Downloads\Y2S4_WhiteNoise"
 timeout /t 4
 cls
 echo Y2S4_WhiteNoise Choosed [U]>>log.log
 echo Delete complete!
 goto mainmenu
 )
 if %version%==10 (
 rd /s /q "Downloads\Y3S1_Chimera"
 timeout /t 4
 cls
 echo Y3S1_Chimera Choosed [U]>>log.log
 echo Delete complete!
 goto mainmenu
 )
 if %version%==11 (
 rd /s /q "Downloads\Y3S2_Para_Bellum"
 timeout /t 4
 cls
 echo Y3S2_Para_Bellum Choosed [U]>>log.log
 echo Delete complete!
 goto mainmenu
 )
 if %version%==12 (
 rd /s /q "Downloads\Y3S3_Grim_Sky"
 timeout /t 4
 cls
 echo Y3S3_Grim_Sky Choosed [U]>>log.log
 echo Delete complete!
 goto mainmenu
 )
 if %version%==120 (
 rd /s /q "Downloads\Y3S3_MadHouse"
 timeout /t 4
 cls
 echo Y3S3_MadHouse Choosed [U]>>log.log
 echo Delete complete!
 goto mainmenu
 )
 if %version%==121 (
 rd /s /q "Downloads\Y3S3_GrimSky"
 timeout /t 4
 cls
 echo Y3S3_GrimSky Choosed [U]>>log.log
 echo Delete complete!
 goto mainmenu
 )
 if %version%==13 (
 rd /s /q "Downloads\Y3S4_Wind_Bastion"
 timeout /t 4
 cls
 echo Y3S4_Wind_Bastion Choosed [U]>>log.log
 echo Delete complete!
 goto mainmenu
 )
 if %version%==14 (
 rd /s /q "Downloads\Y4S1_Burnt_Horizon"
 timeout /t 4
 cls
 echo Y4S1_Burnt_Horizon Choosed [U]>>log.log
 echo Delete complete!
 goto mainmenu
 )
 if %version%==140 (
 rd /s /q "Downloads\Y4S1_RainbowIsMagic"
 timeout /t 4
 cls
 echo Y4S1_RainbowIsMagic Choosed [U]>>log.log
 echo Delete complete!
 goto mainmenu
 )
 if %version%==141 (
 rd /s /q "Downloads\Y4S1_BurntHorizon"
 timeout /t 4
 cls
 echo Y4S1_BurntHorizon Choosed [U]>>log.log
 echo Delete complete!
 goto mainmenu
 )
 if %version%==15 (
 rd /s /q "Downloads\Y4S2_Phantom_Sight"
 timeout /t 4
 cls
 echo Y4S2_Phantom_Sight Choosed [U]>>log.log
 echo Delete complete!
 goto mainmenu
 )
 if %version%==16 (
 rd /s /q "Downloads\Y4S3_Ember_Rise"
 timeout /t 4
 cls
 echo Y4S3_Ember_Rise Choosed [U]>>log.log
 echo Delete complete!
 goto mainmenu
 )
 if %version%==17 (
 rd /s /q "Downloads\Y4S4_Shifting_Tides"
 timeout /t 4
 cls
 echo Y4S4_Shifting_Tides Choosed [U]>>log.log
 echo Delete complete!
 goto mainmenu
 )
 if %version%==18 (
 rd /s /q "Downloads\Y5S1_Void_Edge"
 timeout /t 4
 cls
 echo Y5S1_Void_Edge Choosed [U]>>log.log
 echo Delete complete!
 goto mainmenu
 )
 if %version%==190 (
 rd /s /q "Downloads\Y5S1_TheGrandLarceny"
 timeout /t 4
 cls
 echo Y5S1_TheGrandLarceny Choosed [U]>>log.log
 echo Delete complete!
 goto mainmenu
 )
 if %version%==181 (
 rd /s /q "Downloads\Y5S1_VoidEdge"
 timeout /t 4
 cls
 echo Y5S1_VoidEdge Choosed [U]>>log.log
 echo Delete complete!
 goto mainmenu
 )
 if %version%==19 (
 rd /s /q "Downloads\Y5S2_Steel_Wave"
 timeout /t 4
 cls
 echo Y5S2_Steel_Wave Choosed [U]>>log.log
 echo Delete complete!
 goto mainmenu
 )
 if %version%==191 (
 rd /s /q "Downloads\Y5S2_MUTE"
 timeout /t 4
 cls
 echo Y5S2_MUTE Choosed [U]>>log.log
 echo Delete complete!
 goto mainmenu
 )
 if %version%==190 (
 rd /s /q "Downloads\Y5S2_SteelWave"
 timeout /t 4
 cls
 echo Y5S2_SteelWave Choosed [U]>>log.log
 echo Delete complete!
 goto mainmenu
 )
 if %version%==20 (
 rd /s /q "Downloads\Y5S3_Shadow_Legacy"
 timeout /t 4
 cls
 echo Y5S3_Shadow_Legacy Choosed [U]>>log.log
 echo Delete complete!
 goto mainmenu
 )
 if %version%==21 (
 rd /s /q "Downloads\Placeholder"
 timeout /t 4
 cls
 echo Placeholder Choosed [U]>>log.log
 echo Delete complete!
 goto mainmenu
 )
 goto GameMenu
::UninstallMenu END



::TextureMenu START
:TextureMenu
 cls
 Title Rainbow Six Siege 4K Textures Downloader
 MODE 50,38
 echo 	    4K Textures Downloader
 echo 	What would you like to select?
 echo --------------------------------------------------
 echo # 0 - Back
 echo --------------------------------------------------
 echo # 1 = Vanilla 1.0 (Y1S0) [First Steam Version] 
 echo # 2 = Black Ice (Y1S1_release) 
 echo # 3 = Dust Line (Y1S2_release)
 echo # 4 = Skull Rain (Y1S3_release)
 echo # 41 = Skull Rain (Shey Manifest) 
 echo # 5 = Red Crow (Y1S4_release)
 echo # 6 = Velvet Shell (Y2S1_release)
 echo # 7 = Health (Y2S2_release)
 echo # 71 = Health (Shey Manifest) -Same-
 echo # 8 = Blood Orchid (Y2S3_release)
 echo # 81 = Blood Orchid (Shey Manifest)
 echo # 9 = White Noise (Y2S4_release)
 echo # 91=  White Noise (Shey Manifest) -Same-
 echo # 10 = Chimera [(Y3S1_release)]
 echo # 11 = Para Bellum (Y3S2_release)
 echo # 12 = Grim Sky (Y3S3_release)
 echo # 121 = Grim Sky (Shey Manifest)
 echo # 13 = Wind Bastion (Y3S4_release)
 echo # 14 = Burnt Horizon (Y3S1_release)
 echo # 141= Burnt Horizon (Shey Manifest)
 echo # 15 = Phantom Sight (Y4S2_release)
 echo # 16 = Ember Rise (Y4S3_release)
 echo # 161= Ember Rise (Shey Manifest)
 echo # 17 = Shifting Tides (Y4S4_release)
 echo # 18 = Void Edge (Y5S1_release)
 echo # 181= Void Edge (Shey Manifest) -Same-
 echo # 19 = Steel Wave (Y5S2_release)
 echo # 191 = Steel Wave (Shey Manifest)
 echo # 20 = Shadow Legacy (Y5S3_release)
 echo # 21 = Placeholder
 echo --------------------------------------------------
 set /p version="Enter Selection:"
 if %version%==0 (
 cls
 goto mainmenu
 )

 MODE 100,40
 set /p username="Enter Steam Username:"
 ::Vanilla4k
 if %version%==1 (
 dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377239 -manifest 8394183851197739981 -username %username% -remember-password -dir "Downloads\Y1S0_Vanilla" -validate -max-servers 15 -max-downloads 10
 pause
 cls
 echo Download complete!
 echo It's Vanilla 4K!
 goto mainmenu
 )
 if %version%==2 (
 dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377239 -manifest 3756048967966286899 -username %username% -remember-password -dir "Downloads\Y1S1_Black_Ice" -validate -max-servers 15 -max-downloads 10
 pause
 cls
 echo Download complete!
 echo It's Black Ice 4K!
 goto mainmenu
 )
 if %version%==3 (
 dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377239 -manifest 1338949402410764888 -username %username% -remember-password -dir "Downloads\Y1S2_Dust_Line" -validate -max-servers 15 -max-downloads 10
 pause
 cls
 echo Download complete!
 echo It's Dust Line 4K!
 goto mainmenu
 )
 if %version%==4 (
 dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377239 -manifest 5184390432533910806 -username %username% -remember-password -dir "Downloads\Y1S3_Skull_Rain" -validate -max-servers 15 -max-downloads 10
 pause
 cls
 echo Download complete!
 echo It's Skull Rain 4K! 
 goto mainmenu
 )
 if %version%==41 (
 dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377239 -manifest 3267970968757091405 -username %username% -remember-password -dir "Downloads\Y1S3_SkullRain" -validate -max-servers 15 -max-downloads 10
 pause
 cls
 echo Download complete! Thanks Shey!
 goto mainmenu
 )
 if %version%==5 (
 dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377239 -manifest 1825939060444887403 -username %username% -remember-password -dir "Downloads\Y1S4_Red_Crow" -validate -max-servers 15 -max-downloads 10
 pause
 cls
 echo Download complete!
 echo It's Red Crow 4K!
 goto mainmenu
 )
 if %version%==6 (
 dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377239 -manifest 3196596628759979362 -username %username% -remember-password -dir "Downloads\Y2S1_Velvet_Shell" -validate -max-servers 15 -max-downloads 10
 pause
 cls
 echo Download complete!
 echo It's Velvet Shell 4K!
 goto mainmenu
 )
 if %version%==7 (
 dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377239 -manifest 7497579858536910279 -username %username% -remember-password -dir "Downloads\Y2S2_Health" -validate -max-servers 15 -max-downloads 10
 pause
 cls
 echo Download complete!
 echo It's Health 4K!
 goto mainmenu
 )
 if %version%==71 (
 dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377239 -manifest 7497579858536910279 -username %username% -remember-password -dir "Downloads\Y2S2_Health_2" -validate -max-servers 15 -max-downloads 10
 pause
 cls
 echo Download complete! Thanks Shey!
 goto mainmenu
 )
 if %version%==8 (
 dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377239 -manifest 3065193946575458487 -username %username% -remember-password -dir "Downloads\Y2S3_Blood_Orchid" -validate -max-servers 15 -max-downloads 10
 pause
 cls
 echo Download complete!
 echo It's Blood Orchid 4K!
 goto mainmenu
 )
 if %version%==81 (
 dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377239 -manifest 6420469519659049757 -username %username% -remember-password -dir "Downloads\Y2S3_BloodOrchid" -validate -max-servers 15 -max-downloads 10
 pause
 cls
 echo Download complete! Thanks Shey!
 goto mainmenu
 )
 if %version%==9 (
 dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377239 -manifest 1118649577165385479 -username %username% -remember-password -dir "Downloads\Y2S4_White_Noise" -validate -max-servers 15 -max-downloads 10
 pause
 cls
 echo Download complete!
 echo It's White Noise 4K!
 goto mainmenu
 )
 if %version%==91 (
 dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377239 -manifest 1118649577165385479 -username %username% -remember-password -dir "Downloads\Y2S4_WhiteNoise" -validate -max-servers 15 -max-downloads 10
 pause
 cls
 echo Download complete! Thanks Shey!
 goto mainmenu
 )
 if %version%==10 (
 dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377239 -manifest 1668513364192382097 -username %username% -remember-password -dir "Downloads\Y3S1_Chimera" -validate -max-servers 15 -max-downloads 10
 pause
 cls
 echo Download complete!
 echo It's Chimera 4K!
 goto mainmenu
 )
 if %version%==11 (
 dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377239 -manifest 204186978012641075 -username %username% -remember-password -dir "Downloads\Y3S2_Para_Bellum" -validate -max-servers 15 -max-downloads 10
 pause
 cls
 echo Download complete!
 echo It's Para Bellum 4K!
 goto mainmenu
 )
 if %version%==12 (
 dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377239 -manifest 3378966402050009606 -username %username% -remember-password -dir "Downloads\Y3S3_Grim_Sky" -validate -max-servers 15 -max-downloads 10
 pause
 cls
 echo Download complete!
 echo It's Grim Sky 4K!
 goto mainmenu
 )
 if %version%==121 (
 dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377239 -manifest 6431001239225997495 -username %username% -remember-password -dir "Downloads\Y3S3_GrimSky" -validate -max-servers 15 -max-downloads 10
 pause
 cls
 echo Download complete! Thanks Shey!
 goto mainmenu
 )
 if %version%==13 (
 dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377239 -manifest 2243348760021617592 -username %username% -remember-password -dir "Downloads\Y3S4_Wind_Bastion" -validate -max-servers 15 -max-downloads 10
 pause
 cls
 echo Download complete!
 echo It's Wind Bastion 4K!
 goto mainmenu
 )
 if %version%==14 (
 dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377239 -manifest 888629411354320742 -username %username% -remember-password -dir "Downloads\Y4S1_Burnt_Horizon" -validate -max-servers 15 -max-downloads 10
 pause
 cls
 echo Download complete!
 echo It's Burnt Horizon 4K!
 goto mainmenu
 )
 if %version%==141 (
 dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377239 -manifest 8394183851197739981 -username %username% -remember-password -dir "Downloads\Y4S1_BurntHorizon" -validate -max-servers 15 -max-downloads 10
 pause
 cls
 echo Download complete! Thanks Shey!
 goto mainmenu
 )
 if %version%==15 (
 dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377239 -manifest 4107080515154236795 -username %username% -remember-password -dir "Downloads\Y4S2_Phantom_Sight" -validate -max-servers 15 -max-downloads 10
 pause
 cls
 echo Download complete!
 echo It's Phantom Sight 4K!
 goto mainmenu
 )
 if %version%==16 (
 dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377239 -manifest 8340682081776225833 -username %username% -remember-password -dir "Downloads\Y4S3_Ember_Rise" -validate -max-servers 15 -max-downloads 10
 pause
 cls
 echo Download complete!
 echo It's Ember Rise 4K!
 goto mainmenu
 )
 if %version%==161 (
 dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377239 -manifest 4319184561394137009 -username %username% -remember-password -dir "Downloads\Y4S3_EmberRise" -validate -max-servers 15 -max-downloads 10
 pause
 cls
 echo Download complete! Thanks Shey!
 goto mainmenu
 )
 if %version%==17 (
 dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377239 -manifest 6048763664997452513 -username %username% -remember-password -dir "Downloads\Y4S4_Shifting_Tides" -validate -max-servers 15 -max-downloads 10
 pause
 cls
 echo Download complete!
 echo It's Shifting Tides 4K!
 goto mainmenu
 )
 if %version%==18 (
 dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377239 -manifest 2194493692563107142 -username %username% -remember-password -dir "Downloads\Y5S1_Void_Edge" -validate -max-servers 15 -max-downloads 10
 pause
 cls
 echo Download complete!
 echo It's Void Edge 4K!
 goto mainmenu
 )
 if %version%==181 (
 dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377239 -manifest 2194493692563107142 -username %username% -remember-password -dir "Downloads\Y5S1_VoidEdge" -validate -max-servers 15 -max-downloads 10
 pause
 cls
 echo Download complete! Thanks Shey!
 goto mainmenu
 )
 if %version%==19 (
 dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377239 -manifest 3257522596542046976 -username %username% -remember-password -dir "Downloads\Y5S2_Steel_Wave" -validate -max-servers 15 -max-downloads 10
 pause
 cls
 echo Download complete!
 echo It's Steel Wave 4K!
 goto mainmenu
 )
 if %version%==191 (
 dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377239 -manifest 1430519549301269175 -username %username% -remember-password -dir "Downloads\Y5S2_SteelWave" -validate -max-servers 15 -max-downloads 10
 pause
 cls
 echo Download complete! Thanks Shey!
 goto mainmenu
 )
 if %version%==20 (
 dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377239 -manifest 5051396185388503167 -username %username% -remember-password -dir "Downloads\Y5S3_Shadow_Legacy" -validate -max-servers 15 -max-downloads 10
 pause
 cls
 echo Download complete!
 echo It's Shadow Legacy 4K!
 goto mainmenu
 )
 if %version%==21 (
 dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377239 -manifest %manifest% -username %username% -remember-password -dir "Downloads\Placeholder" -validate -max-servers 15 -max-downloads 10
 pause
 cls
 echo Download complete!
 echo It's Placeholder 4K
 goto mainmenu
 )
goto TextureMenu
::TextureMenu END


::EventMenu START
:EventMenu
 cls
 Title Rainbow Six Siege Event Downloader
 MODE 52,25
 echo What would you like to select?
 echo ----------------------------------------------------
 echo # 0 - Back
 echo ----------------------------------------------------
 echo # 11 = Chimera (Same With normal Chimera)
 echo # 13 = Mad House
 echo # 15 = Rainbow is Magic
 echo # 18 = Road To S.I. 2020 (Same with normal Shifting)
 echo # 19 = The Grand Larceny / Golden Gun
 echo # 20 = M.U.T.E Protocol
 echo ----------------------------------------------------
 set /p version="Enter Selection:"
 if %version%==0 (
 cls
 goto DownloadMenu
 )
 MODE 100,40
 set /p username="Enter Steam Username:"

  ::CHIMERA Released
  if %version%==11 (
  dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 5071357104726974256 -username %username% -remember-password -dir "Downloads\Y3S1_Chimera" -validate -max-servers 15 -max-downloads 10
  dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 4701787239566783972 -username %username% -remember-password -dir "Downloads\Y3S1_Chimera" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's CHIMERA Released
  goto mainmenu
  )
  ::MadHouse EVENT
  if %version%==13 (
  dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 3546781236735558235 -username %username% -remember-password -dir "Downloads\Y3S3_MadHouse" -validate -max-servers 15 -max-downloads 10
  dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 1556527176552332195 -username %username% -remember-password -dir "Downloads\Y3S3_MadHouse" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Mad House!
  goto mainmenu
  )
  ::Rainbow is Magic EVENT
  if %version%==15 (
  dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 8356277316976403078 -username %username% -remember-password -dir "Downloads\Y4S1_RainbowIsMagic" -validate -max-servers 15 -max-downloads 10
  dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 5935578581006804383 -username %username% -remember-password -dir "Downloads\Y4S1_RainbowIsMagic" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Rainbow is Magic!
  goto mainmenu
  )
  ::SHIFTING TIDES Released
  if %version%==18 (
  dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 299124516841461614 -username %username% -remember-password -dir "Downloads\Y4S4_Shifting_Tides" -validate -max-servers 20 -max-downloads 15
  dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 1842268638395240106 -username %username% -remember-password -dir "Downloads\Y4S4_Shifting_Tides" -validate -max-servers 20 -max-downloads 15
  pause
  cls
  echo Download complete!
  echo It's SHIFTING TIDES Released!
  goto mainmenu
  )
  ::The Grand Larceny
  if %version%==19 (
  dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 4736360397583523381 -username %username% -remember-password -dir "Downloads\Y5S1_TheGrandLarceny" -validate -max-servers 15 -max-downloads 10
  dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 6296533808765702678 -username %username% -remember-password -dir "Downloads\Y5S1_TheGrandLarceny" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's The Grand Larceny!
  goto mainmenu
  )
  ::MUTE EVENT
  if %version%==20 (
  dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 4367817844736324940 -username %username% -remember-password -dir "Downloads\Y5S2_MUTE" -validate -max-servers 15 -max-downloads 10
  dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 893971391196952070 -username %username% -remember-password -dir "Downloads\Y5S2_MUTE" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's M.U.T.E
  goto mainmenu
  )
goto EventMenu
::EventMenu END



::Extra START
:Extra
	cls
	Title Rainbow Six Siege Extra Downloader
	MODE 50,25
	echo               Extra Language Downloader
	echo             What would you like to select?
  echo              EVENT LANG NOT SUPPORTED!
	echo --------------------------------------------------
	echo # 0 - Back
	echo --------------------------------------------------
  echo # 1 - French Language 
  echo # 2 - Italian Language
  echo # 3 - German Language 
  echo # 4 - Spanish - Spain Language
  echo # 5 - Portuguese - Brazil Language ~
  echo # 6 - Polish Language ~
  echo # 7 - Dutch Language ~ 
  echo # 8 - Czech Language ~
  echo # 9 - Korean Language ~
  echo # 10 - Traditional Chinese Language ~
  echo # 11 - Simplified Chinese Language ~
  echo # 12 - Japanese Language ~
  echo # 13 - Russian Language ~
	echo --------------------------------------------------
:: 359557  Depot Brasilian
:: 359558  Depot Polish 
:: 377230  Depot Dutch 
:: 377231  Depot Czech
:: 377232  Depot Korean  
:: 377233  Depot TChinese  
:: 377234  Depot SChinese 
:: 377235  Depot Japanese
:: 377236  Depot Russian
	set /p version="Enter Selection:"
	if %version%==0 (
	cls
	goto mainmenu
	)
  if %version%==1 (
  cls
  goto French
  )
  if %version%==2 (
  cls
  goto Italian
  )
	if %version%==3 (
	cls
	goto German
	)
  if %version%==4 (
  cls
  goto Spanish
  )
  if %version%==5 (
  cls
  goto Brasilian
  )
  if %version%==6 (
  cls
  goto Polish
  )
  if %version%==7 (
  cls
  goto Dutch
  )
  if %version%==8 (
  cls
  goto Czech
  )
  if %version%==9 (
  cls
  goto Korean
  )
  if %version%==10 (
  cls
  goto TChinese
  )
  if %version%==11 (
  cls
  goto SChinese
  )
  if %version%==12 (
  cls
  goto Japanese
  )
  if %version%==13 (
  cls
  goto Russian
  )
	goto Extra
::Extra END



::French START
:French
  cls
  Title Rainbow Six Siege French Lang Downloader
  MODE 50,38
  echo           French Language Downloader
  echo         What would you like to select?
  echo --------------------------------------------------
  echo # 0 - Back
  echo --------------------------------------------------
  echo # 1 - French Lang on Vanilla
  echo # 2 - French Lang on Black Ice 
  echo # 3 - French Lang on Dust Line 
  echo # 4 - French Lang on Skull Rain 
  echo # 41 - French Lang on Skull Rain (Shey) -Same-
  echo # 5 - French Lang on Red Crow 
  echo # 6 - French Lang on Velvet Shell 
  echo # 7 - French Lang on Health 
  echo # 71 - French Lang on Health (Shey) -Same-
  echo # 8 - French Lang on Blood Orchid 
  echo # 81 - French Lang on Blood Orchid (Shey) -Same-
  echo # 9 - French Lang on White Noise 
  echo # 91- French Lang on White Noise (Shey) -Same-
  echo # 10 - French Lang on Chimera 
  echo # 11 - French Lang on Para Bellum 
  echo # 12 - French Lang on Grim Sky 
  echo # 121 - French Lang on Grim Sky (Shey) -Same-
  echo # 13 - French Lang on Wind Bastion
  echo # 14 - French Lang on Burnt Horizon 
  echo # 141 - French Lang on Burnt Horizon (Shey) -Same-
  echo # 15 - French Lang on Phantom Sight 
  echo # 16 - French Lang on Ember Rise 
  echo # 161 - French Lang on Ember Rise (Shey) -Same-
  echo # 17 - French Lang on Shifting Tides 
  echo # 18 - French Lang on Void Edge 
  echo # 181 - French Lang on Void Edge (Shey) -Same-
  echo # 19 - French Lang on Steel Wave 
  echo # 191 - French Lang on Steel Wave (Shey) -Same-
  echo # 20 - French Lang on Shadow Legacy 
  echo # 21 - Placeholder
  echo --------------------------------------------------
  set /p version="Enter Selection:"
  if %version%==0 (
  cls
  goto Extra
  )
  MODE 100,40
  set /p username="Enter Steam Username:"

  if %version%==1 (
  dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359553 -manifest 940838089858119714 -username %username% -remember-password -dir "Downloads\Y1S0_Vanilla" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's French Lang on Vanilla
  goto mainmenu
  )
  if %version%==2 (
  dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359553 -manifest 3933270230638281254 -username %username% -remember-password -dir "Downloads\Y1S1_Black_Ice" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's French Lang on Black Ice 
  goto mainmenu
  )
  if %version%==3 (
  dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359553 -manifest 8417670786870682154 -username %username% -remember-password -dir "Downloads\Y1S2_Dust_Line" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's French Lang on Dust Line
  goto mainmenu
  )
  if %version%==4 (
  dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359553 -manifest 5132022816747475711 -username %username% -remember-password -dir "Downloads\Y1S3_Skull_Rain" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's French Lang on Skull Rain
  goto mainmenu
  )
  if %version%==41 (
  dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359553 -manifest 5132022816747475711 -username %username% -remember-password -dir "Downloads\Y1S3_SkullRain" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's French Lang on Skull Rain (Shey)
  goto mainmenu
  )
  if %version%==5 (
  dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359553 -manifest 6096643115970852289 -username %username% -remember-password -dir "Downloads\Y1S4_Red_Crow" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's French Lang on Red Crow
  goto mainmenu
  )
  if %version%==6 (
  dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359553 -manifest 5858637819174796390 -username %username% -remember-password -dir "Downloads\Y2S1_Velvet_Shell" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's French Lang on Velvet Shell
  goto mainmenu
  )
  if %version%==7 (
  dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359553 -manifest 5499656844751782586 -username %username% -remember-password -dir "Downloads\Y2S2_Health" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's French Lang on Health
  goto mainmenu
  )
  if %version%==71 (
  dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359553 -manifest 5499656844751782586 -username %username% -remember-password -dir "Downloads\Y2S2_Health_2" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's French Lang on Health (Shey)
  goto mainmenu
  )
  if %version%==8 (
  dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359553 -manifest 790907662127860380 -username %username% -remember-password -dir "Downloads\Y2S3_Blood_Orchid" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's French Lang on Blood Orchid
  goto mainmenu
  )
  if %version%==81 (
  dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359553 -manifest 790907662127860380 -username %username% -remember-password -dir "Downloads\Y2S3_BloodOrchid" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's French Lang on Blood Orchid (Shey)
  goto mainmenu
  )
  if %version%==9 (
  dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359553 -manifest 2934184792636281942 -username %username% -remember-password -dir "Downloads\Y2S4_White_Noises" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's French Lang on White Noise
  goto mainmenu
  )
  if %version%==91 (
  dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359553 -manifest 2934184792636281942 -username %username% -remember-password -dir "Downloads\Y2S4_WhiteNoise" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's French Lang on White Noise (Shey)
  goto mainmenu
  )
  if %version%==10 (
  dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359553 -manifest 6830763708591031513 -username %username% -remember-password -dir "Downloads\Y3S1_Chimera" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's French Lang on Chimera
  goto mainmenu
  )
  if %version%==11 (
  dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359553 -manifest 2228609364372112585 -username %username% -remember-password -dir "Downloads\Y3S2_Para_Bellum" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's French Lang on Para Bellum
  goto mainmenu
  )
  if %version%==12 (
  dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359553 -manifest 3063945558350557421 -username %username% -remember-password -dir "Downloads\Y3S3_Grim_Sky" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's French Lang on Grim Sky
  goto mainmenu
  )
  if %version%==121 (
  dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359553 -manifest 3063945558350557421 -username %username% -remember-password -dir "Downloads\Y3S3_GrimSky" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's French Lang on Grim Sky (Shey)
  goto mainmenu
  )
  if %version%==13 (
  dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359553 -manifest 700171152841929114 -username %username% -remember-password -dir "Downloads\Y3S4_Wind_Bastion" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's French Lang on Wind Bastion
  goto mainmenu
  )
  if %version%==14 (
  dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359553 -manifest 2489165098014835664 -username %username% -remember-password -dir "Downloads\Y4S1_Burnt_Horizon" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's French Lang on Burnt Horizon
  goto mainmenu
  )
  if %version%==141 (
  dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359553 -manifest 2489165098014835664 -username %username% -remember-password -dir "Downloads\Y4S1_BurntHorizon" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's French Lang on Burnt Horizon (Shey)
  goto mainmenu
  )
  if %version%==15 (
  dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359553 -manifest 8209966773310799535 -username %username% -remember-password -dir "Downloads\Y4S2_Phantom_Sight" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's French Lang on Phantom Sight 
  goto mainmenu
  )
  if %version%==16 (
  dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359553 -manifest 9167311800727871226 -username %username% -remember-password -dir "Downloads\Y4S3_Ember_Rise" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's French Lang on Ember Rise 
  goto mainmenu
  )
  if %version%==161 (
  dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359553 -manifest 9167311800727871226 -username %username% -remember-password -dir "Downloads\Y4S3_EmberRise" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's French Lang on Ember Rise (Shey)
  goto mainmenu
  )
  if %version%==17 (
  dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359553 -manifest 982226827055842157 -username %username% -remember-password -dir "Downloads\Y4S4_Shifting_Tides" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's French Lang on Shifting Tides 
  goto mainmenu
  )
  if %version%==18 (
  dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359553 -manifest 6351511531186309516 -username %username% -remember-password -dir "Downloads\Y5S1_Void_Edge" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's French Lang on Void Edge 
  goto mainmenu
  )
  if %version%==181 (
  dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359553 -manifest 6351511531186309516 -username %username% -remember-password -dir "Downloads\Y5S1_VoidEdge" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's French Lang on Void Edge (Shey)
  goto mainmenu
  )
  if %version%==19 (
  dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359553 -manifest 379201990182673961 -username %username% -remember-password -dir "Downloads\Y5S2_Steel_Wave" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's French Lang on Steel Wave 
  goto mainmenu
  )
  if %version%==191 (
  dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359553 -manifest 379201990182673961 -username %username% -remember-password -dir "Downloads\Y5S2_SteelWave" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's French Lang on Steel Wave (Shey)
  goto mainmenu
  )
  if %version%==20 (
  dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359553 -manifest 490063692268635993 -username %username% -remember-password -dir "Downloads\Y5S3_Shadow_Legacy" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's French Lang on Shadow Legacy
  goto mainmenu
  )
  if %version%==21 (
  dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359553 -manifest %manifest% -username %username% -remember-password -dir "Downloads\Placeholder" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's French Lang on Placeholder
  goto mainmenu
  )
  goto Extra
::French END



::Italian START
:Italian
  cls
  Title Rainbow Six Siege Italian Lang Downloader
  MODE 50,38
  echo           Italian Language Downloader
  echo         What would you like to select?
  echo --------------------------------------------------
  echo # 0 - Back
  echo --------------------------------------------------
  echo # 1 - Italian Lang on Vanilla
  echo # 2 - Italian Lang on Black Ice 
  echo # 3 - Italian Lang on Dust Line 
  echo # 4 - Italian Lang on Skull Rain 
  echo # 41 - Italian Lang on Skull Rain (Shey) -Same-
  echo # 5 - Italian Lang on Red Crow 
  echo # 6 - Italian Lang on Velvet Shell 
  echo # 7 - Italian Lang on Health 
  echo # 71 - Italian Lang on Health (Shey) -Same-
  echo # 8 - Italian Lang on Blood Orchid 
  echo # 81 - Italian Lang on Blood Orchid (Shey) -Same-
  echo # 9 - Italian Lang on White Noise 
  echo # 91- Italian Lang on White Noise (Shey) -Same-
  echo # 10 - Italian Lang on Chimera 
  echo # 11 - Italian Lang on Para Bellum 
  echo # 12 - Italian Lang on Grim Sky 
  echo # 121 - Italian Lang on Grim Sky (Shey) -Same-
  echo # 13 - Italian Lang on Wind Bastion
  echo # 14 - Italian Lang on Burnt Horizon 
  echo # 141 - Italian Lang on Burnt Horizon (Shey) -Same-
  echo # 15 - Italian Lang on Phantom Sight 
  echo # 16 - Italian Lang on Ember Rise 
  echo # 161 - Italian Lang on Ember Rise (Shey) -Same-
  echo # 17 - Italian Lang on Shifting Tides 
  echo # 18 - Italian Lang on Void Edge 
  echo # 181 - Italian Lang on Void Edge (Shey) -Same-
  echo # 19 - Italian Lang on Steel Wave 
  echo # 191 - Italian Lang on Steel Wave (Shey) -Same-
  echo # 20 - Italian Lang on Shadow Legacy 
  echo # 21 - Placeholder
  echo --------------------------------------------------
  set /p version="Enter Selection:"
  if %version%==0 (
  cls
  goto Extra
  )
  MODE 100,40
  set /p username="Enter Steam Username:"
  
  if %version%==1 (
  dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359554 -manifest 7179158265062294015 -username %username% -remember-password -dir "Downloads\Y1S0_Vanilla" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Italian Lang on Vanilla
  goto mainmenu
  )
  if %version%==2 (
  dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359554 -manifest 5760263381471720373 -username %username% -remember-password -dir "Downloads\Y1S1_Black_Ice" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Italian Lang on Black Ice 
  goto mainmenu
  )
  if %version%==3 (
  dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359554 -manifest 2551476087873566284 -username %username% -remember-password -dir "Downloads\Y1S2_Dust_Line" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Italian Lang on Dust Line
  goto mainmenu
  )
  if %version%==4 (
  dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359554 -manifest 1819965373025810009 -username %username% -remember-password -dir "Downloads\Y1S3_Skull_Rain" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Italian Lang on Skull Rain
  goto mainmenu
  )
  if %version%==41 (
  dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359554 -manifest 1819965373025810009 -username %username% -remember-password -dir "Downloads\Y1S3_SkullRain" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Italian Lang on Skull Rain (Shey)
  goto mainmenu
  )
  if %version%==5 (
  dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359554 -manifest 8822593964618949966 -username %username% -remember-password -dir "Downloads\Y1S4_Red_Crow" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Italian Lang on Red Crow
  goto mainmenu
  )
  if %version%==6 (
  dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359554 -manifest 1442016899353884599 -username %username% -remember-password -dir "Downloads\Y2S1_Velvet_Shell" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Italian Lang on Velvet Shell
  goto mainmenu
  )
  if %version%==7 (
  dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359554 -manifest 4814130789498386116 -username %username% -remember-password -dir "Downloads\Y2S2_Health" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Italian Lang on Health
  goto mainmenu
  )
  if %version%==71 (
  dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359554 -manifest 4814130789498386116 -username %username% -remember-password -dir "Downloads\Y2S2_Health_2" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Italian Lang on Health (Shey)
  goto mainmenu
  )
  if %version%==8 (
  dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359554 -manifest 3928776659583035772 -username %username% -remember-password -dir "Downloads\Y2S3_Blood_Orchid" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Italian Lang on Blood Orchid
  goto mainmenu
  )
  if %version%==81 (
  dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359554 -manifest 3928776659583035772 -username %username% -remember-password -dir "Downloads\Y2S3_BloodOrchid" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Italian Lang on Blood Orchid (Shey)
  goto mainmenu
  )
  if %version%==9 (
  dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359554 -manifest 6120111820088733265 -username %username% -remember-password -dir "Downloads\Y2S4_White_Noises" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Italian Lang on White Noise
  goto mainmenu
  )
  if %version%==91 (
  dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359554 -manifest 6120111820088733265 -username %username% -remember-password -dir "Downloads\Y2S4_WhiteNoise" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Italian Lang on White Noise (Shey)
  goto mainmenu
  )
  if %version%==10 (
  dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359554 -manifest 8951270584274959688 -username %username% -remember-password -dir "Downloads\Y3S1_Chimera" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Italian Lang on Chimera
  goto mainmenu
  )
  if %version%==11 (
  dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359554 -manifest 3765579578277178198 -username %username% -remember-password -dir "Downloads\Y3S2_Para_Bellum" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Italian Lang on Para Bellum
  goto mainmenu
  )
  if %version%==12 (
  dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359554 -manifest 8817435015508321947 -username %username% -remember-password -dir "Downloads\Y3S3_Grim_Sky" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Italian Lang on Grim Sky
  goto mainmenu
  )
  if %version%==121 (
  dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359554 -manifest 8817435015508321947 -username %username% -remember-password -dir "Downloads\Y3S3_GrimSky" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Italian Lang on Grim Sky (Shey)
  goto mainmenu
  )
  if %version%==13 (
  dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359554 -manifest 6317337128494587862 -username %username% -remember-password -dir "Downloads\Y3S4_Wind_Bastion" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Italian Lang on Wind Bastion
  goto mainmenu
  )
  if %version%==14 (
  dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359554 -manifest 5912470135426316642 -username %username% -remember-password -dir "Downloads\Y4S1_Burnt_Horizon" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Italian Lang on Burnt Horizon
  goto mainmenu
  )
  if %version%==141 (
  dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359554 -manifest 5912470135426316642 -username %username% -remember-password -dir "Downloads\Y4S1_BurntHorizon" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Italian Lang on Burnt Horizon (Shey)
  goto mainmenu
  )
  if %version%==15 (
  dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359554 -manifest 5551310338808720316 -username %username% -remember-password -dir "Downloads\Y4S2_Phantom_Sight" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Italian Lang on Phantom Sight 
  goto mainmenu
  )
  if %version%==16 (
  dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359554 -manifest 9032788833180559255 -username %username% -remember-password -dir "Downloads\Y4S3_Ember_Rise" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Italian Lang on Ember Rise 
  goto mainmenu
  )
  if %version%==161 (
  dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359554 -manifest 9032788833180559255 -username %username% -remember-password -dir "Downloads\Y4S3_EmberRise" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Italian Lang on Ember Rise (Shey)
  goto mainmenu
  )
  if %version%==17 (
  dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359554 -manifest 7669952636769439421 -username %username% -remember-password -dir "Downloads\Y4S4_Shifting_Tides" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Italian Lang on Shifting Tides 
  goto mainmenu
  )
  if %version%==18 (
  dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359554 -manifest 2083562978649529043 -username %username% -remember-password -dir "Downloads\Y5S1_Void_Edge" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Italian Lang on Void Edge 
  goto mainmenu
  )
  if %version%==181 (
  dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359554 -manifest 2083562978649529043 -username %username% -remember-password -dir "Downloads\Y5S1_VoidEdge" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Italian Lang on Void Edge (Shey)
  goto mainmenu
  )
  if %version%==19 (
  dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359554 -manifest 7015749936618767871 -username %username% -remember-password -dir "Downloads\Y5S2_Steel_Wave" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Italian Lang on Steel Wave 
  goto mainmenu
  )
  if %version%==191 (
  dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359554 -manifest 7015749936618767871 -username %username% -remember-password -dir "Downloads\Y5S2_SteelWave" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Italian Lang on Steel Wave (Shey)
  goto mainmenu
  )
  if %version%==20 (
  dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359554 -manifest 8865509294556462405 -username %username% -remember-password -dir "Downloads\Y5S3_Shadow_Legacy" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Italian Lang on Shadow Legacy
  goto mainmenu
  )
  if %version%==21 (
  dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359554 -manifest %manifest% -username %username% -remember-password -dir "Downloads\Placeholder" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Italian Lang on Placeholder
  goto mainmenu
  )
  goto Extra
::Italian END



::German START
:German
	cls
	Title Rainbow Six Siege German Lang Downloader
	MODE 50,38
	echo           German Language Downloader
	echo         What would you like to select?
	echo --------------------------------------------------
	echo # 0 - Back
	echo --------------------------------------------------
	echo # 1 - German Lang on Vanilla
  echo # 2 - German Lang on Black Ice 
  echo # 3 - German Lang on Dust Line 
  echo # 4 - German Lang on Skull Rain 
  echo # 41 - German Lang on Skull Rain (Shey) -Same-
  echo # 5 - German Lang on Red Crow 
  echo # 6 - German Lang on Velvet Shell 
  echo # 7 - German Lang on Health 
  echo # 71 - German Lang on Health (Shey) -Same-
  echo # 8 - German Lang on Blood Orchid 
  echo # 81 - German Lang on Blood Orchid (Shey) -Same-
  echo # 9 - German Lang on White Noise 
  echo # 91- German Lang on White Noise (Shey) -Same-
  echo # 10 - German Lang on Chimera 
  echo # 11 - German Lang on Para Bellum 
  echo # 12 - German Lang on Grim Sky 
  echo # 121 - German Lang on Grim Sky (Shey) -Same-
  echo # 13 - German Lang on Wind Bastion
  echo # 14 - German Lang on Burnt Horizon 
  echo # 141 - German Lang on Burnt Horizon (Shey) -Same-
  echo # 15 - German Lang on Phantom Sight 
  echo # 16 - German Lang on Ember Rise 
  echo # 161 - German Lang on Ember Rise (Shey) -Same-
  echo # 17 - German Lang on Shifting Tides 
  echo # 18 - German Lang on Void Edge 
  echo # 181 - German Lang on Void Edge (Shey) -Same-
  echo # 19 - German Lang on Steel Wave 
  echo # 191 - German Lang on Steel Wave (Shey) -Same-
  echo # 20 - German Lang on Shadow Legacy 
  echo # 21 - Placeholder
	echo --------------------------------------------------
	set /p version="Enter Selection:"
	if %version%==0 (
	cls
	goto Extra
	)
	MODE 100,40
	set /p username="Enter Steam Username:"

	if %version%==1 (
  dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359555 -manifest 3953006809848583127 -username %username% -remember-password -dir "Downloads\Y1S0_Vanilla" -validate -max-servers 15 -max-downloads 10
	pause
	cls
	echo Download complete!
	echo It's German Lang on Vanilla
	goto mainmenu
	)
  if %version%==2 (
  dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359555 -manifest 7470955591961528063 -username %username% -remember-password -dir "Downloads\Y1S1_Black_Ice" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's German Lang on Black Ice 
  goto mainmenu
  )
  if %version%==3 (
  dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359555 -manifest 781358903497748263 -username %username% -remember-password -dir "Downloads\Y1S2_Dust_Line" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's German Lang on Dust Line
  goto mainmenu
  )
  if %version%==4 (
  dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359555 -manifest 1926652807113950777 -username %username% -remember-password -dir "Downloads\Y1S3_Skull_Rain" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's German Lang on Skull Rain
  goto mainmenu
  )
  if %version%==41 (
  dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359555 -manifest 1926652807113950777 -username %username% -remember-password -dir "Downloads\Y1S3_SkullRain" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's German Lang on Skull Rain (Shey)
  goto mainmenu
  )
  if %version%==5 (
  dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359555 -manifest 7995072742170754868 -username %username% -remember-password -dir "Downloads\Y1S4_Red_Crow" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's German Lang on Red Crow
  goto mainmenu
  )
  if %version%==6 (
  dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359555 -manifest 7391813408396935946 -username %username% -remember-password -dir "Downloads\Y2S1_Velvet_Shell" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's German Lang on Velvet Shell
  goto mainmenu
  )
  if %version%==7 (
  dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359555 -manifest 4850286352511597480 -username %username% -remember-password -dir "Downloads\Y2S2_Health" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's German Lang on Health
  goto mainmenu
  )
  if %version%==71 (
  dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359555 -manifest 4850286352511597480 -username %username% -remember-password -dir "Downloads\Y2S2_Health_2" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's German Lang on Health (Shey)
  goto mainmenu
  )
  if %version%==8 (
  dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359555 -manifest 7173152983008794231 -username %username% -remember-password -dir "Downloads\Y2S3_Blood_Orchid" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's German Lang on Blood Orchid
  goto mainmenu
  )
  if %version%==81 (
  dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359555 -manifest 7173152983008794231 -username %username% -remember-password -dir "Downloads\Y2S3_BloodOrchid" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's German Lang on Blood Orchid (Shey)
  goto mainmenu
  )
  if %version%==9 (
  dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359555 -manifest 1122657510721658234 -username %username% -remember-password -dir "Downloads\Y2S4_White_Noises" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's German Lang on White Noise
  goto mainmenu
  )
  if %version%==91 (
  dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359555 -manifest 1122657510721658234 -username %username% -remember-password -dir "Downloads\Y2S4_WhiteNoise" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's German Lang on White Noise (Shey)
  goto mainmenu
  )
  if %version%==10 (
  dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359555 -manifest 365667853833643908 -username %username% -remember-password -dir "Downloads\Y3S1_Chimera" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's German Lang on Chimera
  goto mainmenu
  )
  if %version%==11 (
  dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359555 -manifest 436165049364805671 -username %username% -remember-password -dir "Downloads\Y3S2_Para_Bellum" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's German Lang on Para Bellum
  goto mainmenu
  )
  if %version%==12 (
  dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359555 -manifest 6254711869946987864 -username %username% -remember-password -dir "Downloads\Y3S3_Grim_Sky" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's German Lang on Grim Sky
  goto mainmenu
  )
  if %version%==121 (
  dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359555 -manifest 6254711869946987864 -username %username% -remember-password -dir "Downloads\Y3S3_GrimSky" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's German Lang on Grim Sky (Shey)
  goto mainmenu
  )
  if %version%==13 (
  dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359555 -manifest 6357970357791494519 -username %username% -remember-password -dir "Downloads\Y3S4_Wind_Bastion" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's German Lang on Wind Bastion
  goto mainmenu
  )
  if %version%==14 (
  dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359555 -manifest 6166102473910342218 -username %username% -remember-password -dir "Downloads\Y4S1_Burnt_Horizon" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's German Lang on Burnt Horizon
  goto mainmenu
  )
  if %version%==141 (
  dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359555 -manifest 6166102473910342218 -username %username% -remember-password -dir "Downloads\Y4S1_BurntHorizon" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's German Lang on Burnt Horizon (Shey)
  goto mainmenu
  )
  if %version%==15 (
  dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359555 -manifest 2945239480726569964 -username %username% -remember-password -dir "Downloads\Y4S2_Phantom_Sight" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's German Lang on Phantom Sight 
  goto mainmenu
  )
  if %version%==16 (
  dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359555 -manifest 5892684040914151033 -username %username% -remember-password -dir "Downloads\Y4S3_Ember_Rise" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's German Lang on Ember Rise 
  goto mainmenu
  )
  if %version%==161 (
  dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359555 -manifest 5892684040914151033 -username %username% -remember-password -dir "Downloads\Y4S3_EmberRise" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's German Lang on Ember Rise (Shey)
  goto mainmenu
  )
  if %version%==17 (
  dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359555 -manifest 1771833119782386213 -username %username% -remember-password -dir "Downloads\Y4S4_Shifting_Tides" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's German Lang on Shifting Tides 
  goto mainmenu
  )
  if %version%==18 (
  dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359555 -manifest 4220186838055347645 -username %username% -remember-password -dir "Downloads\Y5S1_Void_Edge" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's German Lang on Void Edge 
  goto mainmenu
  )
  if %version%==181 (
  dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359555 -manifest 4220186838055347645 -username %username% -remember-password -dir "Downloads\Y5S1_VoidEdge" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's German Lang on Void Edge (Shey)
  goto mainmenu
  )
  if %version%==19 (
  dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359555 -manifest 9103781936104145156 -username %username% -remember-password -dir "Downloads\Y5S2_Steel_Wave" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's German Lang on Steel Wave 
  goto mainmenu
  )
  if %version%==191 (
  dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359555 -manifest 9103781936104145156 -username %username% -remember-password -dir "Downloads\Y5S2_SteelWave" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's German Lang on Steel Wave (Shey)
  goto mainmenu
  )
  if %version%==20 (
  dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359555 -manifest 615915835199657008 -username %username% -remember-password -dir "Downloads\Y5S3_Shadow_Legacy" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's German Lang on Shadow Legacy
  goto mainmenu
  )
  if %version%==21 (
  dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359555 -manifest %manifest% -username %username% -remember-password -dir "Downloads\Placeholder" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's German Lang on Placeholder
  goto mainmenu
  )
	goto Extra
::German END


::Spanish START
:Spanish
  cls
  Title Rainbow Six Siege Spanish Lang Downloader
  MODE 52,38
  echo           Spanish Language Downloader
  echo         What would you like to select?
  echo --------------------------------------------------
  echo # 0 - Back
  echo --------------------------------------------------
  echo # 1 - Spanish Lang on Vanilla
  echo # 2 - Spanish Lang on Black Ice 
  echo # 3 - Spanish Lang on Dust Line 
  echo # 4 - Spanish Lang on Skull Rain 
  echo # 41 - Spanish Lang on Skull Rain (Shey) -Same-
  echo # 5 - Spanish Lang on Red Crow 
  echo # 6 - Spanish Lang on Velvet Shell 
  echo # 7 - Spanish Lang on Health 
  echo # 71 - Spanish Lang on Health (Shey) -Same-
  echo # 8 - Spanish Lang on Blood Orchid 
  echo # 81 - Spanish Lang on Blood Orchid (Shey) -Same-
  echo # 9 - Spanish Lang on White Noise 
  echo # 91- Spanish Lang on White Noise (Shey) -Same-
  echo # 10 - Spanish Lang on Chimera 
  echo # 11 - Spanish Lang on Para Bellum 
  echo # 12 - Spanish Lang on Grim Sky 
  echo # 121 - Spanish Lang on Grim Sky (Shey) -Same-
  echo # 13 - Spanish Lang on Wind Bastion
  echo # 14 - Spanish Lang on Burnt Horizon 
  echo # 141 - Spanish Lang on Burnt Horizon (Shey) -Same-
  echo # 15 - Spanish Lang on Phantom Sight 
  echo # 16 - Spanish Lang on Ember Rise 
  echo # 161 - Spanish Lang on Ember Rise (Shey) -Same-
  echo # 17 - Spanish Lang on Shifting Tides 
  echo # 18 - Spanish Lang on Void Edge 
  echo # 181 - Spanish Lang on Void Edge (Shey) -Same-
  echo # 19 - Spanish Lang on Steel Wave 
  echo # 191 - Spanish Lang on Steel Wave (Shey) -Same-
  echo # 20 - Spanish Lang on Shadow Legacy 
  echo # 21 - Placeholder
  echo --------------------------------------------------
  set /p version="Enter Selection:"
  if %version%==0 (
  cls
  goto Extra
  )
  MODE 100,40
  set /p username="Enter Steam Username:"
  
  if %version%==1 (
  dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359556 -manifest 6248979332984503061 -username %username% -remember-password -dir "Downloads\Y1S0_Vanilla" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Spanish Lang on Vanilla
  goto mainmenu
  )
  if %version%==2 (
  dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359556 -manifest 6534545487175120142 -username %username% -remember-password -dir "Downloads\Y1S1_Black_Ice" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Spanish Lang on Black Ice 
  goto mainmenu
  )
  if %version%==3 (
  dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359556 -manifest 8080893511664284255 -username %username% -remember-password -dir "Downloads\Y1S2_Dust_Line" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Spanish Lang on Dust Line
  goto mainmenu
  )
  if %version%==4 (
  dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359556 -manifest 3102063947541599011 -username %username% -remember-password -dir "Downloads\Y1S3_Skull_Rain" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Spanish Lang on Skull Rain
  goto mainmenu
  )
  if %version%==41 (
  dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359556 -manifest 3102063947541599011 -username %username% -remember-password -dir "Downloads\Y1S3_SkullRain" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Spanish Lang on Skull Rain (Shey)
  goto mainmenu
  )
  if %version%==5 (
  dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359556 -manifest 3745420316643316529 -username %username% -remember-password -dir "Downloads\Y1S4_Red_Crow" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Spanish Lang on Red Crow
  goto mainmenu
  )
  if %version%==6 (
  dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359556 -manifest 4034802727985013756 -username %username% -remember-password -dir "Downloads\Y2S1_Velvet_Shell" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Spanish Lang on Velvet Shell
  goto mainmenu
  )
  if %version%==7 (
  dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359556 -manifest 7743695641492470240 -username %username% -remember-password -dir "Downloads\Y2S2_Health" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Spanish Lang on Health
  goto mainmenu
  )
  if %version%==71 (
  dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359556 -manifest 7743695641492470240 -username %username% -remember-password -dir "Downloads\Y2S2_Health_2" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Spanish Lang on Health (Shey)
  goto mainmenu
  )
  if %version%==8 (
  dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359556 -manifest 7768315116657553428 -username %username% -remember-password -dir "Downloads\Y2S3_Blood_Orchid" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Spanish Lang on Blood Orchid
  goto mainmenu
  )
  if %version%==81 (
  dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359556 -manifest 7768315116657553428 -username %username% -remember-password -dir "Downloads\Y2S3_BloodOrchid" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Spanish Lang on Blood Orchid (Shey)
  goto mainmenu
  )
  if %version%==9 (
  dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359556 -manifest 7877024295509467816 -username %username% -remember-password -dir "Downloads\Y2S4_White_Noises" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Spanish Lang on White Noise
  goto mainmenu
  )
  if %version%==91 (
  dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359556 -manifest 7877024295509467816 -username %username% -remember-password -dir "Downloads\Y2S4_WhiteNoise" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Spanish Lang on White Noise (Shey)
  goto mainmenu
  )
  if %version%==10 (
  dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359556 -manifest 723936785330189072 -username %username% -remember-password -dir "Downloads\Y3S1_Chimera" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Spanish Lang on Chimera
  goto mainmenu
  )
  if %version%==11 (
  dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359556 -manifest 3396331896624899011 -username %username% -remember-password -dir "Downloads\Y3S2_Para_Bellum" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Spanish Lang on Para Bellum
  goto mainmenu
  )
  if %version%==12 (
  dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359556 -manifest 2769168610408745300 -username %username% -remember-password -dir "Downloads\Y3S3_Grim_Sky" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Spanish Lang on Grim Sky
  goto mainmenu
  )
  if %version%==121 (
  dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359556 -manifest 2769168610408745300 -username %username% -remember-password -dir "Downloads\Y3S3_GrimSky" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Spanish Lang on Grim Sky (Shey)
  goto mainmenu
  )
  if %version%==13 (
  dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359556 -manifest 1310832078295252288 -username %username% -remember-password -dir "Downloads\Y3S4_Wind_Bastion" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Spanish Lang on Wind Bastion
  goto mainmenu
  )
  if %version%==14 (
  dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359556 -manifest 8980928302668128431 -username %username% -remember-password -dir "Downloads\Y4S1_Burnt_Horizon" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Spanish Lang on Burnt Horizon
  goto mainmenu
  )
  if %version%==141 (
  dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359556 -manifest 8980928302668128431 -username %username% -remember-password -dir "Downloads\Y4S1_BurntHorizon" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Spanish Lang on Burnt Horizon (Shey)
  goto mainmenu
  )
  if %version%==15 (
  dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359556 -manifest 3119251800260595817 -username %username% -remember-password -dir "Downloads\Y4S2_Phantom_Sight" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Spanish Lang on Phantom Sight 
  goto mainmenu
  )
  if %version%==16 (
  dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359556 -manifest 4178602548762056641 -username %username% -remember-password -dir "Downloads\Y4S3_Ember_Rise" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Spanish Lang on Ember Rise 
  goto mainmenu
  )
  if %version%==161 (
  dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359556 -manifest 3299372491475509511 -username %username% -remember-password -dir "Downloads\Y4S3_EmberRise" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Spanish Lang on Ember Rise (Shey)
  goto mainmenu
  )
  if %version%==17 (
  dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359556 -manifest 5607986007728468442 -username %username% -remember-password -dir "Downloads\Y4S4_Shifting_Tides" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Spanish Lang on Shifting Tides 
  goto mainmenu
  )
  if %version%==18 (
  dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359556 -manifest 8280780297583800068 -username %username% -remember-password -dir "Downloads\Y5S1_Void_Edge" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Spanish Lang on Void Edge 
  goto mainmenu
  )
  if %version%==181 (
  dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359556 -manifest 8280780297583800068 -username %username% -remember-password -dir "Downloads\Y5S1_VoidEdge" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Spanish Lang on Void Edge (Shey)
  goto mainmenu
  )
  if %version%==19 (
  dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359556 -manifest 3323378213398656976 -username %username% -remember-password -dir "Downloads\Y5S2_Steel_Wave" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Spanish Lang on Steel Wave 
  goto mainmenu
  )
  if %version%==191 (
  dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359556 -manifest 3323378213398656976 -username %username% -remember-password -dir "Downloads\Y5S2_SteelWave" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Spanish Lang on Steel Wave (Shey)
  goto mainmenu
  )
  if %version%==20 (
  dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359556 -manifest 2485600059396261361 -username %username% -remember-password -dir "Downloads\Y5S3_Shadow_Legacy" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Spanish Lang on Shadow Legacy
  goto mainmenu
  )
  if %version%==21 (
  dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359556 -manifest %manifest% -username %username% -remember-password -dir "Downloads\Placeholder" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Spanish Lang on Placeholder
  goto mainmenu
  )
  goto Extra
::Spanish END



::StartGame START
:StartGame
cls
Title Rainbow Six Siege Game Starter
echo StartGame Loaded>>log.log
MODE 50,50
echo --------------------------------------------------
echo # 0 = Back
echo # 1 = FAQ
echo --------------------------------------------------
echo Start Game:
echo # 2 = Vanilla 1.0 (Y1S0) [First Steam Version] 
echo # 3 = Black Ice (Y1S1_release)
echo # 4 = Dust Line (Y1S2_release)
echo # 5 = Skull Rain (Y1S3_release)
echo # 51 = Skull Rain (4.2)
echo # 6 = Red Crow (Y1S4_release)
echo # 7 = Velvet Shell (Y2S1_release)
echo # 8 = Health (Y2S2_release)
echo # 81 = Health (Shey Manifest)
echo # 9 = Blood Orchid (Y2S3_release)
echo # 91 = Blood Orchid (2.3.1.1) X
echo # 10 = White Noise (Y2S4_release)
echo # 101= White Noise (Shey Manifest)
echo # 11 = Chimera [(Y3S1_release)] X 
echo # 12 = Para Bellum (Y3S2_release)
echo # 13 = Grim Sky (Y3S3_release)
echo # 131 = Grim Sky (Shey Manifest)
echo # 14 = Wind Bastion (Y3S4_release)
echo # 15 = Burnt Horizon (Y3S1_release)
echo # 151 = Burnt Horizon (Shey Manifest)
echo # 16 = Phantom Sight (Y4S2_release)
echo # 17 = Ember Rise (Y4S3_release)
echo # 171 = Ember Rise (Shey Manifest)
echo # 18 = Shifting Tides (Y4S4_release)
echo # 19 = Void Edge (Y5S1_release)
echo # 191 = Void Edge (Shey Manifest)
echo # 20 = Steel Wave (Y5S2_release)
echo # 201 = Steel Wave (Shey Manifest)
echo # 21 = Shadow Legacy (Y5S3_release)
echo # 22 = Placeholder
echo --------------------------------------------------
echo Start Event:
echo # 1399 = Mad House
echo # 1599 = Rainbow is Magic
echo # 1999 = The Grand Larceny
echo # 2099 = M.U.T.E
echo --------------------------------------------------
echo Start Liberator:
echo # 0017 = R6 Liberator 0.0.0.17
echo # 0019 = R6 Liberator 0.0.0.19 TEST
echo # 0020 = R6 Liberator 0.0.0.20b TEST
echo # 0021 = R6 Liberator 0.0.0.21 TEST
echo # 0022 = R6 Liberator 0.0.0.22
set /p startgame="Start:"
if %startgame%==0 (
cls
goto mainmenu
)
::Start GameStarter
if %startgame%==1 (
cls
goto FAQ
)
if %startgame%==2 (
	if exist "Downloads\Y1S0_Vanilla\RainbowSix.exe" (
		echo Starting.....
		Downloads\Y1S0_Vanilla\RainbowSix.exe /belaunch
		pause
		)
	goto DownloadMenu
)
if %startgame%==3 (
	if exist "Downloads\Y1S1_Black_Ice\RainbowSix.exe" (
		echo Starting.....
		Downloads\Y1S1_Black_Ice\RainbowSix.exe /belaunch
		pause
		)
	goto DownloadMenu
)
if %startgame%==4 (
	if exist "Downloads\Y1S2_Dust_Line\RainbowSix.exe" (
		echo Starting.....
		Downloads\Y1S2_Dust_Line\RainbowSix.exe /belaunch
		pause
		)
	goto DownloadMenu
)
if %startgame%==5 (
	if exist "Downloads\Y1S3_Skull_Rain\RainbowSixGame.exe" (
		echo Starting.....
		Downloads\Y1S3_Skull_Rain\RainbowSixGame.exe /belaunch
		pause
		)
	goto DownloadMenu
)
if %startgame%==51 (
	if exist "Downloads\Y1S3_SkullRain\RainbowSixGame.exe" (
		echo Starting.....
		Downloads\Y1S3_SkullRain\RainbowSixGame.exe /belaunch
		pause
		)
	goto DownloadMenu
)
if %startgame%==6 (
	if exist "Downloads\Y1S4_Red_Crow\RainbowSixGame.exe" (
		echo Starting.....
		Downloads\Y1S4_Red_Crow\RainbowSixGame.exe /belaunch
		pause
		)
	goto DownloadMenu
)
if %startgame%==7 (
	if exist "Downloads\Y2S1_Velvet_Shell\RainbowSixGame.exe" (
		echo Starting.....
		Downloads\Y2S1_Velvet_Shell\RainbowSixGame.exe /belaunch
		pause
		)
	goto DownloadMenu
)
if %startgame%==8 (
	if exist "Downloads\Y2S2_Health\RainbowSixGame.exe" (
		echo Starting.....
		Downloads\Y2S2_Health\RainbowSixGame.exe /belaunch
		pause
		)
	goto DownloadMenu
)
if %startgame%==81 (
  if exist "Downloads\Y2S2_Health_2\RainbowSix.exe" (
    echo Starting.....
    Downloads\Y2S2_Health_2\RainbowSix.exe /belaunch
    pause
    )
  goto DownloadMenu
)
if %startgame%==9 (
	if exist "Downloads\Y2S3_Blood_Orchid\RainbowSix.exe" (
		echo Starting.....
		Downloads\Y2S3_Blood_Orchid\RainbowSix.exe /belaunch
		pause
		)
	goto DownloadMenu
)
if %startgame%==91 (
	if exist "Downloads\Y2S3_BloodOrchid\RainbowSix.exe" (
		echo Starting.....
		Downloads\Y2S3_BloodOrchid\RainbowSix.exe /belaunch
		pause
		)
	goto DownloadMenu
)
if %startgame%==10 (
	if exist "Downloads\Y2S4_White_Noise\RainbowSix.exe" (
		echo Starting.....
		Downloads\Y2S4_White_Noise\RainbowSix.exe /belaunch
		pause
		)
	goto DownloadMenu
)
if %startgame%==101 (
  if exist "Downloads\Y2S4_WhiteNoise\RainbowSix.exe" (
    echo Starting.....
    Downloads\Y2S4_WhiteNoise\RainbowSix.exe /belaunch
    pause
    )
  goto DownloadMenu
)
if %startgame%==11 (
	if exist "Downloads\Y3S1_Chimera\RainbowSix.exe" (
		echo Starting.....
		Downloads\Y3S1_Chimera\RainbowSix.exe /belaunch
		pause
		)
	goto DownloadMenu
)
if %startgame%==12 (
	if exist "Downloads\Y3S2_Para_Bellum\RainbowSix.exe" (
		echo Starting.....
		Downloads\Y3S2_Para_Bellum\RainbowSix.exe /belaunch
		pause
		)
	goto DownloadMenu
)
if %startgame%==13 (
	if exist "Downloads\Y3S3_Grim_Sky\RainbowSix.exe" (
		echo Starting.....
		Downloads\Y3S3_Grim_Sky\RainbowSix.exe /belaunch
		pause
		)
	goto DownloadMenu
)
if %startgame%==131 (
  if exist "Downloads\Y3S3_GrimSky\RainbowSix.exe" (
    echo Starting.....
    Downloads\Y3S3_GrimSky\RainbowSix.exe /belaunch
    pause
    )
  goto DownloadMenu
)
if %startgame%==14 (
	if exist "Downloads\Y3S4_Wind_Bastion\RainbowSix.exe" (
		echo Starting.....
		Downloads\Y3S4_Wind_Bastion\RainbowSix.exe /belaunch
		pause
		)
	goto DownloadMenu
)
if %startgame%==15 (
	if exist "Downloads\Y4S1_Burnt_Horizon\RainbowSix.exe" (
		echo Starting.....
		Downloads\Y4S1_Burnt_Horizon\RainbowSix.exe /belaunch
		pause
		)
	goto DownloadMenu
)
if %startgame%==151 (
  if exist "Downloads\Y4S1_BurntHorizon\RainbowSix.exe" (
    echo Starting.....
    Downloads\Y4S1_BurntHorizon\RainbowSix.exe /belaunch
    pause
    )
  goto DownloadMenu
)
if %startgame%==16 (
	if exist "Downloads\Y4S2_Phantom_Sight\RainbowSix.exe" (
		echo Starting.....
		Downloads\Y4S2_Phantom_Sight\RainbowSix.exe /belaunch
		pause
		)
	goto DownloadMenu
)
if %startgame%==17 (
	if exist "Downloads\Y4S3_Ember_Rise\RainbowSix.exe" (
		echo Starting.....
		Downloads\Y4S3_Ember_Rise\RainbowSix.exe /belaunch
		pause
		)
	goto DownloadMenu
)
if %startgame%==171 (
  if exist "Downloads\Y4S3_EmberRise\RainbowSix.exe" (
    echo Starting.....
    Downloads\Y4S3_EmberRise\RainbowSix.exe /belaunch
    pause
    )
  goto DownloadMenu
)
if %startgame%==18 (
	if exist "Downloads\Y4S4_Shifting_Tides\RainbowSix.exe" (
		echo Starting.....
		Downloads\Y4S4_Shifting_Tides\RainbowSix.exe /belaunch
		pause
		)
	goto DownloadMenu
)
if %startgame%==19 (
	if exist "Downloads\Y5S1_Void_Edge\RainbowSix.exe" (
		echo Starting.....
		Downloads\Y5S1_Void_Edge\RainbowSix.exe /belaunch
		pause
		)
	goto DownloadMenu
)
if %startgame%==191 (
  if exist "Downloads\Y5S1_VoidEdge\RainbowSix.exe" (
    echo Starting.....
    Downloads\Y5S1_VoidEdge\RainbowSix.exe /belaunch
    pause
    )
  goto DownloadMenu
)
if %startgame%==20 (
	if exist "Downloads\Y5S2_Steel_Wave\RainbowSix.exe" (
		echo Starting.....
		Downloads\Y5S2_Steel_Wave\RainbowSix.exe /belaunch
		pause
		)
	goto DownloadMenu
)
if %startgame%==201 (
  if exist "Downloads\Y5S2_SteelWave\RainbowSix.exe" (
    echo Starting.....
    Downloads\Y5S2_SteelWave\RainbowSix.exe /belaunch
    pause
    )
  goto DownloadMenu
)
if %startgame%==21 (
  if exist "Downloads\Y5S3_Shadow_Legacy\RainbowSix.exe" (
    echo Starting.....
    Downloads\Y5S3_Shadow_Legacy\RainbowSix.exe /belaunch
    pause
    )
if %startgame%==22 (
  if exist "Downloads\Placeholder\RainbowSix.exe" (
    echo Starting.....
    Downloads\Placeholder\RainbowSix.exe /belaunch
    pause
    )
  goto DownloadMenu
)
  goto DownloadMenu
)
::End GameStarter
::Start EvenStrarter
if %startgame%==1399 (
	if exist "Downloads\Y3S3_MadHouse\RainbowSix.exe" (
		echo Starting.....
		Downloads\Y3S3_MadHouse\RainbowSix.exe /belaunch
		pause
		)
	goto DownloadMenu
)
if %startgame%==1599 (
	if exist "Downloads\Y4S1_RainbowIsMagic\RainbowSix.exe" (
		echo Starting.....
		Downloads\Y4S1_RainbowIsMagic\RainbowSix.exe /belaunch
		pause
		)
	goto DownloadMenu
)
if %startgame%==1999 (
	if exist "Downloads\Y5S1_TheGrandLarceny\RainbowSix.exe" (
		echo Starting.....
		Downloads\Y5S1_TheGrandLarceny\RainbowSix.exe /belaunch
		pause
		)
	goto DownloadMenu
)
if %startgame%==2099 (
	if exist "Downloads\Y5S2_MUTE\RainbowSix.exe" (
		echo Starting.....
		Downloads\Y5S2_MUTE\RainbowSix.exe /belaunch
		pause
		)
	goto DownloadMenu
)
::End EventStarter
::Start Liberator
if %startgame%==0017 (
	if exist "Requirements\Liberators\R6_Liberator_0.0.0.17.exe" (
		echo Starting.....
		Requirements\Liberators\R6_Liberator_0.0.0.17.exe
		pause
		)
	goto mainmenu
)
if %startgame%==0019 (
	if exist "Requirements\Liberators\R6_Liberator_0.0.0.19_Test.exe" (
		echo Starting.....
		Requirements\Liberators\R6_Liberator_0.0.0.19_Test.exe
		pause
		)
	goto mainmenu
)
if %startgame%==0020 (
	if exist "Requirements\Liberators\R6_Liberator_0.0.0.20b_Test.exe" (
		echo Starting.....
		Requirements\Liberators\R6_Liberator_0.0.0.20b_Test.exe
		pause
		)
	goto mainmenu
)
if %startgame%==0021 (
	if exist "Requirements\Liberators\R6_Liberator_0.0.0.21_Test.exe" (
		echo Starting.....
		Requirements\Liberators\R6_Liberator_0.0.0.21_Test.exe
		pause
		)
	goto mainmenu
)
if %startgame%==0022 (
	if exist "Requirements\Liberators\R6_Liberator_0.0.0.22.exe" (
		echo Starting.....
		Requirements\Liberators\R6_Liberator_0.0.0.22.exe
		pause
		)
	goto mainmenu
)
::End Liberator
goto StartGame
::StartGame END


::dxvcredist START
:dxvcredist
Title DirectX + VC Redist Downloader
MODE 40,10
echo  What would you like to select?
echo - 0 : Back
echo - 1 : DirectX
echo - 10 : VC 2010 Redist  
echo - 12 : VC 2012 Redist  
echo - 15 : VC 2015 Redist  
echo - 17 : VC 2017 Redist
set /p downdxvc="Enter Selection:"
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
::dxvcredist END



::CREDIT START
::© 2020 SlejmUr
:Credit
  Title CREDIT
  MODE 75,20
  echo I would like to thank everyone who helped this project getting developed:
  echo Thanks Shey to I get some manifest!
  echo Thanks Zer0Byte the first version of MenuV!
  echo Thanks DepotDownloader creators!
  echo Thanks SublimeText creators!
  echo Thanks SteamDB!
  echo Thanks Cheato for Liberators,and FAQ!
  echo Thanks Markster for Plaza's!
  echo And thank you for using it!
  echo Thanks Ancientkingg for Log idea, DotNet Checker Second Version
  echo First Version: 2020 June 17
  echo Updated Version: 2020 Sept TDB
  pause
  cls
  goto mainmenu
::CREDIT END


::BattlEyeChecker START
:BattlEyeChecker
color 09
MODE 36,8
set EXE=RainbowSix_BE.exe
FOR /F %%x IN ('tasklist /NH /FI "IMAGENAME eq %EXE%"') DO IF %%x == %EXE% goto FOUND
echo ------------------------------------
echo [-] BattleEye is Not running
echo [-] BattleEye is Not running  - %TIME% >>log.log
echo ------------------------------------
goto FIN
:FOUND
echo ------------------------------------
echo [+] BattleEye is running
echo [+] BattleEye is running  - %TIME% >>log.log
echo ------------------------------------
:FIN
pause
goto mainmenu
::BattlEyeChecker END



::just testing nothing use this:
:Seasonsize
  Title Rainbow Six Siege Version Size
  MODE 46,30
  echo ---------------------------------------
  echo          [Y1S0_Vanilla] 14,2 GB ✔
  echo          [Y1S1_Black_Ice] 16,7 GB ✔
  echo          [Y1S2_Dust_Line] 20,9 GB ✔
  echo          [Y1S3_Skull_Rain] 25.1 GB (✔
  echo          [Y1S4_Red_Crow] 28,5 GB
  echo          [Y2S1_Velvet_Shell] 33,2 GB 
  echo          [Y2S2_Health] 34 GB (✔
  echo          [Y2S3_Blood_Orchid] 34,3 GB
  echo          [Y2S4_White_Noise] 48,7 GB 
  echo          [Y3S1_Chimera] 58,8 GB
  echo          [Y3S2_Para_Bellum] 60.6 GB ✔
  echo          [Y3S3_Grim_Sky] 72.6 GB
  echo          [Y4S1_Burnt_Horizon] 82.7 GB
  echo          [Y4S2_Phantom_Sight] 64.9 GB
  echo          [Y4S3_Ember_Rise] 69.6 GB
  echo          [Y3S4_Wind_Bastion] 76.9 GB
  echo          [Y4S4_Shifting_Tides] 75,2 GB ✔
  echo          [Y5S1_Void_Edge] 74,3 GB ✔
  echo          [Y5S2_Steel_Wave] 81,3 GB
  echo ---------------------------------------
  pause
  cls
  goto mainmenu
::end

exit
