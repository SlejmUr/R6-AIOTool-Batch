@shift /0
::
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
:: Updated by SlejmUr#4007
::

@echo off
setlocal enableextensions enabledelayedexpansion
set homepath=%cd%
set AllInOneVersion=DEV
set discord=discord.gg/EvrGzAV
Title STARTUP

::TIME SET START
:settime
  FOR /f "tokens=1-8 delims=/.:- " %%A in ("%date% %time%") DO (
  SET Month=%%B
  SET Day=%%C
  SET Year=%%D
  SET Hours=%%E
  SET Minutes=%%F
  SET Seconds=%%G
  SET All=%%B-%%C-%%D_%%E-%%F-%%G
  )
  goto logstart
::TIME SET END


::LOG start
:logstart
  echo.>>log.log
  echo %TIME% ^| INFO ^| Started %AllInOneVersion%>>log.log
  goto github
::LOG end

:logtolog
:: 
:: 1 = INFO
:: 2 = WARN
:: 3 = ERROR
::
  if %LogNumber%==1 (
    set LOGTYPE=INFO
  )
  if %LogNumber%==2 (
    set LOGTYPE=WARN
  )
  if %LogNumber%==3 (
    set LOGTYPE=ERROR
  )
  echo %TIME% ^| %LOGTYPE% ^| %LOGINFO%>>log.log
  goto %Position%

::Github Connect START
:github
  set Position=SiniCheck
  echo Loading...
  echo Please be patient ^^!

  ping github.com>nul
  if errorlevel 1 (
  set Position=MainMenu
  echo I cant connect to github, Continue at OW RISK^^!
  set LOGINFO=CANT connect Github
  set LogNumber=2
  pause
  goto logtolog
  ) 
  if errorlevel 0 (
  echo I can connect github, YEY^^!
  set LOGINFO=Can connect Github
  set LogNumber=1
  goto logtolog
  )
::Github Connect END



::Settings.ini get START
:SiniCheck
  MODE 62,50
  if exist "Resources\Settings.ini" (
    goto SiniSet
  ) else (
    mkdir Resources
    goto noSini
  )

:noSini
  set Position=moveS
  MODE 78,20
  echo ------------------------------------------------------------------------------
  echo                              Downloading Settings.ini...
  echo ------------------------------------------------------------------------------
  curl -L  "https://github.com/SlejmUr/R6-AIOTool/raw/master/Requirements/Settings.ini" --output Settings.ini
  set LOGINFO=Settings.ini Downloaded
  set LogNumber=1
  goto logtolog


:moveS
  set Position=SiniCheck
  move Settings.ini Resources
  set LOGINFO=Settings.ini Moved
  set LogNumber=1
  goto logtolog
::Settings.ini get END



::S:INI SET / Finder START
:SiniSet
  ::Checkers
  set Dotnet=1
  set zip=1
  set Depot=1
  set Plaza=1
  ::Sets
  set SteamName=1
  set DevVersion=0
  set Position=dotnetSET
  set LOGINFO=Settings.ini Set to Default Settings
  set LogNumber=1
  goto logtolog
::S:INI SET / Finder END

::SET Things START
:: SET CHECKERS START

::Set dotnet
:dotnetSET
  findstr /m "Dotnet=1" Resources\Settings.ini >Nul
  if %errorlevel%==0 (
  echo "Dotnet" set to 1
  set Dotnet=1
  )
  if %errorlevel%==1 (
  echo "Dotnet" set to 0
  set Dotnet=0
  )
  goto 7zipSET
::Set 7zip
:7zipSET
  findstr /m "zip=1" Resources\Settings.ini >Nul
  if %errorlevel%==0 (
  echo "zip" set to 1
  set zip=1
  )
  if %errorlevel%==1 (
  echo "zip" set to 0
  set zip=0
  )
  goto DepotSET
::Set Depot
:DepotSET
  findstr /m "Depot=1" Resources\Settings.ini >Nul
  if %errorlevel%==0 (
  echo "Depot" set to 1
  set Depot=1
  )
  if %errorlevel%==1 (
  echo "Depot" set to 0
  set Depot=0
  )
  goto PlazaSET
::Set Plaza
:PlazaSET
  findstr /m "Plaza=1" Resources\Settings.ini >Nul
  if %errorlevel%==0 (
  echo "Plaza" set to 1
  set Plaza=1
  )
  if %errorlevel%==1 (
  echo "Plaza" set to 0
  set Plaza=0
  )
  goto SteamSET
:: SET CHECKERS END

:: SET SET START
::Set Get SteamName
:SteamSET
  findstr /m "SteamName=1" Resources\Settings.ini >Nul
  if %errorlevel%==0 (
  echo "SteamName" set to 1
  set SteamName=1
  )
  if %errorlevel%==1 (
  echo "SteamName" set to 0
  set SteamName=0
  )
  goto DevVersionSET
::Set Dev Version
:DevVersionSET
  findstr /m "DevVersion=1" Resources\Settings.ini >Nul
  if %errorlevel%==0 (
  echo "DevVersion" set to 1
  set DevVersion=1
  )
  if %errorlevel%==1 (
  echo "DevVersion=1" set to 0
  set DevVersion=0
  )
  goto MateBypass
::matec bypass
:MateBypass
  if exist "C:\Users\matec\" (
  set DevVersion=1
  echo matec was found
  ) else (
  echo matec wasn't found
  )
  goto ifdotnet
:: SET SET END
::SET Things END



::Dotnet start
:ifdotnet
  if %Dotnet% == 1 (
  goto verifydotnet
  ) else (
  goto if7zip
  )
  goto ifdotnet

:verifydotnet
  set Position=checkertwo
  reg query "HKEY_LOCAL_MACHINE\SOFTWARE\dotnet\Setup\InstalledVersions\x64\sharedhost" /v Version 2>nul

  if errorlevel 1 (
  echo Oh no, registery editor not found dotnet
  set LOGINFO=Registery editor not found dotnet
  set LogNumber=2
  goto logtolog
  ) else (
  echo DotNet One checker is found the version
  set LOGINFO=Registery editor is found the dotnet
  set LogNumber=1
  goto logtolog
  )
  goto verifydotnet

:dotnet
  set Position=verifydotnet
  MODE 40,10
  echo ---------------------------------------
  echo       Install .NET Runtime ^^!
  echo ---------------------------------------
  start www.tinyurl.com/dotnetruntimer6
  pause
  set LOGINFO=Install .NET Runtime
  set LogNumber=3
  goto logtolog

:checkertwo
  set Position=if7zip
  if exist "C:\Program Files\dotnet\dotnet.exe" (
  echo DotNet Two checker is found the version
  set LOGINFO=Exist checker is found the version
  set LogNumber=1
  goto logtolog
  ) else (
  set Position=dotnet
  echo Oh no, exist checker not found dotnet
  set LOGINFO=Exist checker not found dotnet
  set LogNumber=2
  goto logtolog
  )
  goto checkertwo
::dotnet end


::7zip start
:if7zip
  if %zip%==1 (
  goto 7zipcheck
  ) else (
  goto ifDD
  )
  goto if7zip

:7zipcheck
  MODE 62,50
  if exist "Resources\7z.exe" (
    goto ifDD
  ) else (
    mkdir Resources
    goto no7zip
  )
  goto 7zipcheck

:no7zip
  set Position=7zipcheck
  cls
  MODE 78,20
  echo ------------------------------------------------------------------------------
  echo                              Downloading 7-Zip...
  echo ------------------------------------------------------------------------------
  curl -L  "https://github.com/DataCluster0/R6TBBatchTool/raw/master/Requirements/7z.exe" --output 7z.exe
  cls
  move 7z.exe Resources
  set LOGINFO=7zip Successfully Downloaded and Moved
  set LogNumber=1
  goto logtolog
::7zip end


::DD start
:ifDD
  if %zip%==1 (
  goto DepotCheck
  ) else (
  goto ifPlaza
  )
  goto ifDD


:DepotCheck
  if exist "Resources\DepotDownloader\DepotDownloader.dll" (
    goto ifPlaza 
  ) else (
    goto DepotDownloader
  )

:DepotDownloader
  set Position=extractDD
  cls
  MODE 78,20
  echo ------------------------------------------------------------------------------
  echo                        Downloading DepotDownloader...
  echo ------------------------------------------------------------------------------
  curl -L  "https://github.com/SteamRE/DepotDownloader/releases/download/DepotDownloader_2.3.6/depotdownloader-2.3.6.zip" --output depot.zip
  cls
  set LOGINFO=DepotDownloader Successfully Downloaded
  set LogNumber=1
  goto logtolog

:extractDD
  set Position=DepotCheck
  for %%I in ("depot.zip") do (
    echo extractDD
    "Resources\7z.exe" x -y -o"Resources\DepotDownloader" "%%I" && del %%I
    cls
    set LOGINFO=DepotDownloader Successfully extracted
    set LogNumber=1
    goto logtolog
  )
  goto extractDD
::DD end

::Plaza Start
:ifPlaza
  if %zip%==1 (
  goto PlazaCheck
  ) else (
  goto cmdCheck
  )
  goto ifPlaza

:PlazaCheck
  cls
  if exist "Resources\Plazas\PLAZA_BO\CODEX.ini" (
    goto cmdCheck 
  ) else (
    goto GetPlaza
  )
  goto PlazaCheck

:GetPlaza
  set Position=extractPlaza
  cls
  MODE 78,20
  echo ------------------------------------------------------------------------------
  echo                        Downloading Plazas...
  echo ------------------------------------------------------------------------------
  curl -L  "https://cdn.discordapp.com/attachments/722089860755881996/743466352475635832/Plazas.zip" --output plazas.zip
  cls
  set LOGINFO=Plazas Successfully Downloaded
  set LogNumber=1
  goto logtolog

:extractPlaza
  set Position=PlazaCheck
  for %%I in ("plazas.zip") do (
  echo extractPlaza
  "Resources\7z.exe" x -y -o"Resources\" "%%I" && del %%I
  cls
  set LOGINFO=Plazas Successfully extracted
  set LogNumber=1
  goto logtolog
  )
  goto extractPlaza
::Plaza End



::cmdmenusel START
:cmdCheck
  cls
  if exist "Resources\cmdmenusel.exe" (
    goto ifSteam 
  ) else (
    goto GetCmd
  )
  goto cmdCheck

:GetCmd
  set Position=cmdCheck
  cls
  MODE 78,20
  echo ------------------------------------------------------------------------------
  echo                        Downloading cmdmenusel...
  echo ------------------------------------------------------------------------------
  curl -L  "https://github.com/SlejmUr/R6-AIOTool/raw/master/Requirements/cmdmenusel.exe" --output cmdmenusel.exe
  cls
  move cmdmenusel.exe Resources
  set LOGINFO=cmdmenusel Successfully Downloaded and Moved
  set LogNumber=1
  goto logtolog
::cmdmenusel END



::SetSteam START
:ifSteam
  if %SteamName%==1 (
  goto SetSteam
  ) else (
  set username=matecraft1111
  goto MainMenu
  )
  goto ifSteam

:SetSteam
  set Position=MainMenu
  MODE 78,20
  echo Please type your Steam Legacy name!
  set /p username="Enter Steam Username:"
  cls
  set "LOGINFO=Steam Legacy Name (Username) set to %username%"
  set LogNumber=1
  goto logtolog
::SetSteam END



::MainMenu START
:MainMenu
  cls
  Title R6S AllInOne Tool
  MODE 62,30
  set LastSelector=MainMenu
  echo [93m----------------------------NOTES-----------------------------[0m
  echo  Rainbow Six Siege AllInOne Tool
  echo  [31mYou MUST have a copy of Siege on Steam to use the downloader^^![0m
  echo  This tools is forked from [91mZer0Bytes[0m manifest tool
  echo  Our Discord Server: [94m%discord%[0m 
  echo  AIO Tool Version: [32m%AllInOneVersion%[0m 
  echo  Steam User: [96m%username%[0m
  echo  Read FAQ!
  echo [93m----------------------------SELECT----------------------------[0m
  Resources\cmdmenusel f830 "  FAQ and Notes" "  Game Menu" "  Extra Language" "  4K Textures" "  DirectX and VC Redist Downloader" "  Credits" "  BattlEye Checker" "  Change Steam Username" "  Old Logs Delete" "  Zer0 folder Renamer" "  Update" "  Exit"
  
  if %ERRORLEVEL% == 1 (
  echo FAQ Chosen>>log.log
  cls
  goto faq
  )
  if %ERRORLEVEL% == 2 (
  echo GameMenu Chosen>>log.log
  cls
  goto GameMenu
  )
  if %ERRORLEVEL% == 3 (
  echo Extra Menu Chosen>>log.log
  cls
  goto Extra
  )
  if %ERRORLEVEL% == 4 (
  echo TextureMenu Chosen>>log.log
  cls
  goto TextureMenu
  )
  if %ERRORLEVEL% == 5 (
  echo dxvcredist Chosen>>log.log
  cls
  goto dxvcredist
  )
  if %ERRORLEVEL% == 6 (
  echo Credit Chosen>>log.log
  cls
  goto Credit
  )
  if %ERRORLEVEL% == 7 (
  echo BattlEyeChecker Chosen>>log.log
  cls
  goto BattlEyeChecker
  )
  if %ERRORLEVEL% == 8 (
  echo Changing Steam UserName - %TIME%>>log.log
  cls
  set /p username="Enter Steam Username:"
  goto MainMenu
  )
  if %ERRORLEVEL% == 9 (
  echo Logs Delete Chosen>>log.log
  cls
  del log.log
  rd /s /q  "logs\" 2>nul
  echo Logs Deleted^^!
  pause
  set Position=MainMenu
  set LOGTYPE=2
  set LOGINFO=Full log deleted
  goto logtolog
  )
  if %ERRORLEVEL% == 10 (
  echo Zer0 folder Renamer Chosen>>log.log
  cls
  goto ZeroFolderRenamer
  )
  if %ERRORLEVEL%==11 (
  echo Update Chosen>>log.log
  cls
  goto Update
  )
  if %ERRORLEVEL% == 12 (
  set Position=exitng
  set LOGTYPE=1
  set LOGINFO=Exited
  goto logtolog
  )
  goto MainMenu
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
  echo  Once you have a version downloaded grab the PLAZA's below and copy its contents to your game folder.
  echo  When it asks to overwrite a few files click yes. If your anti-virus blocks these files then make sure to allow them. 
  echo  9
  echo  What is CODEX, DepotDownloader,R6Manifest?
  echo  CODEX/Plaza : Applied to play Old Siege Version
  echo  R6Downloader : Download R6 Old Version, it use DepotDownloader. Created by Shey
  echo  DepotDownloader : Created by SteamRE, you can download any manifest once you have the game
  echo  R6-AIOTool : AllInOne Tool, many function. Based on R6 Manifest. Created by SlejmUr
  echo  R6 Manifest : Download R6 Old Version, it use DepotDownloader. Created by Zer0Bytes
  echo FAQ readed>>log.log
  pause
  cls
  goto Notes
::and
:Notes
  Title Notes
  MODE 110,20
  echo  Notes:
  echo  I Moved my "Release" manifests to Manifest Options
  echo  I did not tested all manifests^^!
  echo  Planning to add Extra Language option in Events
  echo  Plaza_NEW not working on Shadow Legacy and Steel Wave too^^!
  echo  If you want to join testing phase, DM me on Discord
  echo  If you have a problem this tool, DM me on Discord
  echo  My Discord: SlejmUr#4007 or join on %discord%
  echo Notes Readed - %TIME%>>log.log
  pause
  cls
  goto MainMenu
::FAQ and notes END



::GameMenu START
:GameMenu
  cls
  Title R6:S GameMenu
  MODE 34,10
  echo GameMenu Loaded>>log.log
  echo [93m---------------NOTES--------------[0m
  echo     Rainbow Six Siege Game Menu
  echo       Install/Uninstall/Start
  echo [93m--------------SELECT--------------[0m 
  Resources\cmdmenusel f8f0 "    Install Rainbow Six Siege" "   Uninstall Rainbow Six Siege" "   Starting Rainbow Six Siege" "              Back"

  if %ERRORLEVEL% == 1 (
  echo InstallMenu Chosen>>log.log
  cls
  goto InstallMenu
  )
  if %ERRORLEVEL% == 2 (
  echo UninstallMenu Chosen>>log.log
  cls
  goto UninstallMenu
  )
  if %ERRORLEVEL% == 3 (
  echo StartGame Chosen>>log.log
  cls
  goto StartGame
  )
  if %ERRORLEVEL% == 4 (
  echo Back - %TIME%>>log.log
  cls
  goto MainMenu
  )
  goto GameMenu
::GameMenu END



::InstallMenu START
:InstallMenu
  cls
  Title Rainbow Six Siege InstallMenu
  MODE 50,14
  echo InstallMenu Loaded>>log.log
  set LastSelector=InstallMenu
  echo [93m-----------------------NOTES----------------------[0m
  echo                   Install Selector
  echo          [31mExtra/4K now is unstable ^^![0m
  echo [93m----------------------SELECT----------------------[0m
  Resources\cmdmenusel f8f0 "   Version Downloader" "   Event Downloader" "   Release Downloader" "   Custom Downloader" "   4K Textures Downloader" "   Extra Language Downloader" "   Back"

  if %ERRORLEVEL% == 1 (
  echo VersionMenu Chosen>>log.log
  cls
  goto VersionMenu
  )
  if %ERRORLEVEL% == 2 (
  echo EventMenu Chosen>>log.log
  cls
  goto EventMenu
  )
  if %ERRORLEVEL% == 3 (
  echo ReleaseMenu Chosen>>log.log
  cls
  goto ReleaseMenu
  )
  if %ERRORLEVEL% == 4 (
  echo CustomMenu Chosen>>log.log
  cls
  goto CustomMenu
  )
  if %ERRORLEVEL% == 5 (
  echo TextureMenu Chosen>>log.log
  cls
  goto TextureMenu
  )
  if %ERRORLEVEL% == 6 (
  echo Extra Chosen>>log.log
  cls
  goto Extra
  )
  if %ERRORLEVEL% == 7 (
  echo Back - %TIME%>>log.log
  cls
  goto GameMenu
  )
  goto InstallMenu
::InstallMenu END


::VersionMenu START
:VersionMenu
  cls
  Title Rainbow Six Siege VersionMenu
  MODE 50,30
  echo VersionMenu Loaded>>log.log
  echo [93m-----------------------NOTES----------------------[0m
  echo                   Version Selector
  echo      Manifests is from Zer0Bytes Manifest tool
  echo [93m----------------------SELECT----------------------[0m
  Resources\cmdmenusel f8f0 "   Vanilla" "   Black Ice" "   Dust Line" "   Skull Rain" "   Red Crow" "   Velvet Shell" "   Health" "   Blood Orchid" "   White Noise" "   Chimera" "   Para Bellum" "   Grim Sky" "   Wind Bastion" "   Burnt Horizon" "   Phantom Sight" "   Ember Rise" "   Shifting Tides" "   Void Edge" "   Steel Wave [Mute]" "   Steel Wave [Omega/Mute]" "   Back"

  if %ERRORLEVEL%==1 (
  :Vanilla
  MODE 100,40
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 8358812283631269928 -username %username% -remember-password -dir "R6Downloads\Y1S0_Vanilla" -validate -max-servers 15 -max-downloads 10
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 3893422760579204530 -username %username% -remember-password -dir "R6Downloads\Y1S0_Vanilla" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete^^!
  echo It's Vanilla
  echo Vanilla Chosen>>log.log
  goto InstallMenu
  )
  if %ERRORLEVEL%==2 (
  :BlackIce
  MODE 100,40
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 5188997148801516344 -username %username% -remember-password -dir "R6Downloads\Y1S1_Black_Ice" -validate -max-servers 15 -max-downloads 10
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 7932785808040895147 -username %username% -remember-password -dir "R6Downloads\Y1S1_Black_Ice" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete^^!
  echo It's BLACK ICE Released
  echo BLACK ICE Chosen>>log.log
  goto InstallMenu
  )
  if %ERRORLEVEL%==3 (
  :DustLine
  MODE 100,40
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 2303064029242396590 -username %username% -remember-password -dir "R6Downloads\Y1S2_Dust_Line" -validate -max-servers 15 -max-downloads 10
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 2206497318678061176 -username %username% -remember-password -dir "R6Downloads\Y1S2_Dust_Line" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete^^!
  echo It's DUST LINE Released
  echo DUST LINE Chosen>>log.log
  goto InstallMenu
  )
  if %ERRORLEVEL%==4 (
  :SkullRainZero
  MODE 100,40
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 5819137024728546741 -username %username% -remember-password -dir "R6Downloads\Y1S3_SkullRain" -validate -max-servers 15 -max-downloads 10
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 5851804596427790505 -username %username% -remember-password -dir "R6Downloads\Y1S3_SkullRain" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete Thanks Zer0 ^^!
  echo Skull Rain 4.2
  echo Skull Rain 4.2 Chosen>>log.log
  goto InstallMenu
  )
  if %ERRORLEVEL%==5 (
  :RedCrow
  MODE 100,40
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 3576607363557872807 -username %username% -remember-password -dir "R6Downloads\Y1S4_Red_Crow" -validate -max-servers 15 -max-downloads 10
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 8569920171217002292 -username %username% -remember-password -dir "R6Downloads\Y1S4_Red_Crow" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete^^!
  echo It's RED CROW Released^^!
  echo RED CROW Chosen>>log.log
  goto InstallMenu
  )
  if %ERRORLEVEL%==6 (
  :VelvetShell
  MODE 100,40
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 2248734317261478192 -username %username% -remember-password -dir "R6Downloads\Y2S1_Velvet_Shell" -validate -max-servers 15 -max-downloads 10
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 8006071763917433748 -username %username% -remember-password -dir "R6Downloads\Y2S1_Velvet_Shell" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete^^!
  echo It's VELVET SHELL Released^^!
  echo VELVET SHELL Chosen>>log.log
  goto InstallMenu
  )
  if %ERRORLEVEL%==7 (
  :HealthZero
  MODE 100,40
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 5875987479498297665 -username %username% -remember-password -dir "R6Downloads\Y2S2_Health_2" -validate -max-servers 15 -max-downloads 10
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 708773000306432190 -username %username% -remember-password -dir "R6Downloads\Y2S2_Health_2" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete Thanks Zer0 ^^!
  echo Health [Zer0]
  echo Health [Zer0] Chosen>>log.log
  goto InstallMenu
  )
  if %ERRORLEVEL%==8 (
  :BloodOrchidZero
  MODE 100,40
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 6708129824495912434 -username %username% -remember-password -dir "R6Downloads\Y2S3_BloodOrchid" -validate -max-servers 15 -max-downloads 10
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 1613631671988840841 -username %username% -remember-password -dir "R6Downloads\Y2S3_BloodOrchid" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete Thanks Zer0 ^^!
  echo Blood Orchid 2.3.1.1
  echo Blood Orchid 2.3.1.1 [Zer0] Chosen>>log.log
  goto InstallMenu
  )
  if %ERRORLEVEL%==9 (
  :WhiteNoiseZero
  MODE 100,40
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 8748734086032257441 -username %username% -remember-password -dir "R6Downloads\Y2S4_WhiteNoise" -validate -max-servers 15 -max-downloads 10
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 4221297486420648079 -username %username% -remember-password -dir "R6Downloads\Y2S4_WhiteNoise" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete Thanks Zer0 ^^!
  echo WHITE NOISE [Zer0] 
  echo WHITE NOISE [Zer0] Chosen>>log.log
  goto InstallMenu
  )
  if %ERRORLEVEL%==10 (
  :Chimera
  MODE 100,40
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 5071357104726974256 -username %username% -remember-password -dir "R6Downloads\Y3S1_Chimera" -validate -max-servers 15 -max-downloads 10
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 4701787239566783972 -username %username% -remember-password -dir "R6Downloads\Y3S1_Chimera" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete^^!
  echo It's CHIMERA  Released^^!
  echo CHIMERA Chosen>>log.log
  goto InstallMenu
  )
  if %ERRORLEVEL%==11 (
  :ParaBellum
  MODE 100,40
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 8312108283310615233 -username %username% -remember-password -dir "R6Downloads\Y3S2_Para_Bellum" -validate -max-servers 15 -max-downloads 10
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 8765715607275074515 -username %username% -remember-password -dir "R6Downloads\Y3S2_Para_Bellum" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete^^!
  echo It's PARA BELLUM Released^^!
  echo PARA BELLUM Chosen>>log.log
  goto InstallMenu
  )
  if %ERRORLEVEL%==12 (
  :MadHouse
  MODE 100,40
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 5562094852451837435 -username %username% -remember-password -dir "R6Downloads\Y3S3_MadHouse" -validate -max-servers 15 -max-downloads 10
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 7781202564071310413 -username %username% -remember-password -dir "R6Downloads\Y3S3_MadHouse" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete Thanks Zer0 ^^!
  echo GRIM SKY [Zer0] / Mad House
  echo GRIM SKY [Zer0] / Mad House Chosen>>log.log
  goto InstallMenu
  )
  if %ERRORLEVEL%==13 (
  :WindBastion
  MODE 100,40
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 6502258854032233436 -username %username% -remember-password -dir "R6Downloads\Y3S4_Wind_Bastion" -validate -max-servers 15 -max-downloads 10
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 7659555540733025386 -username %username% -remember-password -dir "R6Downloads\Y3S4_Wind_Bastion" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete ^^!
  echo It's WIND BASTION Released
  echo WIND BASTION [v12512571] Chosen>>log.log
  goto InstallMenu
  )
  if %ERRORLEVEL%==14 (
  :RainbowIsMagic
  MODE 100,40
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 8356277316976403078 -username %username% -remember-password -dir "R6Downloads\Y4S1_RainbowIsMagic" -validate -max-servers 15 -max-downloads 10
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 5935578581006804383 -username %username% -remember-password -dir "R6Downloads\Y4S1_RainbowIsMagic" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete Thanks Zer0 ^^!
  echo BURNT HORIZON [Zer0] / Rainbow Is Magic
  echo BURNT HORIZON [Zer0] / Rainbow Is Magic Chosen>>log.log
  goto InstallMenu
  )
  if %ERRORLEVEL%==15 (
  :PhantomSight
  MODE 100,40
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 693082837425613508 -username %username% -remember-password -dir "R6Downloads\Y4S2_Phantom_Sight" -validate -max-servers 15 -max-downloads 10
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 5408324128694463720 -username %username% -remember-password -dir "R6Downloads\Y4S2_Phantom_Sight" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete^^!
  echo PHANTOM SIGHT Released / Showdown
  echo PHANTOM SIGHT / Showdown Chosen>>log.log
  goto InstallMenu
  )
  if %ERRORLEVEL%==16 (
  :DoktorsCurse
  MODE 100,40
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 3546781236735558235 -username %username% -remember-password -dir "R6Downloads\Y4S3_DoktorsCurse" -validate -max-servers 15 -max-downloads 10
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 7869081741739849703 -username %username% -remember-password -dir "R6Downloads\Y4S3_DoktorsCurse" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete Thanks Zer0 ^^!
  echo EMBER RISE [Zer0] / Doctors Curse Chosen>>log.log
  goto InstallMenu
  )
  if %ERRORLEVEL%==17 (
  :ShiftingTides
  MODE 100,40
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 299124516841461614 -username %username% -remember-password -dir "R6Downloads\Y4S4_Shifting_Tides" -validate -max-servers 20 -max-downloads 15
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 1842268638395240106 -username %username% -remember-password -dir "R6Downloads\Y4S4_Shifting_Tides" -validate -max-servers 20 -max-downloads 15
  pause
  cls
  echo Download complete^^!
  echo It's SHIFTING TIDES Released^^!
  echo SHIFTING TIDES Chosen>>log.log
  goto InstallMenu
  )
  if %ERRORLEVEL%==18 (
  :GangDestruction
  MODE 100,40
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 1378283477131353042 -username %username% -remember-password -dir "R6Downloads\Y5S1_GangDestruction" -validate -max-servers 15 -max-downloads 10
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 1739364586766771991 -username %username% -remember-password -dir "R6Downloads\Y5S1_GangDestruction" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete Thanks Zer0 ^^!
  echo Void Edge [Zer0] / Gang Destruction Chosen>>log.log
  goto InstallMenu
  )
  ::steel wave Y5S2.3.0_C5433707_D1028748_S38774_14603060 (Mute Protocol)
  if %ERRORLEVEL%==19 (
  :MUTEProtocol
  MODE 100,40
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 2287849678928593252 -username %username% -remember-password -dir "R6Downloads\Y5S2_MUTE" -validate -max-servers 15 -max-downloads 10
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 1610834739284564851 -username %username% -remember-password -dir "R6Downloads\Y5S2_MUTE" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete Thanks Zer0 ^^!
  echo [v14603060] steel wave [Mute Protocol]
  echo [v14603060] steel wave [Mute Protocol] Chosen>>log.log
  goto InstallMenu
  )
  ::SteelWave (omega/Mute Protocol)
  if %ERRORLEVEL%==20 (
  :OmegaSteelWave
  MODE 100,40
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 4367817844736324940 -username %username% -remember-password -dir "R6Downloads\Y5S2_SteelWave" -validate -max-servers 15 -max-downloads 10
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 893971391196952070 -username %username% -remember-password -dir "R6Downloads\Y5S2_SteelWave" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete Thanks Zer0 ^^!
  echo [v14664131] SteelWave [omega/Mute Protocol]
  echo [v14664131] SteelWave [omega/Mute Protocol] Chosen>>log.log
  goto InstallMenu
  )
  if %ERRORLEVEL% == 21 (
  echo Back - %TIME%>>log.log
  cls
  goto InstallMenu
  )
  goto VersionMenu
::VersionMenu END


::ReleaseMenu START
:ReleaseMenu
  cls
  Title Rainbow Six Siege ReleaseMenu
  MODE 50,30
  echo ReleaseMenu Loaded>>log.log
  echo [93m-----------------------NOTES----------------------[0m
  echo                   Release Selector
  echo      Only new, released version of game build
  echo [93m----------------------SELECT----------------------[0m
  Resources\cmdmenusel f8f0 "   Vanilla" "   Black Ice" "   Dust Line" "   Skull Rain" "   Red Crow" "   Velvet Shell" "   Health" "   Blood Orchid" "   White Noise" "   Chimera" "   Para Bellum" "   Grim Sky" "   Wind Bastion" "   Burnt Horizon" "   Phantom Sight" "   Ember Rise" "   Shifting Tides" "   Void Edge" "   Steel Wave" "   Shadow Legacy" "   Neon Dawn" "   Back"

  if %ERRORLEVEL%==1 (
  goto Vanilla
  )
  if %ERRORLEVEL%==2 (
  goto BlackIce
  )
  if %ERRORLEVEL%==3 (
  goto DustLine
  )
  if %ERRORLEVEL%==4 (
  :SkullRain
  MODE 100,40
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 3552784069501585540 -username %username% -remember-password -dir "R6Downloads\Y1S3_Skull_Rain" -validate -max-servers 15 -max-downloads 10
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 6528040263176897081 -username %username% -remember-password -dir "R6Downloads\Y1S3_Skull_Rain" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete^^!
  echo It's SKULL RAIN Released
  echo SKULL RAIN Chosen>>log.log
  goto InstallMenu
  )
  if %ERRORLEVEL%==5 (
  goto RedCrow
  )
  if %ERRORLEVEL%==6 (
  goto VelvetShell
  )
  if %ERRORLEVEL%==7 (
  :Health
  MODE 100,40
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 2786501509753402970 -username %username% -remember-password -dir "R6Downloads\Y2S2_Health" -validate -max-servers 15 -max-downloads 10
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 2332919753188284154 -username %username% -remember-password -dir "R6Downloads\Y2S2_Health" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete^^!
  echo It's Health Released^^!
  echo Health Chosen>>log.log
  goto InstallMenu
  )
  if %ERRORLEVEL%==8 (
  :BloodOrchid
  MODE 100,40
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 8948840210977117778 -username %username% -remember-password -dir "R6Downloads\Y2S3_Blood_Orchid" -validate -max-servers 15 -max-downloads 10
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 2410147212125863824 -username %username% -remember-password -dir "R6Downloads\Y2S3_Blood_Orchid" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete^^!
  echo It's BLOOD ORCHID Released^^!
  echo BLOOD ORCHID Chosen>>log.log
  goto InstallMenu
  )
  if %ERRORLEVEL%==9 (
  :WhiteNoise
  MODE 100,40
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 2066250193950057921 -username %username% -remember-password -dir "R6Downloads\Y2S4_White_Noise" -validate -max-servers 15 -max-downloads 10
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 2783803489764777627 -username %username% -remember-password -dir "R6Downloads\Y2S4_White_Noise" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete^^!
  echo It's WHITE NOISE  Released^^!
  echo WHITE NOISE Chosen>>log.log
  goto InstallMenu
  )
  if %ERRORLEVEL%==10 (
  goto Chimera
  )
  if %ERRORLEVEL%==11 (
  goto ParaBellum
  )
  if %ERRORLEVEL%==12 (
  :GrimSky
  MODE 100,40
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 7286067994760020542 -username %username% -remember-password -dir "R6Downloads\Y3S3_Grim_Sky" -validate -max-servers 15 -max-downloads 10
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 4133951394045241747 -username %username% -remember-password -dir "R6Downloads\Y3S3_Grim_Sky" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete^^!
  echo It's GRIM SKY Released^^!
  echo GRIM SKY Chosen>>log.log
  goto InstallMenu
  )
  if %ERRORLEVEL%==13 (
  goto WindBastion
  )
  if %ERRORLEVEL%==14 (
  :BurntHorizon
  MODE 100,40
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 8985694971177711792 -username %username% -remember-password -dir "R6Downloads\Y4S1_Burnt_Horizon" -validate -max-servers 15 -max-downloads 10
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 4355229858723790756 -username %username% -remember-password -dir "R6Downloads\Y4S1_Burnt_Horizon" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete^^!
  echo It's BURNT HORIZON Released^^!
  echo BURNT HORIZON Chosen>>log.log
  goto InstallMenu
  )
  if %ERRORLEVEL%==15 (
  goto PhantomSight
  )
  if %ERRORLEVEL%==16 (
  :EmberRise
  MODE 100,40
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 7309481042294838052 -username %username% -remember-password -dir "R6Downloads\Y4S3_Ember_Rise" -validate -max-servers 15 -max-downloads 10
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 5429930338066808153 -username %username% -remember-password -dir "R6Downloads\Y4S3_Ember_Rise" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete^^!
  echo It's EMBER RISE Released^^!
  echo EMBER RISE Chosen>>log.log
  goto InstallMenu
  )
  if %ERRORLEVEL%==17 (
  goto ShiftingTides
  )
  if %ERRORLEVEL%==18 (
  :VoidEdge
  MODE 100,40
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 8007091753837589034 -username %username% -remember-password -dir "R6Downloads\Y5S1_Void_Edge" -validate -max-servers 15 -max-downloads 10
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 2810676266503656332 -username %username% -remember-password -dir "R6Downloads\Y5S1_Void_Edge" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete^^!
  echo It's VOID EDGE Released^^!
  echo VOID EDGE Chosen>>log.log
  goto InstallMenu
  )
  if %ERRORLEVEL%==19 (
  :SteelWave
  MODE 100,40
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 7032500641931923367 -username %username% -remember-password -dir "R6Downloads\Y5S2_Steel_Wave" -validate -max-servers 15 -max-downloads 10
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 8083217055977195199 -username %username% -remember-password -dir "R6Downloads\Y5S2_Steel_Wave" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete^^!
  echo It's STEEL WAVE Released^^!
  echo STEEL WAVE Chosen>>log.log
  goto InstallMenu
  )
  if %ERRORLEVEL%==20 (
  :ShadowLegacy
  MODE 100,40
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 885453180592640750 -username %username% -remember-password -dir "R6Downloads\Y5S3_Shadow_Legacy" -validate -max-servers 15 -max-downloads 10
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 7750070106878890861 -username %username% -remember-password -dir "R6Downloads\Y5S3_Shadow_Legacy" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete^^!
  echo It's Shadow Legacy Released^^!
  echo Shadow Legacy Chosen>>log.log
  goto InstallMenu
  )
  if %ERRORLEVEL%==21 (
  :NeonDawn
  MODE 100,40
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 752517632960395491 -username %username% -remember-password -dir "R6Downloads\Y5S4_Neon_Dawn" -validate -max-servers 15 -max-downloads 10
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 7979405601806736439 -username %username% -remember-password -dir "R6Downloads\Y5S4_Neon_Dawn" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete^^!
  echo It's Neon Dawn Released^^!
  echo Neon Dawn Chosen>>log.log
  goto InstallMenu
  )
  if %ERRORLEVEL% == 22 (
  echo Back - %TIME%>>log.log
  cls
  goto InstallMenu
  )
  goto ReleaseMenu
::ReleaseMenu END


::EventMenu START
:EventMenu
  cls
  Title Rainbow Six Siege Event Downloader
  MODE 52,25
  echo EventMenu Loaded>>log.log
  echo [93m-----------------------NOTES------------------------[0m
  echo   Outback is same with normal Chimera
  echo   Road To S.I. is same with normal Shifting Tides
  echo   Showdown is same with normal Phantom Sight
  echo   The Omega Mute is not broken, use that.
  echo [93m-----------------------SELECT-----------------------[0m
  Resources\cmdmenusel f8f0 "   Outback" "   Mad House" "   Rainbow is Magic" "   Showdown" "   Doctors Curse" "   Road To S.I. 2020" "   Gang Destruction / Golden Gun" "   M.U.T.E Protocol (Not support Omega)" "   M.U.T.E Protocol (Supported Omega)" "   Sugar Fright / Telly" "   Back"
  
  if %ERRORLEVEL%==1 (
  goto Chimera
  )
  if %ERRORLEVEL%==2 (
  goto MadHouse
  )
  if %ERRORLEVEL%==3 (
  goto RainbowIsMagic
  )
  if %ERRORLEVEL%==4 (
  goto PhantomSight
  )
  if %ERRORLEVEL%==5 (
  goto DoktorsCurse
  )
  if %ERRORLEVEL%==6 (
  goto ShiftingTides
  )
  if %ERRORLEVEL%==7 (
  goto GangDestruction
  )
  if %ERRORLEVEL%==8 (
  goto MUTEProtocol
  )
  if %ERRORLEVEL%==9 (
  goto OmegaSteelWave
  )
  if %ERRORLEVEL%==10 (
  :SugarFright
  MODE 100,40
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 3265954110064157115 -username %username% -remember-password -dir "R6Downloads\Y5S3_Sugar_Fright" -validate -max-servers 15 -max-downloads 10
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 5436378897406471956 -username %username% -remember-password -dir "R6Downloads\Y5S3_Sugar_Fright" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete 
  echo Sugar Fright / Telly
  echo Sugar Fright / Telly Chosen>>log.log
  goto InstallMenu
  )
  if %ERRORLEVEL% == 11 (
  echo Back - %TIME%>>log.log
  cls
  goto InstallMenu
  )
  goto EventMenu
::EventMenu END


::CustomMenu START
:CustomMenu
  cls
  Title Rainbow Six Siege CustomMenu
  MODE 50,20
  echo CustomMenu Loaded>>log.log
  echo [93m-----------------------NOTES----------------------[0m
  echo                   Custom Selector
  echo            You need set everything ^^!
  echo [93m----------------------SELECT----------------------[0m
  Resources\cmdmenusel f8f0 "   Set Default things" "   Set App" "   Set Depot" "   Set Manifest" "   Set Path/Dir" "   Start Download" "   Back"
  
  if %ERRORLEVEL% == 1 (
  echo Custom Setting Default - %TIME%>>log.log
  cls
  set AppID=359550
  set CustomDir="R6Downloads/%ALL%"
  echo Successfully set default things^^!
  echo You still need to set ManifestID and DepotID ^^!
  pause
  goto CustomMenu
  )
  if %ERRORLEVEL% == 2 (
  :CustomAppID
  echo Custom Setting AppID - %TIME%>>log.log
  cls
  echo Siege AppID Is : 359550
  set /p AppID="Enter AppID: "
  goto CustomMenu
  )
  if %ERRORLEVEL% == 3 (
  :CustomDepotID
  echo Custom Setting DepotID - %TIME%>>log.log
  cls
  echo Use Valid DepotID ^^!
  set /p DepotID="Enter DepotID: "
  goto CustomMenu
  )
  if %ERRORLEVEL% == 4 (
  :CustomManifestID
  echo Custom Setting ManifestID - %TIME%>>log.log
  cls
  echo Use Valid ManifestID ^^!
  set /p ManifestID="Enter ManifestID: "
  goto CustomMenu
  )
  if %ERRORLEVEL% == 5 (
  :CustomDir
  echo Custom Setting CustomDir - %TIME%>>log.log
  cls
  echo Set Custom Directory
  echo Like this: ^"DirNane/Path^"
  set /p CustomDir="Enter CustomDir: "
  goto CustomMenu
  )
  if %ERRORLEVEL% == 6 (
  MODE 100,40
  cls
  if [%AppID%]==[] (
    echo AppID is empty, please set it^^!
    echo AppID is empty>>log.log
    pause
    goto CustomAppID
  )
  if [%DepotID%]==[] (
    echo DepotID is empty, please set it^^!
    echo DepotID is empty>>log.log
    pause
    goto CustomDepotID
  )
  if [%ManifestID%]==[] (
    echo ManifestID is empty, please set it^^!
    echo ManifestID is empty>>log.log
    pause
    goto CustomManifestID
  )
  if [%CustomDir%]==[] (
    echo CustomDir is empty, please set it^^!
    echo CustomDir is empty>>log.log
    pause
    goto CustomDir
  )
  echo Custom Manifest %AppID% %DepotID% %ManifestID% Downloading on %CustomDir% - %TIME%>>log.log
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app %AppID% -depot %DepotID% -manifest %ManifestID% -username %username% -remember-password -dir %CustomDir% -validate -max-servers 15 -max-downloads 10
  echo Custom: %AppID% %DepotID% %ManifestID% Downloaded on %CustomDir%
  pause
  goto CustomMenu
  )
  if %ERRORLEVEL% == 7 (
  echo Back - %TIME%>>log.log
  cls
  goto InstallMenu
  )
  goto CustomMenu
::CustomMenu END


::TextureMenu START
:TextureMenu
  cls
  Title Rainbow Six Siege 4K Textures Downloader
  MODE 50,10
  echo TextureMenu Loaded >>log.log
  echo [93m----------------------NOTES-----------------------[0m
  echo                   4K Textures Selector
  echo   Insert note here 
  echo [93m----------------------SELECT----------------------[0m
  Resources\cmdmenusel f8f0 "   4k Release" "   4k Version" "   4k Event" "   Back"

  if %ERRORLEVEL% == 1 (
  echo 4kRelease Chosen>>log.log
  cls
  goto 4kRelease
  )
  if %ERRORLEVEL% == 2 (
  echo 4kVersion Chosen>>log.log
  cls
  goto 4kVersion
  )
  if %ERRORLEVEL% == 3 (
  echo 4kEvent Chosen>>log.log
  cls
  goto 4kEvent
  )
  if %ERRORLEVEL% == 4 (
  cls
    if %LastSelector% == MainMenu (
      echo Back to %LastSelector% - %TIME%>>log.log
      cls
      goto MainMenu
    ) else (
      echo Back - %TIME%>>log.log
      cls
      goto InstallMenu
    )
  )
  goto TextureMenu
::TextureMenu END

::4kVersion START
:4kVersion
  cls
  Title Rainbow Six Siege 4K Version Downloader
  MODE 50,38
  echo 4kRelease Loaded >>log.log
  echo [93m----------------------NOTES-----------------------[0m
  echo   Health, White Noise, Void Edge, Vanilla, etc...
  echo   Stuff is same with in R6Manifest / 4kRelease
  echo [93m----------------------SELECT----------------------[0m
  Resources\cmdmenusel f8f0 "   Vanilla" "   Black Ice" "   Dust Line" "   Skull Rain" "   Red Crow" "   Velvet Shell" "   Health" "   Blood Orchid" "   White Noise" "   Chimera" "   Para Bellum" "   Grim Sky" "   Wind Bastion" "   Burnt Horizon" "   Phantom Sight" "   Ember Rise" "   Shifting Tides" "   Void Edge" "   Steel Wave [Mute]" "   Back"

  if %ERRORLEVEL%==1 (
  :Vanilla4k
  MODE 100,40
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377239 -manifest 8394183851197739981 -username %username% -remember-password -dir "R6Downloads\Y1S0_Vanilla" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete^^!
  echo It's Vanilla 4K^^!
  echo Vanilla 4k Chosen>>log.log
  goto InstallMenu
  )
  if %ERRORLEVEL%==2 (
  :BlackIce4k
  MODE 100,40
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377239 -manifest 3756048967966286899 -username %username% -remember-password -dir "R6Downloads\Y1S1_Black_Ice" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete^^!
  echo It's Black Ice 4K^^!
  echo BlackIce 4k Chosen>>log.log
  goto InstallMenu
  )
  if %ERRORLEVEL%==3 (
  :DustLine4k
  MODE 100,40
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377239 -manifest 1338949402410764888 -username %username% -remember-password -dir "R6Downloads\Y1S2_Dust_Line" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete^^!
  echo It's Dust Line 4K^^!
  echo Dust Line 4k Chosen>>log.log
  goto InstallMenu
  )
  if %ERRORLEVEL%==4 (
  :SkullRain4kZero
  MODE 100,40
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377239 -manifest 3267970968757091405 -username %username% -remember-password -dir "R6Downloads\Y1S3_SkullRain" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete Thanks Zer0 ^^!
  echo Skull Rain 4k [Zero] Chosen>>log.log
  goto InstallMenu
  )
  if %ERRORLEVEL%==5 (
  :RedCrow4k
  MODE 100,40
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377239 -manifest 1825939060444887403 -username %username% -remember-password -dir "R6Downloads\Y1S4_Red_Crow" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete^^!
  echo It's Red Crow 4K^^!
  echo Red Crow 4k Chosen>>log.log
  goto InstallMenu
  )
  if %ERRORLEVEL%==6 (
  :VelvetShell4k
  MODE 100,40
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377239 -manifest 3196596628759979362 -username %username% -remember-password -dir "R6Downloads\Y2S1_Velvet_Shell" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete^^!
  echo It's Velvet Shell 4K^^!
  echo Velvet Shell 4k Chosen>>log.log
  goto InstallMenu
  )
  if %ERRORLEVEL%==7 (
  :Health4kZero
  MODE 100,40
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377239 -manifest 7497579858536910279 -username %username% -remember-password -dir "R6Downloads\Y2S2_Health_2" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete Thanks Zer0 ^^!
  echo Health 4k [Zero] Chosen>>log.log
  goto InstallMenu
  )
  if %ERRORLEVEL%==8 (
  :BloodOrchid4kZero
  MODE 100,40
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377239 -manifest 6420469519659049757 -username %username% -remember-password -dir "R6Downloads\Y2S3_BloodOrchid" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete Thanks Zer0 ^^!
  echo Blood Orchid 4k [Zero] Chosen>>log.log
  goto InstallMenu
  )
  if %ERRORLEVEL%==9 (
  :WhiteNoise4kZero
  MODE 100,40
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377239 -manifest 959656357428794421 -username %username% -remember-password -dir "R6Downloads\Y2S4_WhiteNoise" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete Thanks Zer0 ^^!
  echo White Noise 4k [Zero] Chosen>>log.log
  goto InstallMenu
  )
  if %ERRORLEVEL%==10 (
  :Chimera4k
  MODE 100,40
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377239 -manifest 1668513364192382097 -username %username% -remember-password -dir "R6Downloads\Y3S1_Chimera" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete^^!
  echo Chimera / Outback 4K
  echo Chimera / Outback 4K Chosen>>log.log
  goto InstallMenu
  )
  if %ERRORLEVEL%==11 (
  :ParaBellum4k
  MODE 100,40
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377239 -manifest 204186978012641075 -username %username% -remember-password -dir "R6Downloads\Y3S2_Para_Bellum" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete^^!
  echo It's Para Bellum 4K^^!
  echo ParaBellum4k Chosen>>log.log
  goto InstallMenu
  )
  if %ERRORLEVEL%==12 (
  :MadHouse4k
  MODE 100,40
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377239 -manifest 6431001239225997495 -username %username% -remember-password -dir "R6Downloads\Y3S3_MadHouse" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete Thanks Zer0 ^^!
  echo MadHouse 4k
  echo MadHouse 4k Chosen>>log.log
  goto InstallMenu
  )
  if %ERRORLEVEL%==13 (
  :WindBastion4k
  MODE 100,40
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377239 -manifest 2243348760021617592 -username %username% -remember-password -dir "R6Downloads\Y3S4_Wind_Bastion" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete^^!
  echo It's Wind Bastion 4K^^!
  echo Wind Bastion 4k Chosen>>log.log
  goto InstallMenu
  )
  if %ERRORLEVEL%==14 (
  :RainbowIsMagic4k
  MODE 100,40
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377239 -manifest 3462709886432904855 -username %username% -remember-password -dir "R6Downloads\Y4S1_RainbowIsMagic" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete Thanks Zer0 ^^!
  echo Rainbow Is Magic 4k
  echo Rainbow Is Magic 4k Chosen>>log.log
  goto InstallMenu
  )
  if %ERRORLEVEL%==15 (
  :PhantomSight4k
  MODE 100,40
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377239 -manifest 4107080515154236795 -username %username% -remember-password -dir "R6Downloads\Y4S2_Phantom_Sight" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete ^^!
  echo It's Phantom Sight 4K ^^!
  echo Phantom Sight 4K Chosen>>log.log
  goto InstallMenu
  )
  if %ERRORLEVEL%==16 (
  :DoktorsCurse4k
  MODE 100,40
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377239 -manifest 4319184561394137009 -username %username% -remember-password -dir "R6Downloads\Y4S3_DoktorsCurse" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete Thanks Zer0 ^^!
  echo Doktors Curse 4k 
  echo Doktors Curse 4k Chosen>>log.log
  goto InstallMenu
  )
  if %ERRORLEVEL%==17 (
  :ShiftingTides4k
  MODE 100,40
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377239 -manifest 6048763664997452513 -username %username% -remember-password -dir "R6Downloads\Y4S4_Shifting_Tides" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete^^!
  echo It's Shifting Tides 4K^^!
  echo Shifting Tides / Road To S.I. 4K 
  echo Shifting Tides / Road To S.I. 4K Chosen>>log.log
  goto InstallMenu
  )
  if %ERRORLEVEL%==18 (
  :GangDestruction4k
  MODE 100,40
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377239 -manifest 1775661942779524815 -username %username% -remember-password -dir "R6Downloads\Y5S1_GangDestruction" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete Thanks Zer0 ^^!
  echo Gang Destruction 4k
  echo Gang Destruction 4k Chosen>>log.log
  goto InstallMenu
  )
  if %ERRORLEVEL%==19 (
  :MUTEProtocol4k
  MODE 100,40
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377239 -manifest 1430519549301269175 -username %username% -remember-password -dir "R6Downloads\Y5S2_MUTE" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete Thanks Zer0 ^^!
  echo MUTE Protocol 4k
  echo MUTE Protocol 4k Chosen>>log.log
  goto InstallMenu
  )
  if %ERRORLEVEL% == 20 (
  echo Back - %TIME%>>log.log
  cls
  goto GameMenu
  )
  4kVersion
::4kVersion END

::4kRelease START
:4kRelease
  cls
  Title Rainbow Six Siege 4K Release Downloader
  MODE 50,38
  echo 4kRelease Loaded >>log.log
  echo [93m----------------------NOTES-----------------------[0m
  echo   Health, White Noise, Void Edge, Vanilla, etc...
  echo   Stuff is same with in R6Manifest / 4kVersion
  echo [93m----------------------SELECT----------------------[0m
  Resources\cmdmenusel f8f0 "   Vanilla" "   Black Ice" "   Dust Line" "   Skull Rain" "   Red Crow" "   Velvet Shell" "   Health" "   Blood Orchid" "   White Noise" "   Chimera" "   Para Bellum" "   Grim Sky" "   Wind Bastion" "   Burnt Horizon" "   Phantom Sight" "   Ember Rise" "   Shifting Tides" "   Void Edge" "   Steel Wave" "   Shadow Legacy" "   Neon Dawn" "   Back"

  if %ERRORLEVEL%==1 (
  goto Vanilla4k
  )
  if %ERRORLEVEL%==2 (
  goto BlackIce4k
  )
  if %ERRORLEVEL%==3 (
  goto DustLine4k
  )
  if %ERRORLEVEL%==4 (
  :SkullRain4k
  MODE 100,40
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377239 -manifest 5184390432533910806 -username %username% -remember-password -dir "R6Downloads\Y1S3_Skull_Rain" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete^^!
  echo It's Skull Rain 4K^^!
  echo Skull Rain 4K Chosen>>log.log
  goto InstallMenu
  )
  if %ERRORLEVEL%==5 (
  goto RedCrow4k
  )
  if %ERRORLEVEL%==6 (
  goto VelvetShell4k
  )
  if %ERRORLEVEL%==7 (
  :Health4k
  MODE 100,40
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377239 -manifest 7497579858536910279 -username %username% -remember-password -dir "R6Downloads\Y2S2_Health" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete^^!
  echo It's Health 4K^^!
  echo Health 4K Chosen>>log.log
  goto InstallMenu
  )
  if %ERRORLEVEL%==8 (
  :BloodOrchid4k
  MODE 100,40
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377239 -manifest 3065193946575458487 -username %username% -remember-password -dir "R6Downloads\Y2S3_Blood_Orchid" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete^^!
  echo It's Blood Orchid 4K^^!
  echo Blood Orchid 4K Chosen>>log.log
  goto InstallMenu
  )
  if %ERRORLEVEL%==9 (
  :WhiteNoise4k
  MODE 100,40
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377239 -manifest 1118649577165385479 -username %username% -remember-password -dir "R6Downloads\Y2S4_White_Noise" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete^^!
  echo It's White Noise 4K^^!
  echo White Noise 4K Chosen>>log.log
  goto InstallMenu
  )
  if %ERRORLEVEL%==10 (
  goto Chimera4k
  )
  if %ERRORLEVEL%==11 (
  goto ParaBellum4k
  )
  if %ERRORLEVEL%==12 (
  :GrimSky4k
  MODE 100,40
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377239 -manifest 3378966402050009606 -username %username% -remember-password -dir "R6Downloads\Y3S3_Grim_Sky" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete^^!
  echo It's Grim Sky 4K^^!
  echo Grim Sky 4K Chosen>>log.log
  goto InstallMenu
  )

  if %ERRORLEVEL%==13 (
  goto WindBastion4k
  )
  if %ERRORLEVEL%==14 (
  :BurntHorizon4k
  MODE 100,40
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377239 -manifest 888629411354320742 -username %username% -remember-password -dir "R6Downloads\Y4S1_Burnt_Horizon" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete^^!
  echo It's Burnt Horizon 4K^^!
  echo Burnt Horizon 4K Chosen>>log.log
  goto InstallMenu
  )
  if %ERRORLEVEL%==15 (
  goto PhantomSight4k
  )
  if %ERRORLEVEL%==16 (
  :EmberRise4k
  MODE 100,40
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377239 -manifest 8340682081776225833 -username %username% -remember-password -dir "R6Downloads\Y4S3_Ember_Rise" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete^^!
  echo It's Ember Rise 4K^^!
  echo Ember Rise 4K Chosen>>log.log
  goto InstallMenu
  )
  if %ERRORLEVEL%==17 (
  goto ShiftingTides4k
  )
  if %ERRORLEVEL%==18 (
  :VoidEdge4k
  MODE 100,40
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377239 -manifest 2194493692563107142 -username %username% -remember-password -dir "R6Downloads\Y5S1_Void_Edge" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete^^!
  echo It's Void Edge 4K^^!
  echo Void Edge 4K Chosen>>log.log
  goto InstallMenu
  )
  if %ERRORLEVEL%==19 (
  :SteelWave4k
  MODE 100,40
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377239 -manifest 3257522596542046976 -username %username% -remember-password -dir "R6Downloads\Y5S2_Steel_Wave" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete^^!
  echo It's Steel Wave 4K^^!
  echo Steel Wave 4K Chosen>>log.log
  goto InstallMenu
  )
  if %ERRORLEVEL%==20 (
  :ShadowLegacy4k
  MODE 100,40
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377239 -manifest 5051396185388503167 -username %username% -remember-password -dir "R6Downloads\Y5S3_Shadow_Legacy" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete^^!
  echo It's Shadow Legacy 4K^^!
  echo Shadow Legacy 4K Chosen>>log.log
  goto InstallMenus
  )
  if %ERRORLEVEL%==21 (
  :NeonDawn4k
  MODE 100,40
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377239 -manifest 7681923351308243133 -username %username% -remember-password -dir "R6Downloads\Y5S4_Neon_Dawn" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete^^!
  echo It's Neon Dawn 4K^^!
  echo Neon Dawn 4K Chosen>>log.log
  goto InstallMenus
  )
  if %ERRORLEVEL% == 22 (
  echo Back - %TIME%>>log.log
  cls
  goto TextureMenu
  )
  goto 4kRelease
::4kRelease END

::4kEvent START
:4kEvent
  cls
  Title Rainbow Six Siege 4K Event Downloader
  MODE 50,38
  echo 4kRelease Loaded >>log.log
  echo [93m----------------------NOTES-----------------------[0m
  echo   Outback is same with normal Chimera
  echo   Road To S.I. is same with normal Shifting Tides
  echo   Showdown is same with Phantom Sight
  echo [93m----------------------SELECT----------------------[0m
  Resources\cmdmenusel f8f0 "   Outback" "   Mad House" "   Rainbow is Magic" "   Showdown" "   Doktors Curse" "   Road To S.I. 2020" "   The Grand Larceny / Golden Gun" "   M.U.T.E Protocol (Support Omega)" "   Sugar Fright / Telly" "   Back"
  
  if %ERRORLEVEL%==1 (
  goto Chimera4k
  )
  if %ERRORLEVEL%==2 (
  goto MadHouse4k
  )
  if %ERRORLEVEL%==3 (
  goto RainbowIsMagic4k
  )
  if %ERRORLEVEL%==4 (
  goto PhantomSight4k
  )
  if %ERRORLEVEL%==5 (
  goto DoktorsCurse4k

  )
  if %ERRORLEVEL%==6 (
  goto ShiftingTides4k
  )
  if %ERRORLEVEL%==7 (
  goto GangDestruction4k
  )
  if %ERRORLEVEL%==8 (
  goto MUTEProtocol4k
  )
  if %ERRORLEVEL%==9 (
  :SugarFright4k
  MODE 100,40
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377239 -manifest 3569318872166878802 -username %username% -remember-password -dir "R6Downloads\Y5S3_Sugar_Fright" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete^^!
  echo It's Sugar Fright / Telly 4K^^!
  echo Sugar Fright / Telly 4K Chosen>>log.log
  goto InstallMenu
  )
  if %ERRORLEVEL% == 10 (
  echo Back - %TIME%>>log.log
  cls
  goto GameMenu
  )
  4kEvent
::4kEvent END



::UninstallMenu START
:UninstallMenu
  Title Rainbow Six Siege UninstallMenu
  echo UninstallMenu Loaded>>log.log
  MODE 50,40
  echo [93m-----------------------NOTES----------------------[0m
  echo                   Uninstall Menu
  echo    Please select the correct downloaded folder.
  echo [93m----------------------SELECT----------------------[0m
  Resources\cmdmenusel f8f0 "   Y1S0_Vanilla"    "   Y1S1_Black_Ice"    "   Y1S2_Dust_Line"    "   Y1S3_Skull_Rain"    "   Y1S3_SkullRain"    "   Y1S4_Red_Crow"    "   Y2S1_Velvet_Shell"    "   Y2S2_Health"    "   Y2S2_Health_2"    "   Y2S3_Blood_Orchid"    "   Y2S3_BloodOrchid"    "   Y2S4_White_Noise"    "   Y2S4_WhiteNoise"    "   Y3S1_Chimera"    "   Y3S2_Para_Bellum"    "   Y3S3_Grim_Sky"    "   Y3S3_MadHouse"    "   Y3S4_Wind_Bastion"    "   Y4S1_Burnt_Horizon"    "   Y4S1_RainbowIsMagic"    "   Y4S2_Phantom_Sight"    "   Y4S3_Ember_Rise"    "   Y4S3_DoktorsCurse"    "   Y4S4_Shifting_Tides"    "   Y5S1_Void_Edge"    "   Y5S1_GangDestruction"    "   Y5S2_Steel_Wave"    "   Y5S2_MUTE"    "   Y5S2_SteelWave"    "   Y5S3_Shadow_Legacy"    "   Y5S3_Sugar_Fright" "   Y5S4_Neon_Dawn"   "   Back"

  if %ERRORLEVEL%==1 (
  set DeleteDir="R6Downloads\Y1S0_Vanilla"
  goto DeleteFolder
  )
  if %ERRORLEVEL%==2 (
  set DeleteDir="R6Downloads\Y1S1_Black_Ice"
  goto DeleteFolder
  )
  if %ERRORLEVEL%==3 (
  set DeleteDir="R6Downloads\Y1S2_Dust_Line"
  goto DeleteFolder
  )
  if %ERRORLEVEL%==4 (
  set DeleteDir="R6Downloads\Y1S3_Skull_Rain"
  goto DeleteFolder
  )
  if %ERRORLEVEL%==5 (
  set DeleteDir="R6Downloads\Y1S3_SkullRain"
  goto DeleteFolder
  )
  if %ERRORLEVEL%==6 (
  set DeleteDir="R6Downloads\Y1S4_Red_Crow"
  goto DeleteFolder
  )
  if %ERRORLEVEL%==7 (
  set DeleteDir="R6Downloads\Y2S1_Velvet_Shell"
  goto DeleteFolder
  )
  if %ERRORLEVEL%==8 (
  set DeleteDir="R6Downloads\Y2S2_Health"
  goto DeleteFolder
  )
  if %ERRORLEVEL%==9 (
  set DeleteDir="R6Downloads\Y2S2_Health_2"
  goto DeleteFolder
  )
  if %ERRORLEVEL%==10 (
  set DeleteDir="R6Downloads\Y2S3_Blood_Orchid"
  goto DeleteFolder
  )
  if %ERRORLEVEL%==11 (
  set DeleteDir="R6Downloads\Y2S3_BloodOrchid"
  goto DeleteFolder
  )
  if %ERRORLEVEL%==12 (
  set DeleteDir="R6Downloads\Y2S4_White_Noise"
  goto DeleteFolder
  )
  if %ERRORLEVEL%==13 (
  set DeleteDir="R6Downloads\Y2S4_WhiteNoise"
  goto DeleteFolder
  )
  if %ERRORLEVEL%==14 (
  set DeleteDir="R6Downloads\Y3S1_Chimera"
  goto DeleteFolder
  )
  if %ERRORLEVEL%==15 (
  set DeleteDir="R6Downloads\Y3S2_Para_Bellum"
  goto DeleteFolder
  )
  if %ERRORLEVEL%==16 (
  set DeleteDir="R6Downloads\Y3S3_Grim_Sky"
  goto DeleteFolder
  )
  if %ERRORLEVEL%==17 (
  set DeleteDir="R6Downloads\Y3S3_MadHouse"
  goto DeleteFolder
  )
  if %ERRORLEVEL%==18 (
  set DeleteDir="R6Downloads\Y3S4_Wind_Bastion"
  goto DeleteFolder
  )
  if %ERRORLEVEL%==19 (
  set DeleteDir="R6Downloads\Y4S1_Burnt_Horizon"
  goto DeleteFolder
  )
  if %ERRORLEVEL%==20 (
  set DeleteDir="R6Downloads\Y4S1_RainbowIsMagic"
  goto DeleteFolder
  )
  if %ERRORLEVEL%==21 (
  set DeleteDir="R6Downloads\Y4S2_Phantom_Sight"
  goto DeleteFolder
  )
  if %ERRORLEVEL%==22 (
  set DeleteDir="R6Downloads\Y4S3_Ember_Rise"
  goto DeleteFolder
  )
  if %ERRORLEVEL%==23 (
  set DeleteDir="R6Downloads\Y4S3_DoktorsCurse"
  goto DeleteFolder
  )
  if %ERRORLEVEL%==24 (
  set DeleteDir="R6Downloads\Y4S4_Shifting_Tides"
  goto DeleteFolder
  )
  if %ERRORLEVEL%==25 (
  set DeleteDir="R6Downloads\Y5S1_Void_Edge"
  goto DeleteFolder
  )
  if %ERRORLEVEL%==26 (
  set DeleteDir="R6Downloads\Y5S1_GangDestruction"
  goto DeleteFolder
  )
  if %ERRORLEVEL%==27 (
  set DeleteDir="R6Downloads\Y5S2_Steel_Wave"
  goto DeleteFolder
  )
  if %ERRORLEVEL%==28 (
  set DeleteDir="R6Downloads\Y5S2_MUTE"
  goto DeleteFolder
  )
  if %ERRORLEVEL%==29 (
  set DeleteDir="R6Downloads\Y5S2_SteelWave"
  goto DeleteFolder
  )
  if %ERRORLEVEL%==30 (
  set DeleteDir="R6Downloads\Y5S3_Shadow_Legacy"
  goto DeleteFolder
  )
  if %ERRORLEVEL%==31 (
  set DeleteDir="R6Downloads\Y5S3_Sugar_Fright"
  goto DeleteFolder
  )
  if %ERRORLEVEL%==32 (
  set DeleteDir="R6Downloads\Y5S4_Neon_Dawn"
  goto DeleteFolder
  )
  if %ERRORLEVEL%==33 (
  echo Back - %TIME%>>log.log
  cls
  goto GameMenu
  )
  goto UninstallMenu
::UninstallMenu END

::DeleteFolder START
  :DeleteFolder
  MODE 60,20
  cls
  echo %DeleteDir% Chosen [U]>>log.log
  rd /s /q %DeleteDir% 2>nul || echo Error^^!
  if errorlevel 2 (
    echo Selected folder doesn^'t exist.>>log.log
    echo Make sure you^'ve selected the correct download folder.
    pause
    goto UninstallMenu
    )
  if errorlevel 0 (
    echo Waiting to fully delete the folder.
    timeout /t 4 >nul 
    echo %DeleteDir% deleted [U]>>log.log
    echo Folder deleted^^!
    pause
    goto GameMenu
  )
::DeleteFolder END



::FULL STARTGAME START
::StartGame START
:StartGame
  Title Rainbow Six Siege Game Starter
  echo StartGame Loaded>>log.log
  MODE 50,40
  echo [93m-----------------------NOTES----------------------[0m
  echo                   Game Starter
  echo    Please select the correct downloaded folder.
  echo [93m----------------------SELECT----------------------[0m
  Resources\cmdmenusel f8f0 "   Y1S0_Vanilla"    "   Y1S1_Black_Ice"    "   Y1S2_Dust_Line"    "   Y1S3_Skull_Rain"    "   Y1S3_SkullRain"    "   Y1S4_Red_Crow"    "   Y2S1_Velvet_Shell"    "   Y2S2_Health"    "   Y2S2_Health_2"    "   Y2S3_Blood_Orchid"    "   Y2S3_BloodOrchid"    "   Y2S4_White_Noise"    "   Y2S4_WhiteNoise"    "   Y3S1_Chimera"    "   Y3S2_Para_Bellum"    "   Y3S3_Grim_Sky"    "   Y3S3_MadHouse"    "   Y3S4_Wind_Bastion"    "   Y4S1_Burnt_Horizon"    "   Y4S1_RainbowIsMagic"    "   Y4S2_Phantom_Sight"    "   Y4S3_Ember_Rise"    "   Y4S3_DoktorsCurse"    "   Y4S4_Shifting_Tides"    "   Y5S1_Void_Edge"    "   Y5S1_GangDestruction"    "   Y5S2_Steel_Wave"    "   Y5S2_MUTE"    "   Y5S2_SteelWave"    "   Y5S3_Shadow_Legacy"    "   Y5S3_Sugar_Fright"   "   Y5S4_Neon_Dawn"   "   Back"

  if %ERRORLEVEL%==1 (
  set StartDir=R6Downloads\Y1S0_Vanilla
  goto StartFolder
  )
  if %ERRORLEVEL%==2 (
  set StartDir=R6Downloads\Y1S1_Black_Ice
  goto StartFolder
  )
  if %ERRORLEVEL%==3 (
  set StartDir=R6Downloads\Y1S2_Dust_Line
  goto StartFolder
  )
  if %ERRORLEVEL%==4 (
  set StartDir=R6Downloads\Y1S3_Skull_Rain
  goto StartFolder
  )
  if %ERRORLEVEL%==5 (
  set StartDir=R6Downloads\Y1S3_SkullRain
  goto StartFolder
  )
  if %ERRORLEVEL%==6 (
  set StartDir=R6Downloads\Y1S4_Red_Crow
  goto StartFolder
  )
  if %ERRORLEVEL%==7 (
  set StartDir=R6Downloads\Y2S1_Velvet_Shell
  goto StartFolder
  )
  if %ERRORLEVEL%==8 (
  set StartDir=R6Downloads\Y2S2_Health
  goto StartFolder
  )
  if %ERRORLEVEL%==9 (
  set StartDir=R6Downloads\Y2S2_Health_2
  goto StartFolder
  )
  if %ERRORLEVEL%==10 (
  set StartDir=R6Downloads\Y2S3_Blood_Orchid
  goto StartFolder
  )
  if %ERRORLEVEL%==11 (
  set StartDir=R6Downloads\Y2S3_BloodOrchid
  goto StartFolder
  )
  if %ERRORLEVEL%==12 (
  set StartDir=R6Downloads\Y2S4_White_Noise
  goto StartFolder
  )
  if %ERRORLEVEL%==13 (
  set StartDir=R6Downloads\Y2S4_WhiteNoise
  goto StartFolder
  )
  if %ERRORLEVEL%==14 (
  set StartDir=R6Downloads\Y3S1_Chimera
  goto StartFolder
  )
  if %ERRORLEVEL%==15 (
  set StartDir=R6Downloads\Y3S2_Para_Bellum
  goto StartFolder
  )
  if %ERRORLEVEL%==16 (
  set StartDir=R6Downloads\Y3S3_Grim_Sky
  goto StartFolder
  )
  if %ERRORLEVEL%==17 (
  set StartDir=R6Downloads\Y3S3_MadHouse
  goto StartFolder
  )
  if %ERRORLEVEL%==18 (
  set StartDir=R6Downloads\Y3S4_Wind_Bastion
  goto StartFolder
  )
  if %ERRORLEVEL%==19 (
  set StartDir=R6Downloads\Y4S1_Burnt_Horizon
  goto StartFolder
  )
  if %ERRORLEVEL%==20 (
  set StartDir=R6Downloads\Y4S1_RainbowIsMagic
  goto StartFolder
  )
  if %ERRORLEVEL%==21 (
  set StartDir=R6Downloads\Y4S2_Phantom_Sight
  goto StartFolder
  )
  if %ERRORLEVEL%==22 (
  set StartDir=R6Downloads\Y4S3_Ember_Rise
  goto StartFolder
  )
  if %ERRORLEVEL%==23 (
  set StartDir=R6Downloads\Y4S3_DoktorsCurse
  goto StartFolder
  )
  if %ERRORLEVEL%==24 (
  set StartDir=R6Downloads\Y4S4_Shifting_Tides
  goto StartFolder
  )
  if %ERRORLEVEL%==25 (
  set StartDir=R6Downloads\Y5S1_Void_Edge
  goto StartFolder
  )
  if %ERRORLEVEL%==26 (
  set StartDir=R6Downloads\Y5S1_GangDestruction
  goto StartFolder
  )
  if %ERRORLEVEL%==27 (
  set StartDir=R6Downloads\Y5S2_Steel_Wave
  goto StartFolder
  )
  if %ERRORLEVEL%==28 (
  set StartDir=R6Downloads\Y5S2_MUTE
  goto StartFolder
  )
  if %ERRORLEVEL%==29 (
  set StartDir=R6Downloads\Y5S2_SteelWave
  goto StartFolder
  )
  if %ERRORLEVEL%==30 (
  set StartDir=R6Downloads\Y5S3_Shadow_Legacy
  goto StartFolder
  )
  if %ERRORLEVEL%==31 (
  set StartDir=R6Downloads\Y5S3_Sugar_Fright
  goto StartFolder
  )
  if %ERRORLEVEL%==32 (
  set StartDir=R6Downloads\Y5S4_Neon_Dawn
  goto StartFolder
  )
  if %ERRORLEVEL%==33 (
  echo Back - %TIME%>>log.log
  cls
  goto GameMenu
  )
  goto StartGame
::StartGame END

::StartFolder START
:StartFolder
  cls
  echo %StartDir% Chosen [S]>>log.log
  goto BEcheck
::StartFolder END

::BE Disable/ RSG Skip START
  :BEcheck
  if exist "%StartDir%\RainbowSix_BE.exe" (
    echo Founded RainbowSix_BE.exe >>log.log
    goto StartChoose
    )
    goto nothaveBE

  :nothaveBE
  if exist "%StartDir%\RainbowSixGame.exe" (
    echo Founded RainbowSixGame.exe >>log.log
    set startexe=%StartDir%\RainbowSixGame.exe
    goto gamestarter
    ) else (
    goto StartGame
    )
    goto nothaveBE
::BE Disable/ RSG Skip END

::StartChoose START
:StartChoose
  MODE 50,10
  echo [93m-----------------------NOTES----------------------[0m
  echo                   Start Choose
  echo        DirectX is a normal default R6:S
  echo [93m----------------------SELECT----------------------[0m
  Resources\cmdmenusel f8f0 "   DirectX" "   Vulkan" "   Back"

  if %ERRORLEVEL%==1 (
  set startexe=%StartDir%\RainbowSix.exe
  goto gamestarter
  )
  if %ERRORLEVEL%==2 (
  set startexe=%StartDir%\RainbowSix_Vulkan.exe
  goto gamestarter
  )
  if %ERRORLEVEL%==3 (
  echo Back - %TIME%>>log.log
  cls
  goto GameMenu
  )
  goto StartChoose
::StartChoose END

::GameStarter START
:GameStarter
  cls
  MODE 60,20
  echo Starting : %startexe%
  echo Starting : %startexe% >>log.log
  start %startexe% /belaunch
  pause
  goto GameMenu
::GameStarter END
::FULL STARTGAME END


:Extra
cls
echo Extra is Currently unavaible ^^!
pause
goto MainMenu



::dxvcredist START
:dxvcredist
  Title DirectX + VC Redist Downloader
  MODE 41,10
  echo dxvcredist Loaded>>log.log
  echo [93m------------------NOTES------------------[0m
  echo     DirectX + VC Redist Downloader
  echo [93m------------------SELECT-----------------[0m
  Resources\cmdmenusel f8f0 "   DirectX" "   VC 2010 Redist" "   VC 2012 Redist" "   VC 2015 Redist"  "   VC 2017 Redist" " Back"

  if %ERRORLEVEL% == 1 (
  MODE 100,40
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 228990 -manifest 1829726630299308803 -username %username% -remember-password -dir "R6Downloads\DirectX" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete^^!
  echo It's DirectX^^!
  echo DirectX Chosen>>log.log
  goto MainMenu
  )
  if %ERRORLEVEL% == 2 (
  MODE 100,40
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 228983 -manifest 8124929965194586177 -username %username% -remember-password -dir "R6Downloads\VC_2010_Redist" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete^^!
  echo It's VC 2010 Redist^^!
  echo VC 2010 Redist Chosen>>log.log
  goto MainMenu
  )
  if %ERRORLEVEL% == 3 (
  MODE 100,40
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 228984 -manifest 2547553897526095397 -username %username% -remember-password -dir "R6Downloads\VC_2012_Redist" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete^^!
  echo It's VC 2012 Redist^^!
  echo VC 2012 Redist Chosen>>log.log
  goto MainMenu
  )
  if %ERRORLEVEL% == 4 (
  MODE 100,40
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 228986 -manifest 8782296191957114623 -username %username% -remember-password -dir "R6Downloads\VC_2015_Redist" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete^^!
  echo It's VC 2015 Redist^^!
  echo VC 2015 Redist Chosen>>log.log
  goto MainMenu
  )
  if %ERRORLEVEL% == 5 (
  MODE 100,40
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 228987 -manifest 4302102680580581867 -username %username% -remember-password -dir "R6Downloads\VC_2017_Redist" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete^^!
  echo It's VC 2017 Redist^^!
  echo VC 2017 Redist Chosen>>log.log
  goto MainMenu
  )
  if %ERRORLEVEL% == 6 (
  cls
  goto MainMenu
  )
  goto dxvcredist
::dxvcredist END


::ZeroFolderRenamer START
:ZeroFolderRenamer
  cls
  Title Zero Folder Renamer
  echo Zero Folder Renamer Loaded>>log.log
  MODE 50,30
  echo Make sure you not Downloaded two times^^!
  pause
  echo Waiting to fully rename the folders.
  echo -------------RENAME START----------->>log.log
  ren "R6Downloads\Y1S1_BlackIce" "Y1S1_Black_Ice" 2>nul
  echo Y1S1_BlackIce Renamed>>log.log
  ren "R6Downloads\Y1S2_DustLine" "Y1S2_Dust_Line" 2>nul
  echo Y1S2_DustLine Renamed>>log.log
  ren "R6Downloads\Y1S4_RedCrow" "Y1S4_Red_Crow" 2>nul
  echo Y1S4_RedCrow Renamed>>log.log
  ren "R6Downloads\Y2S1_VelvetShell" "Y2S1_Velvet_Shell" 2>nul
  echo Y2S1_VelvetShell Renamed>>log.log
  ren "R6Downloads\Y2S2_Health_FixingAndRepairingTheGame" "Y2S2_Health_2" 2>nul
  echo Y2S2_Health_FixingAndRepairingTheGame Renamed>>log.log
  ren "R6Downloads\Y2S4_WhiteNoise" "Y2S4_White_Noise" 2>nul
  echo Y2S4_WhiteNoise Renamed>>log.log
  ren "R6Downloads\Y3S1_Chimera_Outbreak" "Y3S1_Chimera" 2>nul
  echo Y3S1_Chimera_Outbreak Renamed>>log.log
  ren "R6Downloads\Y3S2_ParaBellum" "Y3S2_Para_Bellum" 2>nul
  echo Y3S2_ParaBellum Renamed>>log.log
  ren "R6Downloads\Y3S3_GrimSky_MadHouse" "Y3S3_MadHouse" 2>nul
  echo Y3S3_GrimSky_MadHouse Renamed>>log.log
  ren "R6Downloads\Y3S4_WindBastion" "Y3S4_Wind_Bastion" 2>nul
  echo Y3S4_WindBastion Renamed>>log.log
  ren "R6Downloads\Y4S1_BurntHorizon_RainbowisMagic" "Y4S1_RainbowIsMagic" 2>nul
  echo Y4S1_BurntHorizon_RainbowisMagic Renamed>>log.log
  ren "R6Downloads\Y4S2_PhantomSight_Showdown" "Y4S2_Phantom_Sight" 2>nul
  echo Y4S2_PhantomSight_Showdown Renamed>>log.log
  ren "R6Downloads\Y4S3_EmberRise_DoktorsCurse" "Y4S3_DoktorsCurse" 2>nul
  echo Y4S3_EmberRise_DoktorsCurse Renamed>>log.log
  ren "R6Downloads\Y4S4_ShiftingTides_Stadium" "Y4S4_Shifting_Tides" 2>nul
  echo Y4S4_ShiftingTides_Stadium Renamed>>log.log
  ren "R6Downloads\Y5S1_VoidEdge_GangDestruction" "Y5S1_GangDestruction" 2>nul
  echo Y5S1_VoidEdge_GangDestruction Renamed>>log.log
  ren "R6Downloads\Y5S2_SteelWave_Morphues" "Y5S2_MUTE" 2>nul
  echo Y5S2_SteelWave_Morphues Renamed>>log.log
  ren "R6Downloads\Y5S2_SteelWave_Morphues_V2311" "Y5S2_Steel_Wave" 2>nul
  echo Y5S2_SteelWave_Morphues_V2311 Renamed>>log.log
  echo -------------RENAME END----------->>log.log
  echo Renamer end ^^!
  pause >nul | echo Press any key to go back to MainMenu
  goto MainMenu
::ZeroFolderRenamer END


::CREDIT START
::© 2020 SlejmUr
:Credit
  Title CREDIT
  MODE 75,20
  echo I would like to thank everyone who helped this project getting developed:
  echo Thanks Zer0Byte the first version of MenuV and I can fork his code^^!
  echo Thanks DepotDownloader creators^^!
  echo Thanks SteamDB^^!
  echo Thanks Markster for Plaza^'s^^!
  echo Thanks LoneWolf and Pixie for helped me^^!
  echo Thanks Ancientkingg for Log idea, DotNet Checker Second Version
  echo And thank you for using it^^!
  echo.
  echo First Version: 2020 June 17
  echo Updated Version: 2020 
  echo Released Version: TDB
  pause
  cls
  goto MainMenu
::CREDIT END


::Update START
:Update
  Title Update
  MODE 75,20
  curl -L  "https://raw.githubusercontent.com/SlejmUr/R6-AIOTool/master/TXTS/notes"
  echo.
  pause
  goto MainMenu
::Update END



::BattlEyeChecker START
:BattlEyeChecker
 color 09
 MODE 36,8
 set EXE=RainbowSix_BE.exe
 FOR /F %%x IN ('tasklist /NH /FI "IMAGENAME eq %EXE%"') DO IF %%x == %EXE% goto FOUND
 goto NOTFOUND
 :NOTFOUND
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
 goto MainMenu
::BattlEyeChecker END



:exiting
echo. >>log.log
exit
