@echo off
chcp 65001
::hun char ^^
setlocal enableextensions enabledelayedexpansion
set homepath=%cd%

goto verifydotnet


::Dotnet start
:verifydotnet
if exist "C:\Program Files\dotnet\dotnet.exe" (
  goto 7zipcheck
) else (
  goto downloaddotnet 
)

:downloaddotnet 
MODE 40,10
echo ---------------------------------------
echo       Install .NET Runtime !!
echo ---------------------------------------
start www.tinyurl.com/dotnetr6
pause
echo      Press Space after install
echo ---------------------------------------
goto verifydotnet
::dotnet end

::7zip start
:move7
move 7z.exe Requirements
goto 7zipcheck

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
curl -L  "https://github.com/SlejmUr/OldR6S/raw/master/Requirements/7z.exe" --output 7z.exe
cls
goto move7
cls
)
::7zip end

::DD start
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
  goto chechinstallbat 
) else (
  goto DepotDownloader
)
::DD end


::installer start
:installbat
  cls
  MODE 78,20
  echo ------------------------------------------------------------------------------
  echo                              Downloading Install.bat...
  echo ------------------------------------------------------------------------------
  curl -L  "https://github.com/SlejmUr/OldR6S/raw/master/Installer/Install.bat" --output Install.bat
  move Install.bat Requirements
  echo Please run Requirements\Install.bat 
  goto mainmenu
  )
:chechinstallbat
  cls
  if exist "Requirements\Install.bat" (
  echo Install.bat Founded! If you are using old version please update new version!
  goto mainmenu
  ) else (
  echo Install.bat Not Founded!
  goto installbat
  )
::installer end







:mainmenu
cls
Title R6S Version AllInOne Downloader
MODE 100,20
echo -----------------------------------------------------------
echo  Rainbow Six Siege Old Version Downloader
echo  You MUST have a copy of Siege on Steam to use the downloader.
echo  ADDED ALL SEASON!
echo  Tool Version: DEV
echo  Read FAQ!
echo -----------------------------------------------------------
echo  What would you like to select?
echo  0 = Exit
echo  1 = Download or Uninstall the Game
echo  2 = Extra Language - Getting Manifests
echo  3 = 4K Textures
echo  4 = FAQ and Notes
echo  5 = DirectX + VC Redist Downloader
echo  6 = Download PLAZA's and Liberators
echo  7 = Credits
echo  8 = Start Game
echo  9 = JOIN Throwback community!
echo -----------------------------------------------------------
set /p option="Enter Selection:"

if %option%==0 (
cls
exit
)
if %option%==1 (
cls
goto DownloadMenu
)
if %option%==2 (
cls
goto Extra
)
if %option%==3 (
cls
goto TextureMenu
)
if %option%==4 (
cls
goto faq
)
if %option%==5 (
cls
goto dxvcredist
)
if %option%==6 (
cls
goto PlazaCheck
)
if %option%==7 (
cls
goto Credit
)
if %option%==8 (
cls
goto StartGame
)
if %option%==9 (
cls
start http://r6modding.com/
pause
goto mainmenu
)
goto mainmenu


:Seasonsize
Title Rainbow Six Siege Version Size
MODE 46,30
  echo ---------------------------------------
  echo          [Y1S0_Vanilla] 14,2 GB ✔
  echo          [Y1S1_Black_Ice] 16,7 GB ✔
  echo          [Y1S2_Dust_Line] 20,9 GB
  echo          [Y1S3_Skull_Rain] 25.1 GB
  echo          [Y1S4_Red_Crow] 28,5 GB
  echo          [Y2S1_Velvet_Shell] 33,2 GB 
  echo          [Y2S2_Health] 34 GB
  echo          [Y2S3_Blood_Orchid] 34,3 GB
  echo          [Y2S4_White_Noise] 48,7 GB 
  echo          [Y3S1_Chimera] 58,8 GB
  echo          [Y3S2_Para_Bellum] 60.6 GB ✔
  echo          [Y3S3_Grim_Sky] 72.6 GB
  echo          [Y4S1_Burnt_Horizon] 82.7 GB
  echo          [Y4S2_Phantom_Sight] 64.9 GB
  echo          [Y4S3_Ember_Rise] 69.6 GB
  echo          [Y4S4_Shifting_Tides] 75,2 GB ✔
  echo          [Y5S1_Void_Edge] 74,3 GB ✔
  echo          [Y5S2_Steel_Wave] 81,3 GB
  echo ---------------------------------------
pause
cls
goto mainmenu



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



:faq
Title FAQ
MODE 150,50
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
pause
cls
goto Notes

:Notes
Title Notes
MODE 150,50
echo  Notes:
echo  Not all Manifest support Liberator!
echo  I'm not tested this manifests: White_Noise, Para_Bellum, Grim_Sky, Burnt_Horizon and ALL 4K Textures, and Language!
echo  Planning to add Extra Language option!
echo  If Cheato Update Liberator , I update this Tool!
echo  If you have a problem this tool, DM me on Discord! SlejmUr#4007
pause
cls
goto mainmenu

:DownloadMenu
cls
Title Rainbow Six Siege Version Downloader
MODE 50,38
echo What would you like to select?
echo --------------------------------------------------
echo # 0 - Back
echo # 1 - Download Events
echo --------------------------------------------------
echo # 2 = Vanilla 1.0 (Y1S0) [First Steam Version] 
echo # 3 = Black Ice (Y1S1_release) 
echo # 4 = Dust Line (Y1S2_release)
echo # 5 = Skull Rain (Y1S3_release)
echo # 51 = Skull Rain (Shey Manifest) 
echo # 6 = Red Crow (Y1S4_release)
echo # 7 = Velvet Shell (Y2S1_release)
echo # 8 = Health (Y2S2_release)
echo # 81 = Health (Shey Manifest)
echo # 9 = Blood Orchid (Y2S3_release)
echo # 91 = Blood Orchid (Shey Manifest)
echo # 10 = White Noise (Y2S4_release)
echo # 101=  White Noise (Shey Manifest)
echo # 11 = Chimera [(Y3S1_release)]
echo # 12 = Para Bellum (Y3S2_release)
echo # 13 = Grim Sky (Y3S3_release)
echo # 131= Grim Sky (Shey Manifest)
echo # 14 = Wind Bastion (Y3S4_release)
echo # 15 = Burnt Horizon (Y3S1_release)
echo # 151= Burnt Horizon (Shey Manifest)
echo # 16 = Phantom Sight (Y4S2_release)
echo # 17 = Ember Rise (Y4S3_release)
echo # 171= Ember Rise (Shey Manifest)
echo # 18 = Shifting Tides (Y4S4_release)
echo # 19 = Void Edge (Y5S1_release)
echo # 191= Void Edge (Shey Manifest)
echo # 20 = Steel Wave (Y5S2_release)
echo # 201 = Latest R6 Version!
echo --------------------------------------------------
set /p version="Enter Selection:"
if %version%==0 (
cls
goto mainmenu
)
if %version%==1 (
cls
goto EventMenu
)
MODE 100,40
set /p username="Enter Steam Username:"



::Vanilla
if %version%==2 (
dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 8358812283631269928 -username %username% -remember-password -dir "Downloads\Y1S0_Vanilla" -validate -max-servers 15 -max-downloads 10
dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 3893422760579204530 -username %username% -remember-password -dir "Downloads\Y1S0_Vanilla" -validate -max-servers 15 -max-downloads 10
pause
cls
echo Download complete!
echo It's Vanilla!
goto mainmenu
)
::BLACK ICE Released
if %version%==3 (
dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 5188997148801516344 -username %username% -remember-password -dir "Downloads\Y1S1_Black_Ice" -validate -max-servers 15 -max-downloads 10
dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 7932785808040895147 -username %username% -remember-password -dir "Downloads\Y1S1_Black_Ice" -validate -max-servers 15 -max-downloads 10
pause
cls
echo Download complete!
echo It's BLACK ICE Released!
goto mainmenu
)
::DUST LINE Released
if %version%==4 (
dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 2303064029242396590 -username %username% -remember-password -dir "Downloads\Y1S2_Dust_Line" -validate -max-servers 15 -max-downloads 10
dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 2206497318678061176 -username %username% -remember-password -dir "Downloads\Y1S2_Dust_Line" -validate -max-servers 15 -max-downloads 10
pause
cls
echo Download complete!
echo It's DUST LINE Released!
goto mainmenu
)
::SKULL Rain Released
if %version%==5 (
dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 3552784069501585540 -username %username% -remember-password -dir "Downloads\Y1S3_Skull_Rain" -validate -max-servers 15 -max-downloads 10
dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 6528040263176897081 -username %username% -remember-password -dir "Downloads\Y1S3_Skull_Rain" -validate -max-servers 15 -max-downloads 10
pause
cls
echo Download complete!
echo It's SKULL Rain Released!
goto mainmenu
)
::Skull Rain 4.2
if %version%==51 (
dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 5819137024728546741 -username %username% -remember-password -dir "Downloads\Y1S3_SkullRain" -validate -max-servers 15 -max-downloads 10
dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 5851804596427790505 -username %username% -remember-password -dir "Downloads\Y1S3_SkullRain" -validate -max-servers 15 -max-downloads 10
pause
cls
echo Download complete!
goto mainmenu
)
::RED CROW Released
if %version%==6 (
dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 3576607363557872807 -username %username% -remember-password -dir "Downloads\Y1S4_Red_Crow" -validate -max-servers 15 -max-downloads 10
dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 8569920171217002292 -username %username% -remember-password -dir "Downloads\Y1S4_Red_Crow" -validate -max-servers 15 -max-downloads 10
pause
cls
echo Download complete!
echo It's RED CROW Released!
goto mainmenu
)
::VELVET SHELL Released
if %version%==7 (
dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 2248734317261478192 -username %username% -remember-password -dir "Downloads\Y2S1_Velvet_Shell" -validate -max-servers 15 -max-downloads 10
dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 8006071763917433748 -username %username% -remember-password -dir "Downloads\Y2S1_Velvet_Shell" -validate -max-servers 15 -max-downloads 10
pause
cls
echo Download complete!
echo It's VELVET SHELL Released
goto mainmenu
)
::Health Released
if %version%==8 (
dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 2786501509753402970 -username %username% -remember-password -dir "Downloads\Y2S2_Health" -validate -max-servers 15 -max-downloads 10
dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 2332919753188284154 -username %username% -remember-password -dir "Downloads\Y2S2_Health" -validate -max-servers 15 -max-downloads 10
pause
cls
echo Download complete!
echo It's Health Released!
goto mainmenu
)
if %version%==81 (
::Health Manifest
dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 5875987479498297665 -username %username% -remember-password -dir "Downloads\Y2S2_Health_2" -validate -max-servers 15 -max-downloads 10
dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 708773000306432190 -username %username% -remember-password -dir "Downloads\Y2S2_Health_2" -validate -max-servers 15 -max-downloads 10
pause
cls
echo Download complete! Thanks Shey!
goto mainmenu
)
::BLOOD ORCHID Released
if %version%==9 (
dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 8948840210977117778 -username %username% -remember-password -dir "Downloads\Y2S3_Blood_Orchid" -validate -max-servers 15 -max-downloads 10
dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 2410147212125863824 -username %username% -remember-password -dir "Downloads\Y2S3_Blood_Orchid" -validate -max-servers 15 -max-downloads 10
pause
cls
echo Download complete!
echo It's BLOOD ORCHID Released!
goto mainmenu
)
::Blood Orchid 2.3.1.1
if %version%==91 (
dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 6708129824495912434 -username %username% -remember-password -dir "Downloads\Y2S3_BloodOrchid" -validate -max-servers 15 -max-downloads 10
dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 1613631671988840841 -username %username% -remember-password -dir "Downloads\Y2S3_BloodOrchid" -validate -max-servers 15 -max-downloads 10
pause
cls
echo Download complete! Thanks Shey!
goto mainmenu
)
::WHITE NOISE Released
if %version%==10 (
dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 2066250193950057921 -username %username% -remember-password -dir "Downloads\Y2S4_White_Noise" -validate -max-servers 15 -max-downloads 10
dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 2783803489764777627 -username %username% -remember-password -dir "Downloads\Y2S4_White_Noise" -validate -max-servers 15 -max-downloads 10
pause
cls
echo Download complete!
echo It's WHITE NOISE  Released!
goto mainmenu
)
::WHITE NOISE Manifest
if %version%==101 (
dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 8748734086032257441 -username %username% -remember-password -dir "Downloads\Y2S4_WhiteNoise" -validate -max-servers 15 -max-downloads 10
dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 4221297486420648079 -username %username% -remember-password -dir "Downloads\Y2S4_WhiteNoise" -validate -max-servers 15 -max-downloads 10
pause
cls
echo Download complete! Thanks Shey!
goto mainmenu
)
::CHIMERA Released
if %version%==11 (
dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 5071357104726974256 -username %username% -remember-password -dir "Downloads\Y3S1_Chimera" -validate -max-servers 15 -max-downloads 10
dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 4701787239566783972 -username %username% -remember-password -dir "Downloads\Y3S1_Chimera" -validate -max-servers 15 -max-downloads 10
pause
cls
echo Download complete!
echo It's CHIMERA  Released
goto mainmenu
)
::PARA BELLUM Released
if %version%==12 (
dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 8312108283310615233 -username %username% -remember-password -dir "Downloads\Y3S2_Para_Bellum" -validate -max-servers 15 -max-downloads 10
dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 8765715607275074515 -username %username% -remember-password -dir "Downloads\Y3S2_Para_Bellum" -validate -max-servers 15 -max-downloads 10
pause
cls
echo Download complete!
echo It's PARA BELLUM Released!
goto mainmenu
)
::GRIM SKY Released
if %version%==13 (
dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 7286067994760020542 -username %username% -remember-password -dir "Downloads\Y3S3_Grim_Sky" -validate -max-servers 15 -max-downloads 10
dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 4133951394045241747 -username %username% -remember-password -dir "Downloads\Y3S3_Grim_Sky" -validate -max-servers 15 -max-downloads 10
pause
cls
echo Download complete!
echo It's GRIM SKY Released!
goto mainmenu
)
::GRIM SKY Manifest
if %version%==131 (
dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 5562094852451837435 -username %username% -remember-password -dir "Downloads\Y3S3_GrimSky" -validate -max-servers 15 -max-downloads 10
dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 7781202564071310413 -username %username% -remember-password -dir "Downloads\Y3S3_GrimSky" -validate -max-servers 15 -max-downloads 10
pause
cls
echo Download complete! Thanks Shey!
goto mainmenu
)
::WIND BASTION Released
if %version%==14 (
dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 6502258854032233436 -username %username% -remember-password -dir "Downloads\Y3S4_Wind_Bastion" -validate -max-servers 15 -max-downloads 10
dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 7659555540733025386 -username %username% -remember-password -dir "Downloads\Y3S4_Wind_Bastion" -validate -max-servers 15 -max-downloads 10
pause
cls
echo Download complete!
echo It's WIND BASTION Released!
goto mainmenu
)
::BURNT HORIZON Released
if %version%==15 (
dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 8985694971177711792 -username %username% -remember-password -dir "Downloads\Y4S1_Burnt_Horizon" -validate -max-servers 15 -max-downloads 10
dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 4355229858723790756 -username %username% -remember-password -dir "Downloads\Y4S1_Burnt_Horizon" -validate -max-servers 15 -max-downloads 10
pause
cls
echo Download complete!
echo It's BURNT HORIZON Released!
goto mainmenu
)
if %version%==151 (
dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 8356277316976403078 -username %username% -remember-password -dir "Downloads\Y4S1_BurntHorizon" -validate -max-servers 15 -max-downloads 10
dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 5935578581006804383 -username %username% -remember-password -dir "Downloads\Y4S1_BurntHorizon" -validate -max-servers 15 -max-downloads 10
pause
cls
echo Download complete! Thanks Shey!
goto mainmenu
)
::PHANTOM SIGHT Released
if %version%==16 (
dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 693082837425613508 -username %username% -remember-password -dir "Downloads\Y4S2_Phantom_Sight" -validate -max-servers 15 -max-downloads 10
dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 5408324128694463720 -username %username% -remember-password -dir "Downloads\Y4S2_Phantom_Sight" -validate -max-servers 15 -max-downloads 10
pause
cls
echo Download complete!
echo It's PHANTOM SIGHT Released!
goto mainmenu
)
::EMBER RISE Released
if %version%==17 (
dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 7309481042294838052 -username %username% -remember-password -dir "Downloads\Y4S3_Ember_Rise" -validate -max-servers 15 -max-downloads 10
dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 5429930338066808153 -username %username% -remember-password -dir "Downloads\Y4S3_Ember_Rise" -validate -max-servers 15 -max-downloads 10
pause
cls
echo Download complete!
echo It's EMBER RISE Released!
goto mainmenu
)
if %version%==171 (
dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 3546781236735558235 -username %username% -remember-password -dir "Downloads\Y4S3_EmberRise" -validate -max-servers 15 -max-downloads 10
dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 7869081741739849703 -username %username% -remember-password -dir "Downloads\Y4S3_EmberRise" -validate -max-servers 15 -max-downloads 10
pause
cls
echo Download complete! Thanks Shey!
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
::VOID EDGE Released
if %version%==19 (
dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 8007091753837589034 -username %username% -remember-password -dir "Downloads\Y5S1_Void_Edge" -validate -max-servers 15 -max-downloads 10
dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 2810676266503656332 -username %username% -remember-password -dir "Downloads\Y5S1_Void_Edge" -validate -max-servers 15 -max-downloads 10
pause
cls
echo Download complete!
echo It's VOID EDGE Released!
goto mainmenu
)
if %version%==191 (
dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 4736360397583523381 -username %username% -remember-password -dir "Downloads\Y5S1_VoidEdge" -validate -max-servers 15 -max-downloads 10
dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 6296533808765702678 -username %username% -remember-password -dir "Downloads\Y5S1_VoidEdge" -validate -max-servers 15 -max-downloads 10
pause
cls
echo Download complete! Thanks Shey!
goto mainmenu
)
::STEEL WAVE
if %version%==20 (
dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 7032500641931923367 -username %username% -remember-password -dir "Downloads\Y5S2_Steel_Wave" -validate -max-servers 15 -max-downloads 10
dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 8083217055977195199 -username %username% -remember-password -dir "Downloads\Y5S2_Steel_Wave" -validate -max-servers 15 -max-downloads 10
pause
cls
echo Download complete!
echo It's STEEL WAVE
goto mainmenu
)
::LIVE
if %version%==21 (
dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 4367817844736324940 -username %username% -remember-password -dir "Downloads\LIVE" -validate -max-servers 15 -max-downloads 10
dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 893971391196952070 -username %username% -remember-password -dir "Downloads\LIVE" -validate -max-servers 15 -max-downloads 10
pause
cls
echo Download complete!
echo It's LIVE Version!
goto mainmenu
)
goto DownloadMenu


:TextureMenu
 cls
 Title Rainbow Six Siege 4K Textures Downloader
 MODE 50,38
 echo 4K Textures Downloader
 echo What would you like to select?
 echo --------------------------------------------------
 echo # 0 - Back
 echo # 99 - Download Events
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
 echo # 191 = Latest R6 Version!
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
 dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377239 -manifest 1430519549301269175 -username %username% -remember-password -dir "Downloads\LIVE" -validate -max-servers 15 -max-downloads 10
 pause
 cls
 echo Download complete!
 echo It's LIVE 4K!
 goto mainmenu
 )
goto TextureMenu


:EventMenu
 cls
 Title Rainbow Six Siege Event Downloader
 MODE 50,35
 echo What would you like to select?
 echo --------------------------------------------------
 echo # 0 - Back
 echo --------------------------------------------------
 echo # 11 = Chimera
 echo # 13 = Mad House
 echo # 15 = Rainbow is Magic
 echo # 18 = Road To S.I. 2020
 echo # 19 = The Grand Larceny
 echo # 20 = M.U.T.E
 echo --------------------------------------------------
 set /p version="Enter Selection:"
 if %version%==0 (
 cls
 goto mainmenu
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
  echo It's CHIMERA  Released
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


:Extra
	cls
	Title Rainbow Six Siege Extra Downloader
	MODE 50,35
	echo Extra Language Downloader
	echo What would you like to select?
	echo --------------------------------------------------
	echo # 0 - Back
	echo --------------------------------------------------
	echo # 1 - German Language
	echo --------------------------------------------------	
	set /p version="Enter Selection:"
	if %version%==0 (
	cls
	goto mainmenu
	)
	if %version%==1 (
	cls
	goto German
	)
	goto Extra

:German
	cls
	Title Rainbow Six Siege German Lang Downloader
	MODE 50,35
	echo German Language Downloader
	echo What would you like to select?
	echo --------------------------------------------------
	echo # 0 - Back
	echo --------------------------------------------------
	echo # 1 - German Lang on Vanilla
  ::English
  ::French
  ::Italian
  ::German
  ::Spanish - Spain
  ::Portuguese - Brazil
  ::Polish
  ::Dutch
  ::Czech
  ::Koreana
  ::Traditional Chinese
  ::Simplified Chinese
  ::Japanese
  ::Russian
	echo --------------------------------------------------
	set /p version="Enter Selection:"
	if %version%==0 (
	cls
	goto Extra
	)
	MODE 100,40
	::set /p username="Enter Steam Username:"

	if %version%==1 (


	pause
	cls
	echo Download complete!
	echo It's German Lang on Vanilla!
	goto mainmenu
	)
	goto Extra











:: 359552  Depot English
:: 359553  Depot French 
:: 359554  Depot Italian
:: 359555  Depot German
:: 359556  Depot Spanish 
:: 359557  Depot Brasilian
:: 359558  Depot Polish 
:: 377230  Depot Dutch 
:: 377231  Depot Czech
:: 377232  Depot Korean  
:: 377233  Depot TChinese  
:: 377234  Depot SChinese 
:: 377235  Depot Japanese
:: 377236  Depot Russian


















::© 2020 SlejmUr
:Credit
Title CREDIT
MODE 45,15
echo Thanks Shey to I get some manifest!
echo Thanks Zer0Byte the first version of MenuV!
echo Thanks DepotDownloader creators!
echo Thanks SublimeText creators!
echo Thanks SteamDB!
echo Thanks Cheato for Liberators,and FAQ!
echo Thanks Markster for Plaza's!
echo And Thanks YOU for using this!
echo First Version: 2020 June 17
echo Updated Version: 2020 Aug 24
pause
cls
goto mainmenu

::Plaza Start
:GetPlaza
cls
MODE 78,20
echo ------------------------------------------------------------------------------
echo                        Downloading Plazas...
echo ------------------------------------------------------------------------------
curl -L  "https://cdn.discordapp.com/attachments/722089860755881996/743466352475635832/Plazas.zip" --output plazas.zip
cls
goto extractPlaza

:extractPlaza
for %%I in ("plazas.zip") do (
  echo extractPlaza
  "Requirements\7z.exe" x -y -o"Requirements\" "%%I" && del %%I
cls
goto PlazaCheck
)

:PlazaCheck
cls
if exist "Requirements\Plazas\PLAZA_BO\CODEX.ini" (
  goto LibCheck 
) else (
  goto GetPlaza
)
::Plaza End

::Liberator Start
:GetLib
cls
MODE 78,20
echo ------------------------------------------------------------------------------
echo                        Downloading Liberators...
echo ------------------------------------------------------------------------------
curl -L  "http://download1650.mediafire.com/1a8rn7twsw4g/kzhc3j1g3gaxmqx/Liberators.zip" --output liberators.zip
cls
goto extractLib

:extractLib
for %%I in ("liberators.zip") do (
  echo extractPlaza
  "Requirements\7z.exe" x -y -o"Requirements\" "%%I" && del %%I
cls
goto PlazaCheck
)

:LibCheck
cls
if exist "Requirements\Liberators\R6_Liberator_0.0.0.22.exe" (
  goto mainmenu 
) else (
  goto GetLib
)
::Liberator End



:StartGame
cls
Title Rainbow Six Siege Game Starter
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
echo # 201 = Latest R6 Version!
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
	if exist "Downloads\Y1S3_Skull_Rain\RainbowSix.exe" (
		echo Starting.....
		Downloads\Y1S3_Skull_Rain\RainbowSix.exe /belaunch
		pause
		)
	goto DownloadMenu
)
if %startgame%==51 (
	if exist "Downloads\Y1S3_SkullRain\RainbowSix.exe" (
		echo Starting.....
		Downloads\Y1S3_SkullRain\RainbowSix.exe /belaunch
		pause
		)
	goto DownloadMenu
)
if %startgame%==6 (
	if exist "Downloads\Y1S4_Red_Crow\RainbowSix.exe" (
		echo Starting.....
		Downloads\Y1S4_Red_Crow\RainbowSix.exe /belaunch
		pause
		)
	goto DownloadMenu
)
if %startgame%==7 (
	if exist "Downloads\Y2S1_Velvet_Shell\RainbowSix.exe" (
		echo Starting.....
		Downloads\Y2S1_Velvet_Shell\RainbowSix.exe /belaunch
		pause
		)
	goto DownloadMenu
)
if %startgame%==8 (
	if exist "Downloads\Y2S2_Health\RainbowSix.exe" (
		echo Starting.....
		Downloads\Y2S2_Health\RainbowSix.exe /belaunch
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
if %startgame%==21 (
  if exist "Downloads\LIVE\RainbowSix.exe" (
    echo Starting.....
    Downloads\LIVE\RainbowSix.exe /belaunch
    pause
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






exit
