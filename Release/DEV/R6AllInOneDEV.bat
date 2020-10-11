@shift /0

::ignore this above its for batch to exe conversion

@echo off
setlocal enableextensions enabledelayedexpansion
set homepath=%cd%
set AllInOneVersion=DEV
set discord=discord.gg/EvrGzAV
set /p username="Enter Steam Username:"

::TIME SET
FOR /f "tokens=1-8 delims=/.:- " %%A in ("%date% %time%") DO (
SET Month=%%B
SET Day=%%C
SET Year=%%D
SET Hours=%%E
SET Minutes=%%F
SET Seconds=%%G
SET All=%%B-%%C-%%D_%%E-%%F-%%G
)

::                        +hmNNNmh+    
::                       yMMMMMMMMMy  
::                       mMMMh hMMMd  
::                       mMMMh:oso:.  
::                       mMMMMMMMMMs  
::                       mMMNdNNhmMd  
::                       mMMs  `-sMd  
::          Rainbow Six  mMMy smMMMd    
::        Modding United mMMy mMMMMd  
::                       hMMy.NMMMMy  discord.gg/EvrGzAV
::                       `ohmNMNmh+   
:: Zer0Bytes#4428 https://i.imgur.com/nBKIDOX.png
:: Helped by SlejmUr

::LOG start
:log
  if exist "log.log" (
  ren "log.log" "%ALL%-log.log"
  mkdir logs
  move "%ALL%-log.log" "logs"
  cls
  goto verifydotnet
  ) else (
  echo ------------------------------------------------>>log.log
  echo You are using %AllInOneVersion% version>>log.log
  goto verifydotnet
  )
::LOG end


::Dotnet start
:verifydotnet
  MODE 50,20
  reg query "HKEY_LOCAL_MACHINE\SOFTWARE\dotnet\Setup\InstalledVersions\x64\sharedhost" /v Version 2>nul

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
  start www.tinyurl.com/dotnetruntimer6
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
  if exist "Resources\7z.exe" (
    goto DepotCheck
  ) else (
    mkdir Resources
    goto no7zip
  )

:no7zip
  MODE 78,20
  echo ------------------------------------------------------------------------------
  echo                              Downloading 7-Zip...
  echo ------------------------------------------------------------------------------
  curl -L  "https://github.com/DataCluster0/R6TBBatchTool/raw/master/Requirements/7z.exe" --output 7z.exe
  echo Download 7zip - %TIME%>>log.log
  cls
  goto move7
  cls
  )

:move7
  move 7z.exe Resources
  goto 7zipcheck
::7zip end


::DD start
:DepotCheck
  cls
  if exist "Resources\DepotDownloader\DepotDownloader.dll" (
    goto PlazaCheck 
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
    "Resources\7z.exe" x -y -o"Resources\DepotDownloader" "%%I" && del %%I
  cls
  goto DepotCheck
  )
::DD end

::Plaza Start
:PlazaCheck
  cls
  if exist "Resources\Plazas\PLAZA_BO\CODEX.ini" (
    goto mainmenu 
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
    "Resources\7z.exe" x -y -o"Resources\" "%%I" && del %%I
  cls
  goto PlazaCheck
  )
::Plaza End



::MainMenu START
:mainmenu
  cls
  Title R6S AllInOne Downloader
  MODE 62,22
  echo MainMenu loaded>>log.log
  echo [93m----------------------------NOTES-----------------------------[0m
  echo  Rainbow Six Siege Old Version Downloader
  echo  [31mYou MUST have a copy of Siege on Steam to use the downloader.[0m
  echo  This Tool fork with [91mZer0Byte[0m
  echo  Our Discord Server: [94m%discord%[0m 
  echo  AIO Tool Version: [92m%AllInOneVersion%[0m 
  echo  Steam User: [96m%username%[0m
  echo  Read FAQ!
  echo [93m----------------------------SELECT----------------------------[0m
  echo  What would you like to select?
  echo  [33m(1)[0m [36mFAQ and Notes[0m 
  echo  [33m(2)[0m [36mGame Menu [0m 
  echo  [33m(3)[0m [36mExtra Language[0m 
  echo  [33m(4)[0m [36m4K Textures [0m 
  echo  [33m(5)[0m [36mDirectX and VC Redist Downloader [0m 
  echo  [33m(6)[0m [36mCredits[0m 
  echo  [33m(7)[0m [36mBattlEye Checker[0m 
  echo  [33m(8)[0m [36mOpen LOG![0m 
  echo  [33m(9)[0m [36mChange Steam Username[0m 
  ::echo  (10) Restart
  echo  [33m(0)[0m [36mClose[0m 
  echo [93m--------------------------------------------------------------[0m
  set /p option="Enter Number:"

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
  echo BattlEyeChecker Choosed>>log.log
  cls
  goto BattlEyeChecker
  )
  if %option%==8 (
  echo Open LOG - %TIME%>>log.log
  cls
  start log.log
  pause
  goto mainmenu
  )
  if %option%==9 (
  echo Changing Steam UserName - %TIME%>>log.log
  cls
  set /p username="Enter Steam Username:"
  pause
  goto mainmenu
  )
  if %option%==10 (
  cls
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
  echo  R6-AIOTool : AllInOne Tool, many function. Created by SlejmUr
  echo  R6 Manifest : Created by Zer0Bytes
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
  echo  Plaza_NEW not working on Shadow Legacy and Steel Wave too
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
  echo # 41 = Skull Rain (Zer0 Manifest) 
  echo # 5 = Red Crow (Y1S4_release)
  echo # 6 = Velvet Shell (Y2S1_release)
  echo # 7 = Health (Y2S2_release)
  echo # 71 = Health (Zer0 Manifest)
  echo # 8 = Blood Orchid (Y2S3_release)
  echo # 81 = Blood Orchid (Zer0 Manifest)
  echo # 9 = White Noise (Y2S4_release)
  echo # 91=  White Noise (Zer0 Manifest)
  echo # 10 = Chimera [(Y3S1_release)]
  echo # 11 = Para Bellum (Y3S2_release) [60.6 GB]
  echo # 12 = Grim Sky (Y3S3_release)
  echo # 121= Grim Sky (Zer0 Manifest)
  echo # 13 = Wind Bastion (Y3S4_release) [76.9 GB]
  echo # 14 = Burnt Horizon (Y3S1_release)
  echo # 141= Burnt Horizon (Zer0 Manifest)
  echo # 15 = Phantom Sight (Y4S2_release)
  echo # 16 = Ember Rise (Y4S3_release)
  echo # 161= Ember Rise (Zer0 Manifest)
  echo # 17 = Shifting Tides (Y4S4_release) [75.2 GB]
  echo # 18 = Void Edge (Y5S1_release)
  echo # 181= Void Edge (Zer0 Manifest)
  echo # 19 = Steel Wave (Y5S2_release)
  echo # 191 = Steel Wave (Zer0 Manifest) [Mute]
  echo # 192 = Steel Wave (Zer0 Manifest) [Omega/Mute]
  echo # 20 = Shadow Legacy (Y5S3_release)
  ::echo # 21 = Placeholder
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
  


  ::Vanilla
  if %version%==1 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 8358812283631269928 -username %username% -remember-password -dir "Downloads\Y1S0_Vanilla" -validate -max-servers 15 -max-downloads 10
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 3893422760579204530 -username %username% -remember-password -dir "Downloads\Y1S0_Vanilla" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Vanilla! (v8194013)
  goto mainmenu
  )
  ::BLACK ICE Released
  if %version%==2 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 5188997148801516344 -username %username% -remember-password -dir "Downloads\Y1S1_Black_Ice" -validate -max-servers 15 -max-downloads 10
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 7932785808040895147 -username %username% -remember-password -dir "Downloads\Y1S1_Black_Ice" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's BLACK ICE Released! [IDK how but (v11726982)]
  goto mainmenu
  )
  ::DUST LINE Released
  if %version%==3 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 2303064029242396590 -username %username% -remember-password -dir "Downloads\Y1S2_Dust_Line" -validate -max-servers 15 -max-downloads 10
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 2206497318678061176 -username %username% -remember-password -dir "Downloads\Y1S2_Dust_Line" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's DUST LINE Released! (v9132097)
  goto mainmenu
  )
  ::SKULL Rain Released
  if %version%==4 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 3552784069501585540 -username %username% -remember-password -dir "Downloads\Y1S3_Skull_Rain" -validate -max-servers 15 -max-downloads 10
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 6528040263176897081 -username %username% -remember-password -dir "Downloads\Y1S3_Skull_Rain" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's SKULL Rain Released! (v9654076)
  goto mainmenu
  )
  ::Skull Rain 4.2
  if %version%==41 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 5819137024728546741 -username %username% -remember-password -dir "Downloads\Y1S3_SkullRain" -validate -max-servers 15 -max-downloads 10
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 5851804596427790505 -username %username% -remember-password -dir "Downloads\Y1S3_SkullRain" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!  Thanks Zer0!
  echo ? (v9860556)
  goto mainmenu
  )
  ::RED CROW Released
  if %version%==5 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 3576607363557872807 -username %username% -remember-password -dir "Downloads\Y1S4_Red_Crow" -validate -max-servers 15 -max-downloads 10
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 8569920171217002292 -username %username% -remember-password -dir "Downloads\Y1S4_Red_Crow" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo RED CROW Choosed>>log.log
  echo Download complete!
  echo It's RED CROW Released!
  goto mainmenu
  )
  ::VELVET SHELL Released
  if %version%==6 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 2248734317261478192 -username %username% -remember-password -dir "Downloads\Y2S1_Velvet_Shell" -validate -max-servers 15 -max-downloads 10
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 8006071763917433748 -username %username% -remember-password -dir "Downloads\Y2S1_Velvet_Shell" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo VELVET SHELL Choosed>>log.log
  echo Download complete!
  echo It's VELVET SHELL Released
  goto mainmenu
  )
  ::Health Released
  if %version%==7 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 2786501509753402970 -username %username% -remember-password -dir "Downloads\Y2S2_Health" -validate -max-servers 15 -max-downloads 10
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 2332919753188284154 -username %username% -remember-password -dir "Downloads\Y2S2_Health" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Health Choosed>>log.log
  echo Download complete!
  echo It's Health Released!
  goto mainmenu
  )
  if %version%==71 (
  ::Health Manifest
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 5875987479498297665 -username %username% -remember-password -dir "Downloads\Y2S2_Health_2" -validate -max-servers 15 -max-downloads 10
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 708773000306432190 -username %username% -remember-password -dir "Downloads\Y2S2_Health_2" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Health (Zer0) Choosed>>log.log
  echo Download complete! Thanks Zer0!
  goto mainmenu
  )
  ::BLOOD ORCHID Released
  if %version%==8 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 8948840210977117778 -username %username% -remember-password -dir "Downloads\Y2S3_Blood_Orchid" -validate -max-servers 15 -max-downloads 10
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 2410147212125863824 -username %username% -remember-password -dir "Downloads\Y2S3_Blood_Orchid" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo BLOOD ORCHID Choosed>>log.log
  echo Download complete!
  echo It's BLOOD ORCHID Released!
  goto mainmenu
  )
  ::Blood Orchid 2.3.1.1
  if %version%==81 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 6708129824495912434 -username %username% -remember-password -dir "Downloads\Y2S3_BloodOrchid" -validate -max-servers 15 -max-downloads 10
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 1613631671988840841 -username %username% -remember-password -dir "Downloads\Y2S3_BloodOrchid" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete! Thanks Zer0!
  goto mainmenu
  )
  ::WHITE NOISE Released
  if %version%==9 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 2066250193950057921 -username %username% -remember-password -dir "Downloads\Y2S4_White_Noise" -validate -max-servers 15 -max-downloads 10
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 2783803489764777627 -username %username% -remember-password -dir "Downloads\Y2S4_White_Noise" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's WHITE NOISE  Released!
  goto mainmenu
  )
  ::WHITE NOISE Manifest
  if %version%==91 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 8748734086032257441 -username %username% -remember-password -dir "Downloads\Y2S4_WhiteNoise" -validate -max-servers 15 -max-downloads 10
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 4221297486420648079 -username %username% -remember-password -dir "Downloads\Y2S4_WhiteNoise" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete! Thanks Zer0!
  goto mainmenu
  )
  ::CHIMERA Released
  if %version%==10 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 5071357104726974256 -username %username% -remember-password -dir "Downloads\Y3S1_Chimera" -validate -max-servers 15 -max-downloads 10
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 4701787239566783972 -username %username% -remember-password -dir "Downloads\Y3S1_Chimera" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's CHIMERA  Released
  goto mainmenu
  )
  ::PARA BELLUM Released
  if %version%==11 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 8312108283310615233 -username %username% -remember-password -dir "Downloads\Y3S2_Para_Bellum" -validate -max-servers 15 -max-downloads 10
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 8765715607275074515 -username %username% -remember-password -dir "Downloads\Y3S2_Para_Bellum" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's PARA BELLUM Released!
  goto mainmenu
  )
  ::GRIM SKY Released
  if %version%==12 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 7286067994760020542 -username %username% -remember-password -dir "Downloads\Y3S3_Grim_Sky" -validate -max-servers 15 -max-downloads 10
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 4133951394045241747 -username %username% -remember-password -dir "Downloads\Y3S3_Grim_Sky" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's GRIM SKY Released!
  goto mainmenu
  )
  ::GRIM SKY Manifest
  if %version%==121 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 5562094852451837435 -username %username% -remember-password -dir "Downloads\Y3S3_GrimSky" -validate -max-servers 15 -max-downloads 10
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 7781202564071310413 -username %username% -remember-password -dir "Downloads\Y3S3_GrimSky" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete! Thanks Zer0!
  goto mainmenu
  )
  ::WIND BASTION Released
  if %version%==13 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 6502258854032233436 -username %username% -remember-password -dir "Downloads\Y3S4_Wind_Bastion" -validate -max-servers 15 -max-downloads 10
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 7659555540733025386 -username %username% -remember-password -dir "Downloads\Y3S4_Wind_Bastion" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's WIND BASTION Released! (v12512571)
  goto mainmenu
  )
  ::BURNT HORIZON Released
  if %version%==14 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 8985694971177711792 -username %username% -remember-password -dir "Downloads\Y4S1_Burnt_Horizon" -validate -max-servers 15 -max-downloads 10
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 4355229858723790756 -username %username% -remember-password -dir "Downloads\Y4S1_Burnt_Horizon" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's BURNT HORIZON Released!
  goto mainmenu
  )
  if %version%==141 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 8356277316976403078 -username %username% -remember-password -dir "Downloads\Y4S1_BurntHorizon" -validate -max-servers 15 -max-downloads 10
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 5935578581006804383 -username %username% -remember-password -dir "Downloads\Y4S1_BurntHorizon" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete! Thanks Zer0!
  goto mainmenu
  )
  ::PHANTOM SIGHT Released
  if %version%==15 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 693082837425613508 -username %username% -remember-password -dir "Downloads\Y4S2_Phantom_Sight" -validate -max-servers 15 -max-downloads 10
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 5408324128694463720 -username %username% -remember-password -dir "Downloads\Y4S2_Phantom_Sight" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's PHANTOM SIGHT Released!
  goto mainmenu
  )
  ::EMBER RISE Released
  if %version%==16 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 7309481042294838052 -username %username% -remember-password -dir "Downloads\Y4S3_Ember_Rise" -validate -max-servers 15 -max-downloads 10
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 5429930338066808153 -username %username% -remember-password -dir "Downloads\Y4S3_Ember_Rise" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's EMBER RISE Released!
  goto mainmenu
  )
  if %version%==161 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 3546781236735558235 -username %username% -remember-password -dir "Downloads\Y4S3_EmberRise" -validate -max-servers 15 -max-downloads 10
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 7869081741739849703 -username %username% -remember-password -dir "Downloads\Y4S3_EmberRise" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete! Thanks Zer0!
  goto mainmenu
  )
  ::SHIFTING TIDES Released
  if %version%==17 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 299124516841461614 -username %username% -remember-password -dir "Downloads\Y4S4_Shifting_Tides" -validate -max-servers 20 -max-downloads 15
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 1842268638395240106 -username %username% -remember-password -dir "Downloads\Y4S4_Shifting_Tides" -validate -max-servers 20 -max-downloads 15
  pause
  cls
  echo Download complete!
  echo It's SHIFTING TIDES Released!
  goto mainmenu
  )
  ::VOID EDGE Released
  if %version%==18 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 8007091753837589034 -username %username% -remember-password -dir "Downloads\Y5S1_Void_Edge" -validate -max-servers 15 -max-downloads 10
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 2810676266503656332 -username %username% -remember-password -dir "Downloads\Y5S1_Void_Edge" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's VOID EDGE Released!
  goto mainmenu
  )
  ::Void Edge manifest
  if %version%==181 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 1378283477131353042 -username %username% -remember-password -dir "Downloads\Y5S1_VoidEdge" -validate -max-servers 15 -max-downloads 10
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 1739364586766771991 -username %username% -remember-password -dir "Downloads\Y5S1_VoidEdge" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete! Thanks Zer0!
  goto mainmenu
  )
  ::STEEL WAVE
  if %version%==19 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 7032500641931923367 -username %username% -remember-password -dir "Downloads\Y5S2_Steel_Wave" -validate -max-servers 15 -max-downloads 10
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 8083217055977195199 -username %username% -remember-password -dir "Downloads\Y5S2_Steel_Wave" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's STEEL WAVE Released!
  goto mainmenu
  )
  ::steel wave Y5S2.3.0_C5433707_D1028748_S38774_14603060 (Mute Protocol)
  if %version%==191 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 2287849678928593252 -username %username% -remember-password -dir "Downloads\Y5S2_MUTE" -validate -max-servers 15 -max-downloads 10
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 1610834739284564851 -username %username% -remember-password -dir "Downloads\Y5S2_MUTE" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo v14603060
  echo Download complete! Thanks Zer0!
  goto mainmenu
  )
  ::SteelWave (omega/Mute Protocol)
  if %version%==192 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 4367817844736324940 -username %username% -remember-password -dir "Downloads\Y5S2_SteelWave" -validate -max-servers 15 -max-downloads 10
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 893971391196952070 -username %username% -remember-password -dir "Downloads\Y5S2_SteelWave" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo v14664131
  echo Download complete! Thanks Zer0!
  goto mainmenu
  )
  ::Shadow Legacy
  if %version%==20 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 885453180592640750 -username %username% -remember-password -dir "Downloads\Y5S3_Shadow_Legacy" -validate -max-servers 15 -max-downloads 10
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 7750070106878890861 -username %username% -remember-password -dir "Downloads\Y5S3_Shadow_Legacy" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Shadow Legacy Released!
  goto mainmenu
  )
  if %version%==21 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest %manifest% -username %username% -remember-password -dir "Downloads\Placeholder" -validate -max-servers 15 -max-downloads 10
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest %manifest% -username %username% -remember-password -dir "Downloads\Placeholder" -validate -max-servers 15 -max-downloads 10
  pause
  cls
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
 echo # 41 = Skull Rain (Zer0 Manifest) 
 echo # 5 = Red Crow (Y1S4_release)
 echo # 6 = Velvet Shell (Y2S1_release)
 echo # 7 = Health (Y2S2_release)
 echo # 71 = Health (Zer0 Manifest)
 echo # 8 = Blood Orchid (Y2S3_release)
 echo # 81 = Blood Orchid (Zer0 Manifest)
 echo # 9 = White Noise (Y2S4_release)
 echo # 91 =  White Noise (Zer0 Manifest)
 echo # 10 = Chimera [(Y3S1_release)]
 echo # 11 = Para Bellum (Y3S2_release)
 echo # 12 = Grim Sky (Y3S3_release)
 echo # 120 = Mad House
 echo # 121 = Grim Sky (Zer0 Manifest)
 echo # 13 = Wind Bastion (Y3S4_release)
 echo # 14 = Burnt Horizon (Y3S1_release)
 echo # 140 = Rainbow is Magic
 echo # 141= Burnt Horizon (Zer0 Manifest)
 echo # 15 = Phantom Sight (Y4S2_release)
 echo # 16 = Ember Rise (Y4S3_release)
 echo # 161 = Ember Rise (Zer0 Manifest)
 echo # 17 = Shifting Tides (Y4S4_release)
 echo # 18 = Void Edge (Y5S1_release)
 echo # 180 = The Grand Larceny / Golden Gun
 echo # 181 = Void Edge (Zer0 Manifest)
 echo # 19 = Steel Wave (Y5S2_release) 
 echo # 190 = M.U.T.E Protocol
 echo # 191 = Steel Wave (Zer0 Manifest) [Omega/Mute]
 echo # 20 = Shadow Legacy (Y5S3_release)
 ::echo # 21 = Placeholder
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
 if %version%==190 (
 rd /s /q "Downloads\Y5S2_MUTE"
 timeout /t 4
 cls
 echo Y5S2_SteelWave Choosed [U]>>log.log
 echo Delete complete!
 goto mainmenu
 )
 if %version%==191 (
 rd /s /q "Downloads\Y5S2_SteelWave"
 timeout /t 4
 cls
 echo Y5S2_SteelWave_Morphues_V2311 Choosed [U]>>log.log
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
 echo # 41 = Skull Rain (Zer0 Manifest) 
 echo # 5 = Red Crow (Y1S4_release)
 echo # 6 = Velvet Shell (Y2S1_release)
 echo # 7 = Health (Y2S2_release)
 echo # 71 = Health (Zer0 Manifest) -Same-
 echo # 8 = Blood Orchid (Y2S3_release)
 echo # 81 = Blood Orchid (Zer0 Manifest)
 echo # 9 = White Noise (Y2S4_release)
 echo # 91=  White Noise (Zer0 Manifest) -Same-
 echo # 10 = Chimera [(Y3S1_release)]
 echo # 11 = Para Bellum (Y3S2_release)
 echo # 12 = Grim Sky (Y3S3_release)
 echo # 121 = Grim Sky (Zer0 Manifest)
 echo # 13 = Wind Bastion (Y3S4_release)
 echo # 14 = Burnt Horizon (Y3S1_release)
 echo # 141= Burnt Horizon (Zer0 Manifest)
 echo # 15 = Phantom Sight (Y4S2_release)
 echo # 16 = Ember Rise (Y4S3_release)
 echo # 161= Ember Rise (Zer0 Manifest)
 echo # 17 = Shifting Tides (Y4S4_release)
 echo # 18 = Void Edge (Y5S1_release)
 echo # 181= Void Edge (Zer0 Manifest) -Same-
 echo # 19 = Steel Wave (Y5S2_release)
 echo # 191 = M.U.T.E Protocol (Support Omega)
 echo # 20 = Shadow Legacy (Y5S3_release)
 echo # 21 = Placeholder
 echo --------------------------------------------------
 set /p version="Enter Selection:"
 if %version%==0 (
 cls
 goto mainmenu
 )

 MODE 100,40
 
 ::Vanilla4k
 if %version%==1 (
 dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377239 -manifest 8394183851197739981 -username %username% -remember-password -dir "Downloads\Y1S0_Vanilla" -validate -max-servers 15 -max-downloads 10
 pause
 cls
 echo Download complete!
 echo It's Vanilla 4K!
 goto mainmenu
 )
 if %version%==2 (
 dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377239 -manifest 3756048967966286899 -username %username% -remember-password -dir "Downloads\Y1S1_Black_Ice" -validate -max-servers 15 -max-downloads 10
 pause
 cls
 echo Download complete!
 echo It's Black Ice 4K!
 goto mainmenu
 )
 if %version%==3 (
 dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377239 -manifest 1338949402410764888 -username %username% -remember-password -dir "Downloads\Y1S2_Dust_Line" -validate -max-servers 15 -max-downloads 10
 pause
 cls
 echo Download complete!
 echo It's Dust Line 4K!
 goto mainmenu
 )
 if %version%==4 (
 dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377239 -manifest 5184390432533910806 -username %username% -remember-password -dir "Downloads\Y1S3_Skull_Rain" -validate -max-servers 15 -max-downloads 10
 pause
 cls
 echo Download complete!
 echo It's Skull Rain 4K! 
 goto mainmenu
 )
 if %version%==41 (
 dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377239 -manifest 3267970968757091405 -username %username% -remember-password -dir "Downloads\Y1S3_SkullRain" -validate -max-servers 15 -max-downloads 10
 pause
 cls
 echo Download complete! Thanks Zer0!
 goto mainmenu
 )
 if %version%==5 (
 dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377239 -manifest 1825939060444887403 -username %username% -remember-password -dir "Downloads\Y1S4_Red_Crow" -validate -max-servers 15 -max-downloads 10
 pause
 cls
 echo Download complete!
 echo It's Red Crow 4K!
 goto mainmenu
 )
 if %version%==6 (
 dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377239 -manifest 3196596628759979362 -username %username% -remember-password -dir "Downloads\Y2S1_Velvet_Shell" -validate -max-servers 15 -max-downloads 10
 pause
 cls
 echo Download complete!
 echo It's Velvet Shell 4K!
 goto mainmenu
 )
 if %version%==7 (
 dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377239 -manifest 7497579858536910279 -username %username% -remember-password -dir "Downloads\Y2S2_Health" -validate -max-servers 15 -max-downloads 10
 pause
 cls
 echo Download complete!
 echo It's Health 4K!
 goto mainmenu
 )
 if %version%==71 (
 dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377239 -manifest 7497579858536910279 -username %username% -remember-password -dir "Downloads\Y2S2_Health_2" -validate -max-servers 15 -max-downloads 10
 pause
 cls
 echo Download complete! Thanks Zer0!
 goto mainmenu
 )
 if %version%==8 (
 dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377239 -manifest 3065193946575458487 -username %username% -remember-password -dir "Downloads\Y2S3_Blood_Orchid" -validate -max-servers 15 -max-downloads 10
 pause
 cls
 echo Download complete!
 echo It's Blood Orchid 4K!
 goto mainmenu
 )
 if %version%==81 (
 dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377239 -manifest 6420469519659049757 -username %username% -remember-password -dir "Downloads\Y2S3_BloodOrchid" -validate -max-servers 15 -max-downloads 10
 pause
 cls
 echo Download complete! Thanks Zer0!
 goto mainmenu
 )
 if %version%==9 (
 dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377239 -manifest 1118649577165385479 -username %username% -remember-password -dir "Downloads\Y2S4_White_Noise" -validate -max-servers 15 -max-downloads 10
 pause
 cls
 echo Download complete!
 echo It's White Noise 4K!
 goto mainmenu
 )
 if %version%==91 (
 dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377239 -manifest 1118649577165385479 -username %username% -remember-password -dir "Downloads\Y2S4_WhiteNoise" -validate -max-servers 15 -max-downloads 10
 pause
 cls
 echo Download complete! Thanks Zer0!
 goto mainmenu
 )
 if %version%==10 (
 dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377239 -manifest 1668513364192382097 -username %username% -remember-password -dir "Downloads\Y3S1_Chimera" -validate -max-servers 15 -max-downloads 10
 pause
 cls
 echo Download complete!
 echo It's Chimera 4K!
 goto mainmenu
 )
 if %version%==11 (
 dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377239 -manifest 204186978012641075 -username %username% -remember-password -dir "Downloads\Y3S2_Para_Bellum" -validate -max-servers 15 -max-downloads 10
 pause
 cls
 echo Download complete!
 echo It's Para Bellum 4K!
 goto mainmenu
 )
 if %version%==12 (
 dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377239 -manifest 3378966402050009606 -username %username% -remember-password -dir "Downloads\Y3S3_Grim_Sky" -validate -max-servers 15 -max-downloads 10
 pause
 cls
 echo Download complete!
 echo It's Grim Sky 4K!
 goto mainmenu
 )
 if %version%==121 (
 dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377239 -manifest 6431001239225997495 -username %username% -remember-password -dir "Downloads\Y3S3_GrimSky" -validate -max-servers 15 -max-downloads 10
 pause
 cls
 echo Download complete! Thanks Zer0!
 goto mainmenu
 )
 if %version%==13 (
 dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377239 -manifest 2243348760021617592 -username %username% -remember-password -dir "Downloads\Y3S4_Wind_Bastion" -validate -max-servers 15 -max-downloads 10
 pause
 cls
 echo Download complete!
 echo It's Wind Bastion 4K!
 goto mainmenu
 )
 if %version%==14 (
 dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377239 -manifest 888629411354320742 -username %username% -remember-password -dir "Downloads\Y4S1_Burnt_Horizon" -validate -max-servers 15 -max-downloads 10
 pause
 cls
 echo Download complete!
 echo It's Burnt Horizon 4K!
 goto mainmenu
 )
 if %version%==141 (
 dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377239 -manifest 8394183851197739981 -username %username% -remember-password -dir "Downloads\Y4S1_BurntHorizon" -validate -max-servers 15 -max-downloads 10
 pause
 cls
 echo Download complete! Thanks Zer0!
 goto mainmenu
 )
 if %version%==15 (
 dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377239 -manifest 4107080515154236795 -username %username% -remember-password -dir "Downloads\Y4S2_Phantom_Sight" -validate -max-servers 15 -max-downloads 10
 pause
 cls
 echo Download complete!
 echo It's Phantom Sight 4K!
 goto mainmenu
 )
 if %version%==16 (
 dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377239 -manifest 8340682081776225833 -username %username% -remember-password -dir "Downloads\Y4S3_Ember_Rise" -validate -max-servers 15 -max-downloads 10
 pause
 cls
 echo Download complete!
 echo It's Ember Rise 4K!
 goto mainmenu
 )
 if %version%==161 (
 dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377239 -manifest 4319184561394137009 -username %username% -remember-password -dir "Downloads\Y4S3_EmberRise" -validate -max-servers 15 -max-downloads 10
 pause
 cls
 echo Download complete! Thanks Zer0!
 goto mainmenu
 )
 if %version%==17 (
 dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377239 -manifest 6048763664997452513 -username %username% -remember-password -dir "Downloads\Y4S4_Shifting_Tides" -validate -max-servers 15 -max-downloads 10
 pause
 cls
 echo Download complete!
 echo It's Shifting Tides 4K!
 goto mainmenu
 )
 if %version%==18 (
 dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377239 -manifest 2194493692563107142 -username %username% -remember-password -dir "Downloads\Y5S1_Void_Edge" -validate -max-servers 15 -max-downloads 10
 pause
 cls
 echo Download complete!
 echo It's Void Edge 4K!
 goto mainmenu
 )
 if %version%==181 (
 dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377239 -manifest 2194493692563107142 -username %username% -remember-password -dir "Downloads\Y5S1_VoidEdge" -validate -max-servers 15 -max-downloads 10
 pause
 cls
 echo Download complete! Thanks Zer0!
 goto mainmenu
 )
 if %version%==19 (
 dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377239 -manifest 3257522596542046976 -username %username% -remember-password -dir "Downloads\Y5S2_Steel_Wave" -validate -max-servers 15 -max-downloads 10
 pause
 cls
 echo Download complete!
 echo It's Steel Wave 4K!
 goto mainmenu
 )
 if %version%==191 (
 dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377239 -manifest 1430519549301269175 -username %username% -remember-password -dir "Downloads\Y5S2_SteelWave_Morphues" -validate -max-servers 15 -max-downloads 10
 pause
 cls
 echo Download complete! Thanks Zer0!
 goto mainmenu
 )
 if %version%==20 (
 dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377239 -manifest 5051396185388503167 -username %username% -remember-password -dir "Downloads\Y5S3_Shadow_Legacy" -validate -max-servers 15 -max-downloads 10
 pause
 cls
 echo Download complete!
 echo It's Shadow Legacy 4K!
 goto mainmenu
 )
 if %version%==21 (
 dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377239 -manifest %manifest% -username %username% -remember-password -dir "Downloads\Placeholder" -validate -max-servers 15 -max-downloads 10
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
 echo # 20 = M.U.T.E Protocol (Support Omega)
 echo # 21 = M.U.T.E Protocol (Not supported Omega)
 echo ----------------------------------------------------
 set /p version="Enter Selection:"
 if %version%==0 (
 cls
 goto DownloadMenu
 )
 MODE 100,40
 

  ::CHIMERA Released
  if %version%==11 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 5071357104726974256 -username %username% -remember-password -dir "Downloads\Y3S1_Chimera" -validate -max-servers 15 -max-downloads 10
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 4701787239566783972 -username %username% -remember-password -dir "Downloads\Y3S1_Chimera" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's CHIMERA Released
  goto mainmenu
  )
  ::MadHouse EVENT
  if %version%==13 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 3546781236735558235 -username %username% -remember-password -dir "Downloads\Y3S3_MadHouse" -validate -max-servers 15 -max-downloads 10
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 1556527176552332195 -username %username% -remember-password -dir "Downloads\Y3S3_MadHouse" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Mad House!
  goto mainmenu
  )
  ::Rainbow is Magic EVENT
  if %version%==15 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 8356277316976403078 -username %username% -remember-password -dir "Downloads\Y4S1_RainbowIsMagic" -validate -max-servers 15 -max-downloads 10
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 5935578581006804383 -username %username% -remember-password -dir "Downloads\Y4S1_RainbowIsMagic" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Rainbow is Magic!
  goto mainmenu
  )
  ::SHIFTING TIDES Released
  if %version%==18 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 299124516841461614 -username %username% -remember-password -dir "Downloads\Y4S4_Shifting_Tides" -validate -max-servers 20 -max-downloads 15
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 1842268638395240106 -username %username% -remember-password -dir "Downloads\Y4S4_Shifting_Tides" -validate -max-servers 20 -max-downloads 15
  pause
  cls
  echo Download complete!
  echo It's SHIFTING TIDES Released!
  goto mainmenu
  )
  ::The Grand Larceny
  if %version%==19 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 4736360397583523381 -username %username% -remember-password -dir "Downloads\Y5S1_TheGrandLarceny" -validate -max-servers 15 -max-downloads 10
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 6296533808765702678 -username %username% -remember-password -dir "Downloads\Y5S1_TheGrandLarceny" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's The Grand Larceny!
  goto mainmenu
  )
  ::MUTE EVENT
  if %version%==20 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 4367817844736324940 -username %username% -remember-password -dir "Downloads\Y5S2_MUTE" -validate -max-servers 15 -max-downloads 10
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 893971391196952070 -username %username% -remember-password -dir "Downloads\Y5S2_MUTE" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's M.U.T.E Protocol (Support Omega)
  goto mainmenu
  )
  ::MUTE EVENT
  if %version%==21 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 2287849678928593252 -username %username% -remember-password -dir "R6Downloads\Y5S2_SteelWave_Morphues" -validate -max-servers 15 -max-downloads 10
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 1610834739284564851 -username %username% -remember-password -dir "R6Downloads\Y5S2_SteelWave_Morphues" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's M.U.T.E Protocol (Not supported Omega)
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
  echo # 5 - Portuguese - Brazil Language
  echo # 6 - Polish Language
  echo # 7 - Dutch Language 
  echo # 8 - Czech Language
  echo # 9 - Korean Language
  echo # 10 - Traditional Chinese Language
  echo # 11 - Simplified Chinese Language
  echo # 12 - Japanese Language
  echo # 13 - Russian Language
  echo --------------------------------------------------
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
  echo # 41 - French Lang on Skull Rain (Zer0) -Same-
  echo # 5 - French Lang on Red Crow 
  echo # 6 - French Lang on Velvet Shell 
  echo # 7 - French Lang on Health 
  echo # 71 - French Lang on Health (Zer0) -Same-
  echo # 8 - French Lang on Blood Orchid 
  echo # 81 - French Lang on Blood Orchid (Zer0) -Same-
  echo # 9 - French Lang on White Noise 
  echo # 91- French Lang on White Noise (Zer0) -Same-
  echo # 10 - French Lang on Chimera 
  echo # 11 - French Lang on Para Bellum 
  echo # 12 - French Lang on Grim Sky 
  echo # 121 - French Lang on Grim Sky (Zer0) -Same-
  echo # 13 - French Lang on Wind Bastion
  echo # 14 - French Lang on Burnt Horizon 
  echo # 141 - French Lang on Burnt Horizon (Zer0) -Same-
  echo # 15 - French Lang on Phantom Sight 
  echo # 16 - French Lang on Ember Rise 
  echo # 161 - French Lang on Ember Rise (Zer0) -Same-
  echo # 17 - French Lang on Shifting Tides 
  echo # 18 - French Lang on Void Edge 
  echo # 181 - French Lang on Void Edge (Zer0) -Same-
  echo # 19 - French Lang on Steel Wave 
  echo # 191 - French Lang on Steel Wave (Zer0) -Same-
  echo # 20 - French Lang on Shadow Legacy 
  ::echo # 21 - Placeholder
  echo --------------------------------------------------
  set /p version="Enter Selection:"
  if %version%==0 (
  cls
  goto Extra
  )
  MODE 100,40
  

  if %version%==1 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359553 -manifest 940838089858119714 -username %username% -remember-password -dir "Downloads\Y1S0_Vanilla" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's French Lang on Vanilla
  goto mainmenu
  )
  if %version%==2 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359553 -manifest 3933270230638281254 -username %username% -remember-password -dir "Downloads\Y1S1_Black_Ice" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's French Lang on Black Ice 
  goto mainmenu
  )
  if %version%==3 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359553 -manifest 8417670786870682154 -username %username% -remember-password -dir "Downloads\Y1S2_Dust_Line" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's French Lang on Dust Line
  goto mainmenu
  )
  if %version%==4 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359553 -manifest 5132022816747475711 -username %username% -remember-password -dir "Downloads\Y1S3_Skull_Rain" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's French Lang on Skull Rain
  goto mainmenu
  )
  if %version%==41 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359553 -manifest 5132022816747475711 -username %username% -remember-password -dir "Downloads\Y1S3_SkullRain" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's French Lang on Skull Rain (Zer0)
  goto mainmenu
  )
  if %version%==5 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359553 -manifest 6096643115970852289 -username %username% -remember-password -dir "Downloads\Y1S4_Red_Crow" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's French Lang on Red Crow
  goto mainmenu
  )
  if %version%==6 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359553 -manifest 5858637819174796390 -username %username% -remember-password -dir "Downloads\Y2S1_Velvet_Shell" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's French Lang on Velvet Shell
  goto mainmenu
  )
  if %version%==7 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359553 -manifest 5499656844751782586 -username %username% -remember-password -dir "Downloads\Y2S2_Health" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's French Lang on Health
  goto mainmenu
  )
  if %version%==71 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359553 -manifest 5499656844751782586 -username %username% -remember-password -dir "Downloads\Y2S2_Health_2" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's French Lang on Health (Zer0)
  goto mainmenu
  )
  if %version%==8 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359553 -manifest 790907662127860380 -username %username% -remember-password -dir "Downloads\Y2S3_Blood_Orchid" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's French Lang on Blood Orchid
  goto mainmenu
  )
  if %version%==81 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359553 -manifest 790907662127860380 -username %username% -remember-password -dir "Downloads\Y2S3_BloodOrchid" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's French Lang on Blood Orchid (Zer0)
  goto mainmenu
  )
  if %version%==9 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359553 -manifest 2934184792636281942 -username %username% -remember-password -dir "Downloads\Y2S4_White_Noises" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's French Lang on White Noise
  goto mainmenu
  )
  if %version%==91 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359553 -manifest 2934184792636281942 -username %username% -remember-password -dir "Downloads\Y2S4_WhiteNoise" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's French Lang on White Noise (Zer0)
  goto mainmenu
  )
  if %version%==10 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359553 -manifest 6830763708591031513 -username %username% -remember-password -dir "Downloads\Y3S1_Chimera" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's French Lang on Chimera
  goto mainmenu
  )
  if %version%==11 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359553 -manifest 2228609364372112585 -username %username% -remember-password -dir "Downloads\Y3S2_Para_Bellum" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's French Lang on Para Bellum
  goto mainmenu
  )
  if %version%==12 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359553 -manifest 3063945558350557421 -username %username% -remember-password -dir "Downloads\Y3S3_Grim_Sky" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's French Lang on Grim Sky
  goto mainmenu
  )
  if %version%==121 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359553 -manifest 3063945558350557421 -username %username% -remember-password -dir "Downloads\Y3S3_GrimSky" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's French Lang on Grim Sky (Zer0)
  goto mainmenu
  )
  if %version%==13 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359553 -manifest 700171152841929114 -username %username% -remember-password -dir "Downloads\Y3S4_Wind_Bastion" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's French Lang on Wind Bastion
  goto mainmenu
  )
  if %version%==14 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359553 -manifest 2489165098014835664 -username %username% -remember-password -dir "Downloads\Y4S1_Burnt_Horizon" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's French Lang on Burnt Horizon
  goto mainmenu
  )
  if %version%==141 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359553 -manifest 2489165098014835664 -username %username% -remember-password -dir "Downloads\Y4S1_BurntHorizon" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's French Lang on Burnt Horizon (Zer0)
  goto mainmenu
  )
  if %version%==15 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359553 -manifest 8209966773310799535 -username %username% -remember-password -dir "Downloads\Y4S2_Phantom_Sight" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's French Lang on Phantom Sight 
  goto mainmenu
  )
  if %version%==16 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359553 -manifest 9167311800727871226 -username %username% -remember-password -dir "Downloads\Y4S3_Ember_Rise" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's French Lang on Ember Rise 
  goto mainmenu
  )
  if %version%==161 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359553 -manifest 9167311800727871226 -username %username% -remember-password -dir "Downloads\Y4S3_EmberRise" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's French Lang on Ember Rise (Zer0)
  goto mainmenu
  )
  if %version%==17 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359553 -manifest 982226827055842157 -username %username% -remember-password -dir "Downloads\Y4S4_Shifting_Tides" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's French Lang on Shifting Tides 
  goto mainmenu
  )
  if %version%==18 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359553 -manifest 6351511531186309516 -username %username% -remember-password -dir "Downloads\Y5S1_Void_Edge" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's French Lang on Void Edge 
  goto mainmenu
  )
  if %version%==181 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359553 -manifest 6351511531186309516 -username %username% -remember-password -dir "Downloads\Y5S1_VoidEdge" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's French Lang on Void Edge (Zer0)
  goto mainmenu
  )
  if %version%==19 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359553 -manifest 379201990182673961 -username %username% -remember-password -dir "Downloads\Y5S2_Steel_Wave" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's French Lang on Steel Wave 
  goto mainmenu
  )
  if %version%==191 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359553 -manifest 379201990182673961 -username %username% -remember-password -dir "Downloads\Y5S2_SteelWave" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's French Lang on Steel Wave (Zer0)
  goto mainmenu
  )
  if %version%==20 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359553 -manifest 490063692268635993 -username %username% -remember-password -dir "Downloads\Y5S3_Shadow_Legacy" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's French Lang on Shadow Legacy
  goto mainmenu
  )
  if %version%==21 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359553 -manifest %manifest% -username %username% -remember-password -dir "Downloads\Placeholder" -validate -max-servers 15 -max-downloads 10
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
  MODE 52,38
  echo           Italian Language Downloader
  echo         What would you like to select?
  echo ----------------------------------------------------
  echo # 0 - Back
  echo ----------------------------------------------------
  echo # 1 - Italian Lang on Vanilla
  echo # 2 - Italian Lang on Black Ice 
  echo # 3 - Italian Lang on Dust Line 
  echo # 4 - Italian Lang on Skull Rain 
  echo # 41 - Italian Lang on Skull Rain (Zer0) -Same-
  echo # 5 - Italian Lang on Red Crow 
  echo # 6 - Italian Lang on Velvet Shell 
  echo # 7 - Italian Lang on Health 
  echo # 71 - Italian Lang on Health (Zer0) -Same-
  echo # 8 - Italian Lang on Blood Orchid 
  echo # 81 - Italian Lang on Blood Orchid (Zer0) -Same-
  echo # 9 - Italian Lang on White Noise 
  echo # 91- Italian Lang on White Noise (Zer0) -Same-
  echo # 10 - Italian Lang on Chimera 
  echo # 11 - Italian Lang on Para Bellum 
  echo # 12 - Italian Lang on Grim Sky 
  echo # 121 - Italian Lang on Grim Sky (Zer0) -Same-
  echo # 13 - Italian Lang on Wind Bastion
  echo # 14 - Italian Lang on Burnt Horizon 
  echo # 141 - Italian Lang on Burnt Horizon (Zer0) -Same-
  echo # 15 - Italian Lang on Phantom Sight 
  echo # 16 - Italian Lang on Ember Rise 
  echo # 161 - Italian Lang on Ember Rise (Zer0) -Same-
  echo # 17 - Italian Lang on Shifting Tides 
  echo # 18 - Italian Lang on Void Edge 
  echo # 181 - Italian Lang on Void Edge (Zer0) -Same-
  echo # 19 - Italian Lang on Steel Wave 
  echo # 191 - Italian Lang on Steel Wave (Zer0) -Same-
  echo # 20 - Italian Lang on Shadow Legacy 
  echo # 21 - Placeholder
  echo ----------------------------------------------------
  set /p version="Enter Selection:"
  if %version%==0 (
  cls
  goto Extra
  )
  MODE 100,40
  
  
  if %version%==1 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359554 -manifest 7179158265062294015 -username %username% -remember-password -dir "Downloads\Y1S0_Vanilla" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Italian Lang on Vanilla
  goto mainmenu
  )
  if %version%==2 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359554 -manifest 5760263381471720373 -username %username% -remember-password -dir "Downloads\Y1S1_Black_Ice" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Italian Lang on Black Ice 
  goto mainmenu
  )
  if %version%==3 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359554 -manifest 2551476087873566284 -username %username% -remember-password -dir "Downloads\Y1S2_Dust_Line" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Italian Lang on Dust Line
  goto mainmenu
  )
  if %version%==4 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359554 -manifest 1819965373025810009 -username %username% -remember-password -dir "Downloads\Y1S3_Skull_Rain" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Italian Lang on Skull Rain
  goto mainmenu
  )
  if %version%==41 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359554 -manifest 1819965373025810009 -username %username% -remember-password -dir "Downloads\Y1S3_SkullRain" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Italian Lang on Skull Rain (Zer0)
  goto mainmenu
  )
  if %version%==5 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359554 -manifest 8822593964618949966 -username %username% -remember-password -dir "Downloads\Y1S4_Red_Crow" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Italian Lang on Red Crow
  goto mainmenu
  )
  if %version%==6 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359554 -manifest 1442016899353884599 -username %username% -remember-password -dir "Downloads\Y2S1_Velvet_Shell" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Italian Lang on Velvet Shell
  goto mainmenu
  )
  if %version%==7 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359554 -manifest 4814130789498386116 -username %username% -remember-password -dir "Downloads\Y2S2_Health" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Italian Lang on Health
  goto mainmenu
  )
  if %version%==71 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359554 -manifest 4814130789498386116 -username %username% -remember-password -dir "Downloads\Y2S2_Health_2" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Italian Lang on Health (Zer0)
  goto mainmenu
  )
  if %version%==8 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359554 -manifest 3928776659583035772 -username %username% -remember-password -dir "Downloads\Y2S3_Blood_Orchid" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Italian Lang on Blood Orchid
  goto mainmenu
  )
  if %version%==81 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359554 -manifest 3928776659583035772 -username %username% -remember-password -dir "Downloads\Y2S3_BloodOrchid" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Italian Lang on Blood Orchid (Zer0)
  goto mainmenu
  )
  if %version%==9 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359554 -manifest 6120111820088733265 -username %username% -remember-password -dir "Downloads\Y2S4_White_Noises" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Italian Lang on White Noise
  goto mainmenu
  )
  if %version%==91 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359554 -manifest 6120111820088733265 -username %username% -remember-password -dir "Downloads\Y2S4_WhiteNoise" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Italian Lang on White Noise (Zer0)
  goto mainmenu
  )
  if %version%==10 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359554 -manifest 8951270584274959688 -username %username% -remember-password -dir "Downloads\Y3S1_Chimera" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Italian Lang on Chimera
  goto mainmenu
  )
  if %version%==11 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359554 -manifest 3765579578277178198 -username %username% -remember-password -dir "Downloads\Y3S2_Para_Bellum" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Italian Lang on Para Bellum
  goto mainmenu
  )
  if %version%==12 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359554 -manifest 8817435015508321947 -username %username% -remember-password -dir "Downloads\Y3S3_Grim_Sky" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Italian Lang on Grim Sky
  goto mainmenu
  )
  if %version%==121 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359554 -manifest 8817435015508321947 -username %username% -remember-password -dir "Downloads\Y3S3_GrimSky" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Italian Lang on Grim Sky (Zer0)
  goto mainmenu
  )
  if %version%==13 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359554 -manifest 6317337128494587862 -username %username% -remember-password -dir "Downloads\Y3S4_Wind_Bastion" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Italian Lang on Wind Bastion
  goto mainmenu
  )
  if %version%==14 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359554 -manifest 5912470135426316642 -username %username% -remember-password -dir "Downloads\Y4S1_Burnt_Horizon" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Italian Lang on Burnt Horizon
  goto mainmenu
  )
  if %version%==141 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359554 -manifest 5912470135426316642 -username %username% -remember-password -dir "Downloads\Y4S1_BurntHorizon" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Italian Lang on Burnt Horizon (Zer0)
  goto mainmenu
  )
  if %version%==15 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359554 -manifest 5551310338808720316 -username %username% -remember-password -dir "Downloads\Y4S2_Phantom_Sight" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Italian Lang on Phantom Sight 
  goto mainmenu
  )
  if %version%==16 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359554 -manifest 9032788833180559255 -username %username% -remember-password -dir "Downloads\Y4S3_Ember_Rise" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Italian Lang on Ember Rise 
  goto mainmenu
  )
  if %version%==161 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359554 -manifest 9032788833180559255 -username %username% -remember-password -dir "Downloads\Y4S3_EmberRise" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Italian Lang on Ember Rise (Zer0)
  goto mainmenu
  )
  if %version%==17 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359554 -manifest 7669952636769439421 -username %username% -remember-password -dir "Downloads\Y4S4_Shifting_Tides" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Italian Lang on Shifting Tides 
  goto mainmenu
  )
  if %version%==18 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359554 -manifest 2083562978649529043 -username %username% -remember-password -dir "Downloads\Y5S1_Void_Edge" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Italian Lang on Void Edge 
  goto mainmenu
  )
  if %version%==181 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359554 -manifest 2083562978649529043 -username %username% -remember-password -dir "Downloads\Y5S1_VoidEdge" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Italian Lang on Void Edge (Zer0)
  goto mainmenu
  )
  if %version%==19 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359554 -manifest 7015749936618767871 -username %username% -remember-password -dir "Downloads\Y5S2_Steel_Wave" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Italian Lang on Steel Wave 
  goto mainmenu
  )
  if %version%==191 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359554 -manifest 7015749936618767871 -username %username% -remember-password -dir "Downloads\Y5S2_SteelWave" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Italian Lang on Steel Wave (Zer0)
  goto mainmenu
  )
  if %version%==20 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359554 -manifest 8865509294556462405 -username %username% -remember-password -dir "Downloads\Y5S3_Shadow_Legacy" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Italian Lang on Shadow Legacy
  goto mainmenu
  )
  if %version%==21 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359554 -manifest %manifest% -username %username% -remember-password -dir "Downloads\Placeholder" -validate -max-servers 15 -max-downloads 10
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
  echo # 41 - German Lang on Skull Rain (Zer0) -Same-
  echo # 5 - German Lang on Red Crow 
  echo # 6 - German Lang on Velvet Shell 
  echo # 7 - German Lang on Health 
  echo # 71 - German Lang on Health (Zer0) -Same-
  echo # 8 - German Lang on Blood Orchid 
  echo # 81 - German Lang on Blood Orchid (Zer0) -Same-
  echo # 9 - German Lang on White Noise 
  echo # 91- German Lang on White Noise (Zer0) -Same-
  echo # 10 - German Lang on Chimera 
  echo # 11 - German Lang on Para Bellum 
  echo # 12 - German Lang on Grim Sky 
  echo # 121 - German Lang on Grim Sky (Zer0) -Same-
  echo # 13 - German Lang on Wind Bastion
  echo # 14 - German Lang on Burnt Horizon 
  echo # 141 - German Lang on Burnt Horizon (Zer0) -Same-
  echo # 15 - German Lang on Phantom Sight 
  echo # 16 - German Lang on Ember Rise 
  echo # 161 - German Lang on Ember Rise (Zer0) -Same-
  echo # 17 - German Lang on Shifting Tides 
  echo # 18 - German Lang on Void Edge 
  echo # 181 - German Lang on Void Edge (Zer0) -Same-
  echo # 19 - German Lang on Steel Wave 
  echo # 191 - German Lang on Steel Wave (Zer0) -Same-
  echo # 20 - German Lang on Shadow Legacy 
  ::echo # 21 - Placeholder
	echo --------------------------------------------------
	set /p version="Enter Selection:"
	if %version%==0 (
	cls
	goto Extra
	)
	MODE 100,40
	

	if %version%==1 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359555 -manifest 3953006809848583127 -username %username% -remember-password -dir "Downloads\Y1S0_Vanilla" -validate -max-servers 15 -max-downloads 10
	pause
	cls
	echo Download complete!
	echo It's German Lang on Vanilla
	goto mainmenu
	)
  if %version%==2 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359555 -manifest 7470955591961528063 -username %username% -remember-password -dir "Downloads\Y1S1_Black_Ice" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's German Lang on Black Ice 
  goto mainmenu
  )
  if %version%==3 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359555 -manifest 781358903497748263 -username %username% -remember-password -dir "Downloads\Y1S2_Dust_Line" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's German Lang on Dust Line
  goto mainmenu
  )
  if %version%==4 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359555 -manifest 1926652807113950777 -username %username% -remember-password -dir "Downloads\Y1S3_Skull_Rain" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's German Lang on Skull Rain
  goto mainmenu
  )
  if %version%==41 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359555 -manifest 1926652807113950777 -username %username% -remember-password -dir "Downloads\Y1S3_SkullRain" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's German Lang on Skull Rain (Zer0)
  goto mainmenu
  )
  if %version%==5 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359555 -manifest 7995072742170754868 -username %username% -remember-password -dir "Downloads\Y1S4_Red_Crow" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's German Lang on Red Crow
  goto mainmenu
  )
  if %version%==6 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359555 -manifest 7391813408396935946 -username %username% -remember-password -dir "Downloads\Y2S1_Velvet_Shell" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's German Lang on Velvet Shell
  goto mainmenu
  )
  if %version%==7 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359555 -manifest 4850286352511597480 -username %username% -remember-password -dir "Downloads\Y2S2_Health" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's German Lang on Health
  goto mainmenu
  )
  if %version%==71 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359555 -manifest 4850286352511597480 -username %username% -remember-password -dir "Downloads\Y2S2_Health_2" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's German Lang on Health (Zer0)
  goto mainmenu
  )
  if %version%==8 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359555 -manifest 7173152983008794231 -username %username% -remember-password -dir "Downloads\Y2S3_Blood_Orchid" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's German Lang on Blood Orchid
  goto mainmenu
  )
  if %version%==81 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359555 -manifest 7173152983008794231 -username %username% -remember-password -dir "Downloads\Y2S3_BloodOrchid" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's German Lang on Blood Orchid (Zer0)
  goto mainmenu
  )
  if %version%==9 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359555 -manifest 1122657510721658234 -username %username% -remember-password -dir "Downloads\Y2S4_White_Noises" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's German Lang on White Noise
  goto mainmenu
  )
  if %version%==91 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359555 -manifest 1122657510721658234 -username %username% -remember-password -dir "Downloads\Y2S4_WhiteNoise" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's German Lang on White Noise (Zer0)
  goto mainmenu
  )
  if %version%==10 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359555 -manifest 365667853833643908 -username %username% -remember-password -dir "Downloads\Y3S1_Chimera" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's German Lang on Chimera
  goto mainmenu
  )
  if %version%==11 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359555 -manifest 436165049364805671 -username %username% -remember-password -dir "Downloads\Y3S2_Para_Bellum" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's German Lang on Para Bellum
  goto mainmenu
  )
  if %version%==12 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359555 -manifest 6254711869946987864 -username %username% -remember-password -dir "Downloads\Y3S3_Grim_Sky" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's German Lang on Grim Sky
  goto mainmenu
  )
  if %version%==121 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359555 -manifest 6254711869946987864 -username %username% -remember-password -dir "Downloads\Y3S3_GrimSky" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's German Lang on Grim Sky (Zer0)
  goto mainmenu
  )
  if %version%==13 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359555 -manifest 6357970357791494519 -username %username% -remember-password -dir "Downloads\Y3S4_Wind_Bastion" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's German Lang on Wind Bastion
  goto mainmenu
  )
  if %version%==14 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359555 -manifest 6166102473910342218 -username %username% -remember-password -dir "Downloads\Y4S1_Burnt_Horizon" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's German Lang on Burnt Horizon
  goto mainmenu
  )
  if %version%==141 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359555 -manifest 6166102473910342218 -username %username% -remember-password -dir "Downloads\Y4S1_BurntHorizon" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's German Lang on Burnt Horizon (Zer0)
  goto mainmenu
  )
  if %version%==15 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359555 -manifest 2945239480726569964 -username %username% -remember-password -dir "Downloads\Y4S2_Phantom_Sight" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's German Lang on Phantom Sight 
  goto mainmenu
  )
  if %version%==16 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359555 -manifest 5892684040914151033 -username %username% -remember-password -dir "Downloads\Y4S3_Ember_Rise" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's German Lang on Ember Rise 
  goto mainmenu
  )
  if %version%==161 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359555 -manifest 5892684040914151033 -username %username% -remember-password -dir "Downloads\Y4S3_EmberRise" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's German Lang on Ember Rise (Zer0)
  goto mainmenu
  )
  if %version%==17 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359555 -manifest 1771833119782386213 -username %username% -remember-password -dir "Downloads\Y4S4_Shifting_Tides" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's German Lang on Shifting Tides 
  goto mainmenu
  )
  if %version%==18 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359555 -manifest 4220186838055347645 -username %username% -remember-password -dir "Downloads\Y5S1_Void_Edge" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's German Lang on Void Edge 
  goto mainmenu
  )
  if %version%==181 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359555 -manifest 4220186838055347645 -username %username% -remember-password -dir "Downloads\Y5S1_VoidEdge" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's German Lang on Void Edge (Zer0)
  goto mainmenu
  )
  if %version%==19 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359555 -manifest 9103781936104145156 -username %username% -remember-password -dir "Downloads\Y5S2_Steel_Wave" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's German Lang on Steel Wave 
  goto mainmenu
  )
  if %version%==191 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359555 -manifest 9103781936104145156 -username %username% -remember-password -dir "Downloads\Y5S2_SteelWave" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's German Lang on Steel Wave (Zer0)
  goto mainmenu
  )
  if %version%==20 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359555 -manifest 615915835199657008 -username %username% -remember-password -dir "Downloads\Y5S3_Shadow_Legacy" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's German Lang on Shadow Legacy
  goto mainmenu
  )
  if %version%==21 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359555 -manifest %manifest% -username %username% -remember-password -dir "Downloads\Placeholder" -validate -max-servers 15 -max-downloads 10
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
  echo ----------------------------------------------------
  echo # 0 - Back
  echo ----------------------------------------------------
  echo # 1 - Spanish Lang on Vanilla
  echo # 2 - Spanish Lang on Black Ice 
  echo # 3 - Spanish Lang on Dust Line 
  echo # 4 - Spanish Lang on Skull Rain 
  echo # 41 - Spanish Lang on Skull Rain (Zer0) -Same-
  echo # 5 - Spanish Lang on Red Crow 
  echo # 6 - Spanish Lang on Velvet Shell 
  echo # 7 - Spanish Lang on Health 
  echo # 71 - Spanish Lang on Health (Zer0) -Same-
  echo # 8 - Spanish Lang on Blood Orchid 
  echo # 81 - Spanish Lang on Blood Orchid (Zer0) -Same-
  echo # 9 - Spanish Lang on White Noise 
  echo # 91- Spanish Lang on White Noise (Zer0) -Same-
  echo # 10 - Spanish Lang on Chimera 
  echo # 11 - Spanish Lang on Para Bellum 
  echo # 12 - Spanish Lang on Grim Sky 
  echo # 121 - Spanish Lang on Grim Sky (Zer0) -Same-
  echo # 13 - Spanish Lang on Wind Bastion
  echo # 14 - Spanish Lang on Burnt Horizon 
  echo # 141 - Spanish Lang on Burnt Horizon (Zer0) -Same-
  echo # 15 - Spanish Lang on Phantom Sight 
  echo # 16 - Spanish Lang on Ember Rise 
  echo # 161 - Spanish Lang on Ember Rise (Zer0) -Same-
  echo # 17 - Spanish Lang on Shifting Tides 
  echo # 18 - Spanish Lang on Void Edge 
  echo # 181 - Spanish Lang on Void Edge (Zer0) -Same-
  echo # 19 - Spanish Lang on Steel Wave 
  echo # 191 - Spanish Lang on Steel Wave (Zer0) -Same-
  echo # 20 - Spanish Lang on Shadow Legacy 
  ::echo # 21 - Placeholder
  echo ----------------------------------------------------
  set /p version="Enter Selection:"
  if %version%==0 (
  cls
  goto Extra
  )
  MODE 100,40
  
  
  if %version%==1 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359556 -manifest 6248979332984503061 -username %username% -remember-password -dir "Downloads\Y1S0_Vanilla" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Spanish Lang on Vanilla
  goto mainmenu
  )
  if %version%==2 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359556 -manifest 6534545487175120142 -username %username% -remember-password -dir "Downloads\Y1S1_Black_Ice" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Spanish Lang on Black Ice 
  goto mainmenu
  )
  if %version%==3 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359556 -manifest 8080893511664284255 -username %username% -remember-password -dir "Downloads\Y1S2_Dust_Line" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Spanish Lang on Dust Line
  goto mainmenu
  )
  if %version%==4 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359556 -manifest 3102063947541599011 -username %username% -remember-password -dir "Downloads\Y1S3_Skull_Rain" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Spanish Lang on Skull Rain
  goto mainmenu
  )
  if %version%==41 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359556 -manifest 3102063947541599011 -username %username% -remember-password -dir "Downloads\Y1S3_SkullRain" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Spanish Lang on Skull Rain (Zer0)
  goto mainmenu
  )
  if %version%==5 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359556 -manifest 3745420316643316529 -username %username% -remember-password -dir "Downloads\Y1S4_Red_Crow" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Spanish Lang on Red Crow
  goto mainmenu
  )
  if %version%==6 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359556 -manifest 4034802727985013756 -username %username% -remember-password -dir "Downloads\Y2S1_Velvet_Shell" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Spanish Lang on Velvet Shell
  goto mainmenu
  )
  if %version%==7 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359556 -manifest 7743695641492470240 -username %username% -remember-password -dir "Downloads\Y2S2_Health" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Spanish Lang on Health
  goto mainmenu
  )
  if %version%==71 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359556 -manifest 7743695641492470240 -username %username% -remember-password -dir "Downloads\Y2S2_Health_2" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Spanish Lang on Health (Zer0)
  goto mainmenu
  )
  if %version%==8 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359556 -manifest 7768315116657553428 -username %username% -remember-password -dir "Downloads\Y2S3_Blood_Orchid" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Spanish Lang on Blood Orchid
  goto mainmenu
  )
  if %version%==81 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359556 -manifest 7768315116657553428 -username %username% -remember-password -dir "Downloads\Y2S3_BloodOrchid" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Spanish Lang on Blood Orchid (Zer0)
  goto mainmenu
  )
  if %version%==9 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359556 -manifest 7877024295509467816 -username %username% -remember-password -dir "Downloads\Y2S4_White_Noises" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Spanish Lang on White Noise
  goto mainmenu
  )
  if %version%==91 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359556 -manifest 7877024295509467816 -username %username% -remember-password -dir "Downloads\Y2S4_WhiteNoise" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Spanish Lang on White Noise (Zer0)
  goto mainmenu
  )
  if %version%==10 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359556 -manifest 723936785330189072 -username %username% -remember-password -dir "Downloads\Y3S1_Chimera" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Spanish Lang on Chimera
  goto mainmenu
  )
  if %version%==11 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359556 -manifest 3396331896624899011 -username %username% -remember-password -dir "Downloads\Y3S2_Para_Bellum" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Spanish Lang on Para Bellum
  goto mainmenu
  )
  if %version%==12 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359556 -manifest 2769168610408745300 -username %username% -remember-password -dir "Downloads\Y3S3_Grim_Sky" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Spanish Lang on Grim Sky
  goto mainmenu
  )
  if %version%==121 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359556 -manifest 2769168610408745300 -username %username% -remember-password -dir "Downloads\Y3S3_GrimSky" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Spanish Lang on Grim Sky (Zer0)
  goto mainmenu
  )
  if %version%==13 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359556 -manifest 1310832078295252288 -username %username% -remember-password -dir "Downloads\Y3S4_Wind_Bastion" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Spanish Lang on Wind Bastion
  goto mainmenu
  )
  if %version%==14 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359556 -manifest 8980928302668128431 -username %username% -remember-password -dir "Downloads\Y4S1_Burnt_Horizon" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Spanish Lang on Burnt Horizon
  goto mainmenu
  )
  if %version%==141 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359556 -manifest 8980928302668128431 -username %username% -remember-password -dir "Downloads\Y4S1_BurntHorizon" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Spanish Lang on Burnt Horizon (Zer0)
  goto mainmenu
  )
  if %version%==15 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359556 -manifest 3119251800260595817 -username %username% -remember-password -dir "Downloads\Y4S2_Phantom_Sight" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Spanish Lang on Phantom Sight 
  goto mainmenu
  )
  if %version%==16 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359556 -manifest 4178602548762056641 -username %username% -remember-password -dir "Downloads\Y4S3_Ember_Rise" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Spanish Lang on Ember Rise 
  goto mainmenu
  )
  if %version%==161 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359556 -manifest 3299372491475509511 -username %username% -remember-password -dir "Downloads\Y4S3_EmberRise" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Spanish Lang on Ember Rise (Zer0)
  goto mainmenu
  )
  if %version%==17 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359556 -manifest 5607986007728468442 -username %username% -remember-password -dir "Downloads\Y4S4_Shifting_Tides" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Spanish Lang on Shifting Tides 
  goto mainmenu
  )
  if %version%==18 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359556 -manifest 8280780297583800068 -username %username% -remember-password -dir "Downloads\Y5S1_Void_Edge" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Spanish Lang on Void Edge 
  goto mainmenu
  )
  if %version%==181 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359556 -manifest 8280780297583800068 -username %username% -remember-password -dir "Downloads\Y5S1_VoidEdge" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Spanish Lang on Void Edge (Zer0)
  goto mainmenu
  )
  if %version%==19 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359556 -manifest 3323378213398656976 -username %username% -remember-password -dir "Downloads\Y5S2_Steel_Wave" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Spanish Lang on Steel Wave 
  goto mainmenu
  )
  if %version%==191 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359556 -manifest 3323378213398656976 -username %username% -remember-password -dir "Downloads\Y5S2_SteelWave" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Spanish Lang on Steel Wave (Zer0)
  goto mainmenu
  )
  if %version%==20 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359556 -manifest 2485600059396261361 -username %username% -remember-password -dir "Downloads\Y5S3_Shadow_Legacy" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Spanish Lang on Shadow Legacy
  goto mainmenu
  )
  if %version%==21 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359556 -manifest %manifest% -username %username% -remember-password -dir "Downloads\Placeholder" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Spanish Lang on Placeholder
  goto mainmenu
  )
  goto Extra
::Spanish END



::Brasilian START
:Brasilian
  cls
  Title Rainbow Six Siege Brasilian Lang Downloader
  MODE 54,38
  echo          Brasilian Language Downloader
  echo         What would you like to select?
  echo ------------------------------------------------------
  echo # 0 - Back
  echo ------------------------------------------------------
  echo # 1 - Brasilian Lang on Vanilla
  echo # 2 - Brasilian Lang on Black Ice 
  echo # 3 - Brasilian Lang on Dust Line 
  echo # 4 - Brasilian Lang on Skull Rain 
  echo # 41 - Brasilian Lang on Skull Rain (Zer0) -Same-
  echo # 5 - Brasilian Lang on Red Crow 
  echo # 6 - Brasilian Lang on Velvet Shell 
  echo # 7 - Brasilian Lang on Health 
  echo # 71 - Brasilian Lang on Health (Zer0) -Same-
  echo # 8 - Brasilian Lang on Blood Orchid 
  echo # 81 - Brasilian Lang on Blood Orchid (Zer0) -Same-
  echo # 9 - Brasilian Lang on White Noise 
  echo # 91- Brasilian Lang on White Noise (Zer0) -Same-
  echo # 10 - Brasilian Lang on Chimera 
  echo # 11 - Brasilian Lang on Para Bellum 
  echo # 12 - Brasilian Lang on Grim Sky 
  echo # 121 - Brasilian Lang on Grim Sky (Zer0) -Same-
  echo # 13 - Brasilian Lang on Wind Bastion
  echo # 14 - Brasilian Lang on Burnt Horizon 
  echo # 141 - Brasilian Lang on Burnt Horizon (Zer0) -Same-
  echo # 15 - Brasilian Lang on Phantom Sight 
  echo # 16 - Brasilian Lang on Ember Rise 
  echo # 161 - Brasilian Lang on Ember Rise (Zer0) -Same-
  echo # 17 - Brasilian Lang on Shifting Tides 
  echo # 18 - Brasilian Lang on Void Edge 
  echo # 181 - Brasilian Lang on Void Edge (Zer0) -Same-
  echo # 19 - Brasilian Lang on Steel Wave 
  echo # 191 - Brasilian Lang on Steel Wave (Zer0) -Same-
  echo # 20 - Brasilian Lang on Shadow Legacy 
  ::echo # 21 - Placeholder
  echo ------------------------------------------------------
  set /p version="Enter Selection:"
  if %version%==0 (
  cls
  goto Extra
  )
  MODE 100,40
  

  if %version%==1 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359557 -manifest 4246528818872796970 -username %username% -remember-password -dir "Downloads\Y1S0_Vanilla" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Brasilian Lang on Vanilla
  goto mainmenu
  )
  if %version%==2 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359557 -manifest 5712713603408405370 -username %username% -remember-password -dir "Downloads\Y1S1_Black_Ice" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Brasilian Lang on Black Ice 
  goto mainmenu
  )
  if %version%==3 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359557 -manifest 7093312220135270425 -username %username% -remember-password -dir "Downloads\Y1S2_Dust_Line" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Brasilian Lang on Dust Line
  goto mainmenu
  )
  if %version%==4 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359557 -manifest 1002387473375422601 -username %username% -remember-password -dir "Downloads\Y1S3_Skull_Rain" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Brasilian Lang on Skull Rain
  goto mainmenu
  )
  if %version%==41 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359557 -manifest 1002387473375422601 -username %username% -remember-password -dir "Downloads\Y1S3_SkullRain" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Brasilian Lang on Skull Rain (Zer0)
  goto mainmenu
  )
  if %version%==5 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359557 -manifest 9177769359376990903 -username %username% -remember-password -dir "Downloads\Y1S4_Red_Crow" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Brasilian Lang on Red Crow
  goto mainmenu
  )
  if %version%==6 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359557 -manifest 8373797984073491957 -username %username% -remember-password -dir "Downloads\Y2S1_Velvet_Shell" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Brasilian Lang on Velvet Shell
  goto mainmenu
  )
  if %version%==7 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359557 -manifest 740877577181398044 -username %username% -remember-password -dir "Downloads\Y2S2_Health" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Brasilian Lang on Health
  goto mainmenu
  )
  if %version%==71 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359557 -manifest 740877577181398044 -username %username% -remember-password -dir "Downloads\Y2S2_Health_2" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Brasilian Lang on Health (Zer0)
  goto mainmenu
  )
  if %version%==8 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359557 -manifest 4018202152273389175 -username %username% -remember-password -dir "Downloads\Y2S3_Blood_Orchid" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Brasilian Lang on Blood Orchid
  goto mainmenu
  )
  if %version%==81 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359557 -manifest 4018202152273389175 -username %username% -remember-password -dir "Downloads\Y2S3_BloodOrchid" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Brasilian Lang on Blood Orchid (Zer0)
  goto mainmenu
  )
  if %version%==9 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359557 -manifest 7662200840621314199 -username %username% -remember-password -dir "Downloads\Y2S4_White_Noises" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Brasilian Lang on White Noise
  goto mainmenu
  )
  if %version%==91 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359557 -manifest 7662200840621314199 -username %username% -remember-password -dir "Downloads\Y2S4_WhiteNoise" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Brasilian Lang on White Noise (Zer0)
  goto mainmenu
  )
  if %version%==10 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359557 -manifest 4967060442376701942 -username %username% -remember-password -dir "Downloads\Y3S1_Chimera" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Brasilian Lang on Chimera
  goto mainmenu
  )
  if %version%==11 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359557 -manifest 7222426493426609376 -username %username% -remember-password -dir "Downloads\Y3S2_Para_Bellum" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Brasilian Lang on Para Bellum
  goto mainmenu
  )
  if %version%==12 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359557 -manifest 1079437953122108725 -username %username% -remember-password -dir "Downloads\Y3S3_Grim_Sky" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Brasilian Lang on Grim Sky
  goto mainmenu
  )
  if %version%==121 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359557 -manifest 1079437953122108725 -username %username% -remember-password -dir "Downloads\Y3S3_GrimSky" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Brasilian Lang on Grim Sky (Zer0)
  goto mainmenu
  )
  if %version%==13 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359557 -manifest 6212948834557799675 -username %username% -remember-password -dir "Downloads\Y3S4_Wind_Bastion" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Brasilian Lang on Wind Bastion
  goto mainmenu
  )
  if %version%==14 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359557 -manifest 5742909617569886590 -username %username% -remember-password -dir "Downloads\Y4S1_Burnt_Horizon" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Brasilian Lang on Burnt Horizon
  goto mainmenu
  )
  if %version%==141 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359557 -manifest 5742909617569886590 -username %username% -remember-password -dir "Downloads\Y4S1_BurntHorizon" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Brasilian Lang on Burnt Horizon (Zer0)
  goto mainmenu
  )
  if %version%==15 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359557 -manifest 2060894578496472402 -username %username% -remember-password -dir "Downloads\Y4S2_Phantom_Sight" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Brasilian Lang on Phantom Sight 
  goto mainmenu
  )
  if %version%==16 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359557 -manifest 8187109316671389619 -username %username% -remember-password -dir "Downloads\Y4S3_Ember_Rise" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Brasilian Lang on Ember Rise 
  goto mainmenu
  )
  if %version%==161 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359557 -manifest 8187109316671389619 -username %username% -remember-password -dir "Downloads\Y4S3_EmberRise" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Brasilian Lang on Ember Rise (Zer0)
  goto mainmenu
  )
  if %version%==17 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359557 -manifest 3980031497374187833 -username %username% -remember-password -dir "Downloads\Y4S4_Shifting_Tides" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Brasilian Lang on Shifting Tides 
  goto mainmenu
  )
  if %version%==18 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359557 -manifest 1408940456585952484 -username %username% -remember-password -dir "Downloads\Y5S1_Void_Edge" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Brasilian Lang on Void Edge 
  goto mainmenu
  )
  if %version%==181 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359557 -manifest 1408940456585952484 -username %username% -remember-password -dir "Downloads\Y5S1_VoidEdge" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Brasilian Lang on Void Edge (Zer0)
  goto mainmenu
  )
  if %version%==19 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359557 -manifest 3124010063296699270 -username %username% -remember-password -dir "Downloads\Y5S2_Steel_Wave" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Brasilian Lang on Steel Wave 
  goto mainmenu
  )
  if %version%==191 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359557 -manifest 3124010063296699270 -username %username% -remember-password -dir "Downloads\Y5S2_SteelWave" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Brasilian Lang on Steel Wave (Zer0)
  goto mainmenu
  )
  if %version%==20 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359557 -manifest 6424468667015085021 -username %username% -remember-password -dir "Downloads\Y5S3_Shadow_Legacy" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Brasilian Lang on Shadow Legacy
  goto mainmenu
  )
  if %version%==21 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359557 -manifest %manifest% -username %username% -remember-password -dir "Downloads\Placeholder" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Brasilian Lang on Placeholder
  goto mainmenu
  )
  goto Extra
::Brasilian END



::Polish START
:Polish
  cls
  Title Rainbow Six Siege Polish Lang Downloader
  MODE 50,20
  echo           Polish Language Downloader
  echo         What would you like to select?
  echo --------------------------------------------------
  echo # 0 - Back
  echo --------------------------------------------------
  echo # 1 - Polish Lang on Vanilla
  echo # 2 - Polish Lang on Black Ice 
  echo # 3 - Polish Lang on Dust Line 
  echo # 4 - Polish Lang on Skull Rain 
  ::echo # 21 - Placeholder
  echo --------------------------------------------------
  set /p version="Enter Selection:"
  if %version%==0 (
  cls
  goto Extra
  )
  MODE 100,40
  
  
  if %version%==1 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359558 -manifest 3650448467998593870 -username %username% -remember-password -dir "Downloads\Y1S0_Vanilla" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Polish Lang on Vanilla
  goto mainmenu
  )
  if %version%==2 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359558 -manifest 611380037218554981 -username %username% -remember-password -dir "Downloads\Y1S1_Black_Ice" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Polish Lang on Black Ice 
  goto mainmenu
  )
  if %version%==3 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359558 -manifest 3858352830712224800 -username %username% -remember-password -dir "Downloads\Y1S2_Dust_Line" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Polish Lang on Dust Line
  goto mainmenu
  )
  if %version%==4 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359558 -manifest 2324023684915670753 -username %username% -remember-password -dir "Downloads\Y1S3_Skull_Rain" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Polish Lang on Skull Rain
  goto mainmenu
  )
  if %version%==21 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359558 -manifest %manifest% -username %username% -remember-password -dir "Downloads\Placeholder" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Polish Lang on Placeholder
  goto mainmenu
  )
  goto Extra
::Polish END



::Dutch START
:Dutch
  cls
  Title Rainbow Six Siege Dutch Lang Downloader
  MODE 50,20
  echo           Dutch Language Downloader
  echo         What would you like to select?
  echo --------------------------------------------------
  echo # 0 - Back
  echo --------------------------------------------------
  echo # 1 - Dutch Lang on Vanilla
  echo # 2 - Dutch Lang on Black Ice 
  echo # 3 - Dutch Lang on Dust Line 
  echo # 4 - Dutch Lang on Skull Rain 
  ::echo # 21 - Placeholder
  echo --------------------------------------------------
  set /p version="Enter Selection:"
  if %version%==0 (
  cls
  goto Extra
  )
  MODE 100,40
  
  
  if %version%==1 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377230 -manifest 434053950562761763 -username %username% -remember-password -dir "Downloads\Y1S0_Vanilla" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Dutch Lang on Vanilla
  goto mainmenu
  )
  if %version%==2 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377230 -manifest 2252756710796870124 -username %username% -remember-password -dir "Downloads\Y1S1_Black_Ice" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Dutch Lang on Black Ice 
  goto mainmenu
  )
  if %version%==3 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377230 -manifest 792523120148938529 -username %username% -remember-password -dir "Downloads\Y1S2_Dust_Line" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Dutch Lang on Dust Line
  goto mainmenu
  )
  if %version%==4 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377230 -manifest 6519643449965700176 -username %username% -remember-password -dir "Downloads\Y1S3_Skull_Rain" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Dutch Lang on Skull Rain
  goto mainmenu
  )
  if %version%==21 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377230 -manifest %manifest% -username %username% -remember-password -dir "Downloads\Placeholder" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Dutch Lang on Placeholder
  goto mainmenu
  )
  goto Extra
::Dutch END



::Czech START
:Czech
  cls
  Title Rainbow Six Siege Czech Lang Downloader
  MODE 50,20
  echo           Czech Language Downloader
  echo         What would you like to select?
  echo --------------------------------------------------
  echo # 0 - Back
  echo --------------------------------------------------
  echo # 1 - Czech Lang on Vanilla
  echo # 2 - Czech Lang on Black Ice 
  echo # 3 - Czech Lang on Dust Line 
  echo # 4 - Czech Lang on Skull Rain 
  ::echo # 21 - Placeholder
  echo --------------------------------------------------
  set /p version="Enter Selection:"
  if %version%==0 (
  cls
  goto Extra
  )
  MODE 100,40
  
  
  if %version%==1 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377231 -manifest 961787742874674106 -username %username% -remember-password -dir "Downloads\Y1S0_Vanilla" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Czech Lang on Vanilla
  goto mainmenu
  )
  if %version%==2 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377231 -manifest 9083464997167398804 -username %username% -remember-password -dir "Downloads\Y1S1_Black_Ice" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Czech Lang on Black Ice 
  goto mainmenu
  )
  if %version%==3 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377231 -manifest 5042288075851140032 -username %username% -remember-password -dir "Downloads\Y1S2_Dust_Line" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Czech Lang on Dust Line
  goto mainmenu
  )
  if %version%==4 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377231 -manifest 2274850673348857246 -username %username% -remember-password -dir "Downloads\Y1S3_Skull_Rain" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Czech Lang on Skull Rain
  goto mainmenu
  )
  if %version%==21 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377231 -manifest %manifest% -username %username% -remember-password -dir "Downloads\Placeholder" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Czech Lang on Placeholder
  goto mainmenu
  )
  goto Extra
::Czech END



::Korean START
:Korean
  cls
  Title Rainbow Six Siege Korean Lang Downloader
  MODE 50,20
  echo           Korean Language Downloader
  echo         What would you like to select?
  echo --------------------------------------------------
  echo # 0 - Back
  echo --------------------------------------------------
  echo # 1 - Korean Lang on Vanilla
  echo # 2 - Korean Lang on Black Ice 
  echo # 3 - Korean Lang on Dust Line 
  echo # 4 - Korean Lang on Skull Rain 
  ::echo # 21 - Placeholder
  echo --------------------------------------------------
  set /p version="Enter Selection:"
  if %version%==0 (
  cls
  goto Extra
  )
  MODE 100,40
  
  
  if %version%==1 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377232 -manifest 4666462401429503167 -username %username% -remember-password -dir "Downloads\Y1S0_Vanilla" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Korean Lang on Vanilla
  goto mainmenu
  )
  if %version%==2 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377232 -manifest 1679233699688952842 -username %username% -remember-password -dir "Downloads\Y1S1_Black_Ice" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Korean Lang on Black Ice 
  goto mainmenu
  )
  if %version%==3 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377232 -manifest 3857270863114730703 -username %username% -remember-password -dir "Downloads\Y1S2_Dust_Line" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Korean Lang on Dust Line
  goto mainmenu
  )
  if %version%==4 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377232 -manifest 3010562235525323962 -username %username% -remember-password -dir "Downloads\Y1S3_Skull_Rain" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Korean Lang on Skull Rain
  goto mainmenu
  )
  if %version%==21 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377232 -manifest %manifest% -username %username% -remember-password -dir "Downloads\Placeholder" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Korean Lang on Placeholder
  goto mainmenu
  )
  goto Extra
::Korean END



::TChinese START
:TChinese
  cls
  Title Rainbow Six Siege TChinese Lang Downloader
  MODE 50,20
  echo           TChinese Language Downloader
  echo         What would you like to select?
  echo --------------------------------------------------
  echo # 0 - Back
  echo --------------------------------------------------
  echo # 1 - TChinese Lang on Vanilla
  echo # 2 - TChinese Lang on Black Ice 
  echo # 3 - TChinese Lang on Dust Line 
  echo # 4 - TChinese Lang on Skull Rain 
  ::echo # 21 - Placeholder
  echo --------------------------------------------------
  set /p version="Enter Selection:"
  if %version%==0 (
  cls
  goto Extra
  )
  MODE 100,40
  
  
  if %version%==1 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377233 -manifest 8123484057310613369 -username %username% -remember-password -dir "Downloads\Y1S0_Vanilla" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's TChinese Lang on Vanilla
  goto mainmenu
  )
  if %version%==2 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377233 -manifest 6415534268030477043 -username %username% -remember-password -dir "Downloads\Y1S1_Black_Ice" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's TChinese Lang on Black Ice 
  goto mainmenu
  )
  if %version%==3 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377233 -manifest 1924001092871695610 -username %username% -remember-password -dir "Downloads\Y1S2_Dust_Line" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's TChinese Lang on Dust Line
  goto mainmenu
  )
  if %version%==4 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377233 -manifest 4953478873615251033 -username %username% -remember-password -dir "Downloads\Y1S3_Skull_Rain" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's TChinese Lang on Skull Rain
  goto mainmenu
  )
  if %version%==21 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377233 -manifest %manifest% -username %username% -remember-password -dir "Downloads\Placeholder" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's TChinese Lang on Placeholder
  goto mainmenu
  )
  goto Extra
::TChinese END



::SChinese START
:SChinese
  cls
  Title Rainbow Six Siege SChinese Lang Downloader
  MODE 50,20
  echo           SChinese Language Downloader
  echo         What would you like to select?
  echo --------------------------------------------------
  echo # 0 - Back
  echo --------------------------------------------------
  echo # 1 - SChinese Lang on Vanilla
  echo # 2 - SChinese Lang on Black Ice 
  echo # 3 - SChinese Lang on Dust Line 
  echo # 4 - SChinese Lang on Skull Rain 
  ::echo # 21 - Placeholder
  echo --------------------------------------------------
  set /p version="Enter Selection:"
  if %version%==0 (
  cls
  goto Extra
  )
  MODE 100,40
  
  
  if %version%==1 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377234 -manifest 7408437752633543455 -username %username% -remember-password -dir "Downloads\Y1S0_Vanilla" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's SChinese Lang on Vanilla
  goto mainmenu
  )
  if %version%==2 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377234 -manifest 695733873875406938 -username %username% -remember-password -dir "Downloads\Y1S1_Black_Ice" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's SChinese Lang on Black Ice 
  goto mainmenu
  )
  if %version%==3 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377234 -manifest 336078500685842996 -username %username% -remember-password -dir "Downloads\Y1S2_Dust_Line" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's SChinese Lang on Dust Line
  goto mainmenu
  )
  if %version%==4 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377234 -manifest 6056122284734366189 -username %username% -remember-password -dir "Downloads\Y1S3_Skull_Rain" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's SChinese Lang on Skull Rain
  goto mainmenu
  )
  if %version%==21 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377234 -manifest %manifest% -username %username% -remember-password -dir "Downloads\Placeholder" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's SChinese Lang on Placeholder
  goto mainmenu
  )
  goto Extra
::SChinese END



::Japanese START
:Japanese
  cls
  Title Rainbow Six Siege Japanese Lang Downloader
  MODE 54,38
  echo          Japanese Language Downloader
  echo         What would you like to select?
  echo ------------------------------------------------------
  echo # 0 - Back
  echo ------------------------------------------------------
  echo # 1 - Japanese Lang on Vanilla
  echo # 2 - Japanese Lang on Black Ice 
  echo # 3 - Japanese Lang on Dust Line 
  echo # 4 - Japanese Lang on Skull Rain 
  echo # 41 - Japanese Lang on Skull Rain (Zer0) -Same-
  echo # 5 - Japanese Lang on Red Crow 
  echo # 6 - Japanese Lang on Velvet Shell 
  echo # 7 - Japanese Lang on Health 
  echo # 71 - Japanese Lang on Health (Zer0) -Same-
  echo # 8 - Japanese Lang on Blood Orchid 
  echo # 81 - Japanese Lang on Blood Orchid (Zer0) -Same-
  echo # 9 - Japanese Lang on White Noise 
  echo # 91- Japanese Lang on White Noise (Zer0)
  echo # 10 - Japanese Lang on Chimera 
  echo # 11 - Japanese Lang on Para Bellum 
  echo # 12 - Japanese Lang on Grim Sky 
  echo # 121 - Japanese Lang on Grim Sky (Zer0) -Same-
  echo # 13 - Japanese Lang on Wind Bastion
  echo # 14 - Japanese Lang on Burnt Horizon 
  echo # 141 - Japanese Lang on Burnt Horizon (Zer0) -Same-
  echo # 15 - Japanese Lang on Phantom Sight 
  echo # 16 - Japanese Lang on Ember Rise 
  echo # 161 - Japanese Lang on Ember Rise (Zer0) -Same-
  echo # 17 - Japanese Lang on Shifting Tides 
  echo # 18 - Japanese Lang on Void Edge 
  echo # 181 - Japanese Lang on Void Edge (Zer0) -Same-
  echo # 19 - Japanese Lang on Steel Wave 
  echo # 191 - Japanese Lang on Steel Wave (Zer0) -Same-
  echo # 20 - Japanese Lang on Shadow Legacy 
  ::echo # 21 - Placeholder
  echo ------------------------------------------------------
  set /p version="Enter Selection:"
  if %version%==0 (
  cls
  goto Extra
  )
  MODE 100,40
  
  
  if %version%==1 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377235 -manifest 3426628477659109421 -username %username% -remember-password -dir "Downloads\Y1S0_Vanilla" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Japanese Lang on Vanilla
  goto mainmenu
  )
  if %version%==2 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377235 -manifest 7819798899236214261 -username %username% -remember-password -dir "Downloads\Y1S1_Black_Ice" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Japanese Lang on Black Ice 
  goto mainmenu
  )
  if %version%==3 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377235 -manifest 7164006373234658729 -username %username% -remember-password -dir "Downloads\Y1S2_Dust_Line" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Japanese Lang on Dust Line
  goto mainmenu
  )
  if %version%==4 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377235 -manifest 4940468394032132183 -username %username% -remember-password -dir "Downloads\Y1S3_Skull_Rain" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Japanese Lang on Skull Rain
  goto mainmenu
  )
  if %version%==41 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377235 -manifest 4940468394032132183 -username %username% -remember-password -dir "Downloads\Y1S3_SkullRain" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Japanese Lang on Skull Rain (Zer0)
  goto mainmenu
  )
  if %version%==5 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377235 -manifest 8573459241975382853 -username %username% -remember-password -dir "Downloads\Y1S4_Red_Crow" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Japanese Lang on Red Crow
  goto mainmenu
  )
  if %version%==6 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377235 -manifest 4595160401957962156 -username %username% -remember-password -dir "Downloads\Y2S1_Velvet_Shell" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Japanese Lang on Velvet Shell
  goto mainmenu
  )
  if %version%==7 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377235 -manifest 6208821339116662917 -username %username% -remember-password -dir "Downloads\Y2S2_Health" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Japanese Lang on Health
  goto mainmenu
  )
  if %version%==71 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377235 -manifest 6208821339116662917 -username %username% -remember-password -dir "Downloads\Y2S2_Health_2" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Japanese Lang on Health (Zer0)
  goto mainmenu
  )
  if %version%==8 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377235 -manifest 1573647791032056620 -username %username% -remember-password -dir "Downloads\Y2S3_Blood_Orchid" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Japanese Lang on Blood Orchid
  goto mainmenu
  )
  if %version%==81 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377235 -manifest 1573647791032056620 -username %username% -remember-password -dir "Downloads\Y2S3_BloodOrchid" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Japanese Lang on Blood Orchid (Zer0)
  goto mainmenu
  )
  if %version%==9 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377235 -manifest 4323914207757706720 -username %username% -remember-password -dir "Downloads\Y2S4_White_Noises" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Japanese Lang on White Noise
  goto mainmenu
  )
  if %version%==91 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377235 -manifest 7662200840621314199 -username %username% -remember-password -dir "Downloads\Y2S4_WhiteNoise" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Japanese Lang on White Noise (Zer0)
  goto mainmenu
  )
  if %version%==10 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377235 -manifest 8184994692095456862 -username %username% -remember-password -dir "Downloads\Y3S1_Chimera" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Japanese Lang on Chimera
  goto mainmenu
  )
  if %version%==11 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377235 -manifest 5702757960843346114 -username %username% -remember-password -dir "Downloads\Y3S2_Para_Bellum" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Japanese Lang on Para Bellum
  goto mainmenu
  )
  if %version%==12 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377235 -manifest 971478325336602905 -username %username% -remember-password -dir "Downloads\Y3S3_Grim_Sky" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Japanese Lang on Grim Sky
  goto mainmenu
  )
  if %version%==121 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377235 -manifest 971478325336602905 -username %username% -remember-password -dir "Downloads\Y3S3_GrimSky" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Japanese Lang on Grim Sky (Zer0)
  goto mainmenu
  )
  if %version%==13 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377235 -manifest 8026527283762710847 -username %username% -remember-password -dir "Downloads\Y3S4_Wind_Bastion" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Japanese Lang on Wind Bastion
  goto mainmenu
  )
  if %version%==14 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377235 -manifest 6205462284383635854 -username %username% -remember-password -dir "Downloads\Y4S1_Burnt_Horizon" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Japanese Lang on Burnt Horizon
  goto mainmenu
  )
  if %version%==141 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377235 -manifest 6205462284383635854 -username %username% -remember-password -dir "Downloads\Y4S1_BurntHorizon" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Japanese Lang on Burnt Horizon (Zer0)
  goto mainmenu
  )
  if %version%==15 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377235 -manifest 735237222551525964 -username %username% -remember-password -dir "Downloads\Y4S2_Phantom_Sight" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Japanese Lang on Phantom Sight 
  goto mainmenu
  )
  if %version%==16 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377235 -manifest 8453132699861289149 -username %username% -remember-password -dir "Downloads\Y4S3_Ember_Rise" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Japanese Lang on Ember Rise 
  goto mainmenu
  )
  if %version%==161 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377235 -manifest 8453132699861289149 -username %username% -remember-password -dir "Downloads\Y4S3_EmberRise" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Japanese Lang on Ember Rise (Zer0)
  goto mainmenu
  )
  if %version%==17 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377235 -manifest 4121849146546499241 -username %username% -remember-password -dir "Downloads\Y4S4_Shifting_Tides" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Japanese Lang on Shifting Tides 
  goto mainmenu
  )
  if %version%==18 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377235 -manifest 6728091120574045367 -username %username% -remember-password -dir "Downloads\Y5S1_Void_Edge" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Japanese Lang on Void Edge 
  goto mainmenu
  )
  if %version%==181 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377235 -manifest 6728091120574045367 -username %username% -remember-password -dir "Downloads\Y5S1_VoidEdge" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Japanese Lang on Void Edge (Zer0)
  goto mainmenu
  )
  if %version%==19 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377235 -manifest 5460615762069731497 -username %username% -remember-password -dir "Downloads\Y5S2_Steel_Wave" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Japanese Lang on Steel Wave 
  goto mainmenu
  )
  if %version%==191 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377235 -manifest 5460615762069731497 -username %username% -remember-password -dir "Downloads\Y5S2_SteelWave" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Japanese Lang on Steel Wave (Zer0)
  goto mainmenu
  )
  if %version%==20 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377235 -manifest 5904431813628700863 -username %username% -remember-password -dir "Downloads\Y5S3_Shadow_Legacy" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Japanese Lang on Shadow Legacy
  goto mainmenu
  )
  if %version%==21 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377235 -manifest %manifest% -username %username% -remember-password -dir "Downloads\Placeholder" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Japanese Lang on Placeholder
  goto mainmenu
  )
  goto Extra
::Japanese START


::Russian START
:Russian
  cls
  Title Rainbow Six Siege Russian Lang Downloader
  MODE 54,38
  echo          Russian Language Downloader
  echo         What would you like to select?
  echo ------------------------------------------------------
  echo # 0 - Back
  echo ------------------------------------------------------
  echo # 1 - Russian Lang on Vanilla
  echo # 2 - Russian Lang on Black Ice 
  echo # 3 - Russian Lang on Dust Line 
  echo # 4 - Russian Lang on Skull Rain 
  echo # 41 - Russian Lang on Skull Rain (Zer0) -Same-
  echo # 10 - Russian Lang on Chimera 
  echo # 11 - Russian Lang on Para Bellum 
  echo # 12 - Russian Lang on Grim Sky 
  echo # 121 - Russian Lang on Grim Sky (Zer0) -Same-
  echo # 13 - Russian Lang on Wind Bastion
  echo # 14 - Russian Lang on Burnt Horizon 
  echo # 141 - Russian Lang on Burnt Horizon (Zer0) -Same-
  echo # 15 - Russian Lang on Phantom Sight 
  echo # 16 - Russian Lang on Ember Rise 
  echo # 161 - Russian Lang on Ember Rise (Zer0) -Same-
  echo # 17 - Russian Lang on Shifting Tides 
  echo # 18 - Russian Lang on Void Edge 
  echo # 181 - Russian Lang on Void Edge (Zer0) -Same-
  echo # 19 - Russian Lang on Steel Wave 
  echo # 191 - Russian Lang on Steel Wave (Zer0) -Same-
  echo # 20 - Russian Lang on Shadow Legacy 
  ::echo # 21 - Placeholder
  echo ------------------------------------------------------
  set /p version="Enter Selection:"
  if %version%==0 (
  cls
  goto Extra
  )
  MODE 100,40
  

  if %version%==1 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377236 -manifest 4326401341058506434 -username %username% -remember-password -dir "Downloads\Y1S0_Vanilla" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Russian Lang on Vanilla
  goto mainmenu
  )
  if %version%==2 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377236 -manifest 7163789544030656935 -username %username% -remember-password -dir "Downloads\Y1S1_Black_Ice" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Russian Lang on Black Ice 
  goto mainmenu
  )
  if %version%==3 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377236 -manifest 4405345682991436059 -username %username% -remember-password -dir "Downloads\Y1S2_Dust_Line" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Russian Lang on Dust Line
  goto mainmenu
  )
  if %version%==4 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377236 -manifest 792795160700208918 -username %username% -remember-password -dir "Downloads\Y1S3_Skull_Rain" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Russian Lang on Skull Rain
  goto mainmenu
  )
  if %version%==41 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377236 -manifest 792795160700208918 -username %username% -remember-password -dir "Downloads\Y1S3_SkullRain" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Russian Lang on Skull Rain (Zer0)
  goto mainmenu
  )
  if %version%==10 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377236 -manifest 5994322749665877802 -username %username% -remember-password -dir "Downloads\Y3S1_Chimera" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Russian Lang on Chimera
  goto mainmenu
  )
  if %version%==11 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377236 -manifest 1607809513640548526 -username %username% -remember-password -dir "Downloads\Y3S2_Para_Bellum" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Russian Lang on Para Bellum
  goto mainmenu
  )
  if %version%==12 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377236 -manifest 3013637849914826120 -username %username% -remember-password -dir "Downloads\Y3S3_Grim_Sky" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Russian Lang on Grim Sky
  goto mainmenu
  )
  if %version%==121 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377236 -manifest 3013637849914826120 -username %username% -remember-password -dir "Downloads\Y3S3_GrimSky" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Russian Lang on Grim Sky (Zer0)
  goto mainmenu
  )
  if %version%==13 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377236 -manifest 8306800552570152557 -username %username% -remember-password -dir "Downloads\Y3S4_Wind_Bastion" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Russian Lang on Wind Bastion
  goto mainmenu
  )
  if %version%==14 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377236 -manifest 5305534200661405563 -username %username% -remember-password -dir "Downloads\Y4S1_Burnt_Horizon" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Russian Lang on Burnt Horizon
  goto mainmenu
  )
  if %version%==141 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377236 -manifest 5305534200661405563 -username %username% -remember-password -dir "Downloads\Y4S1_BurntHorizon" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Russian Lang on Burnt Horizon (Zer0)
  goto mainmenu
  )
  if %version%==15 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377236 -manifest 8063779007427415388 -username %username% -remember-password -dir "Downloads\Y4S2_Phantom_Sight" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Russian Lang on Phantom Sight 
  goto mainmenu
  )
  if %version%==16 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377236 -manifest 4195459193643803058 -username %username% -remember-password -dir "Downloads\Y4S3_Ember_Rise" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Russian Lang on Ember Rise 
  goto mainmenu
  )
  if %version%==161 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377236 -manifest 4195459193643803058 -username %username% -remember-password -dir "Downloads\Y4S3_EmberRise" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Russian Lang on Ember Rise (Zer0)
  goto mainmenu
  )
  if %version%==17 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377236 -manifest 2337212093593824035 -username %username% -remember-password -dir "Downloads\Y4S4_Shifting_Tides" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Russian Lang on Shifting Tides 
  goto mainmenu
  )
  if %version%==18 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377236 -manifest 3817096039931934373 -username %username% -remember-password -dir "Downloads\Y5S1_Void_Edge" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Russian Lang on Void Edge 
  goto mainmenu
  )
  if %version%==181 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377236 -manifest 3817096039931934373 -username %username% -remember-password -dir "Downloads\Y5S1_VoidEdge" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Russian Lang on Void Edge (Zer0)
  goto mainmenu
  )
  if %version%==19 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377236 -manifest 3790966697198053253 -username %username% -remember-password -dir "Downloads\Y5S2_Steel_Wave" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Russian Lang on Steel Wave 
  goto mainmenu
  )
  if %version%==191 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377236 -manifest 3790966697198053253 -username %username% -remember-password -dir "Downloads\Y5S2_SteelWave" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Russian Lang on Steel Wave (Zer0)
  goto mainmenu
  )
  if %version%==20 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377236 -manifest 5914186776656034602 -username %username% -remember-password -dir "Downloads\Y5S3_Shadow_Legacy" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Russian Lang on Shadow Legacy
  goto mainmenu
  )
  if %version%==21 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377236 -manifest %manifest% -username %username% -remember-password -dir "Downloads\Placeholder" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Russian Lang on Placeholder
  goto mainmenu
  )
  goto Extra
::Russian START



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
  echo # 81 = Health (Zer0 Manifest)
  echo # 9 = Blood Orchid (Y2S3_release)
  echo # 91 = Blood Orchid (2.3.1.1) X
  echo # 10 = White Noise (Y2S4_release)
  echo # 101= White Noise (Zer0 Manifest)
  echo # 11 = Chimera [(Y3S1_release)] X 
  echo # 12 = Para Bellum (Y3S2_release)
  echo # 13 = Grim Sky (Y3S3_release)
  echo # 131 = Grim Sky (Zer0 Manifest)
  echo # 14 = Wind Bastion (Y3S4_release)
  echo # 15 = Burnt Horizon (Y3S1_release)
  echo # 151 = Burnt Horizon (Zer0 Manifest)
  echo # 16 = Phantom Sight (Y4S2_release)
  echo # 17 = Ember Rise (Y4S3_release)
  echo # 171 = Ember Rise (Zer0 Manifest)
  echo # 18 = Shifting Tides (Y4S4_release)
  echo # 19 = Void Edge (Y5S1_release)
  echo # 191 = Void Edge (Zer0 Manifest)
  echo # 20 = Steel Wave (Y5S2_release)
  echo # 201 = Steel Wave (Zer0 Manifest)
  echo # 21 = Shadow Legacy (Y5S3_release)
  echo # 22 = Placeholder
  echo --------------------------------------------------
  echo Start Event:
  echo # 1399 = Mad House
  echo # 1599 = Rainbow is Magic
  echo # 1999 = The Grand Larceny
  echo # 2099 = M.U.T.E
  echo --------------------------------------------------
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
  
   
  if %downdxvc%==1 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 228990 -manifest 1829726630299308803 -username %username% -remember-password -dir "dxvcredist\DirectX" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's DirectX!
  goto mainmenu
  )
  if %downdxvc%==10 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 228983 -manifest 8124929965194586177 -username %username% -remember-password -dir "dxvcredist\VC_2010_Redist" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's VC 2010 Redist!
  goto mainmenu
  )
  if %downdxvc%==12 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 228984 -manifest 2547553897526095397 -username %username% -remember-password -dir "dxvcredist\VC_2012_Redist" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's VC 2012 Redist!
  goto mainmenu
  )
  if %downdxvc%==15 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 228986 -manifest 8782296191957114623 -username %username% -remember-password -dir "dxvcredist\VC_2015_Redist" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's VC 2015 Redist!
  goto mainmenu
  )
  if %downdxvc%==17 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 228987 -manifest 4302102680580581867 -username %username% -remember-password -dir "dxvcredist\VC_2017_Redist" -validate -max-servers 15 -max-downloads 10
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
  echo Thanks Zer0Byte the first version of MenuV and for can I forked his code!
  echo Thanks DepotDownloader creators!
  echo Thanks SteamDB!
  echo Thanks Markster for Plaza's!
  echo And thank you for using it!
  echo Thanks Ancientkingg for Log idea, DotNet Checker Second Version
  echo First Version: 2020 June 17
  echo Updated Version: 2020 TDB
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



exit
