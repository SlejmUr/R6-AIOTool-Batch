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
:: Updated by SlejmUr#4007 ✓ Verified Dickhead
::
@shift /0
@echo off
setlocal enableextensions enabledelayedexpansion

::STARTUP
  Title STARTUP
  echo Loading...
  echo Please be patient ^^!
  set homepath=%cd%
  set AllInOneVersion=DEV
  set discord=discord.gg/EvrGzAV
  goto settime

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
  SET logzip=%%B-%%C-%%D
  )
  goto LogCheck
::TIME SET END


::logstart start
:logstart
  echo %TIME% ^| INFO ^| Started %AllInOneVersion%>>log.log
  goto github
::logstart end

::Github Connect START
:github
  set Position=SiniCheck
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
  if exist "Resources\Settings.ini" (
    goto dotnetSET
  ) else (
    mkdir Resources
    goto noSini
  )

:noSini
  set Position=SiniCheck
  MODE 78,20
  echo ------------------------------------------------------------------------------
  echo                              Downloading Settings.ini...
  echo ------------------------------------------------------------------------------
  curl -L  "https://github.com/SlejmUr/R6-AIOTool/raw/master/Requirements/Settings.ini" --output Settings.ini
  move Settings.ini Resources
  set LOGINFO=Settings.ini Downloaded and Moved
  set LogNumber=1
  goto logtolog
::Settings.ini get END


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
  set LOGINFO= .NET Runtime not found, please Install it!
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

:Emer7zip
  set Position=LogZipping
  cls
  echo ------------------------------------------------------------------------------
  echo                       Emergency Downloading 7-Zip...
  echo ------------------------------------------------------------------------------
  curl -L  "https://github.com/DataCluster0/R6TBBatchTool/raw/master/Requirements/7z.exe" --output 7z.exe
  move 7z.exe Resources
  set LOGINFO=Emergency 7zip Successfully Downloaded and Moved, Compressing....
  set LogNumber=1
  goto logtolog

:no7zip
  set Position=7zipcheck
  cls
  MODE 78,20
  echo ------------------------------------------------------------------------------
  echo                              Downloading 7-Zip...
  echo ------------------------------------------------------------------------------
  curl -L  "https://github.com/DataCluster0/R6TBBatchTool/raw/master/Requirements/7z.exe" --output 7z.exe
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
  set Position=DepotCheck
  cls
  MODE 78,20
  echo ------------------------------------------------------------------------------
  echo                        Downloading DepotDownloader...
  echo ------------------------------------------------------------------------------
  curl -L  "https://github.com/SteamRE/DepotDownloader/releases/download/DepotDownloader_2.3.6/depotdownloader-2.3.6.zip" --output depot.zip
  ::Extract
  for %%I in ("depot.zip") do (
    "Resources\7z.exe" x -y -o"Resources\DepotDownloader" "%%I" -aoa && del %%I
  )
  set LOGINFO=DepotDownloader Successfully Downloaded and Extracted
  set LogNumber=1
  goto logtolog
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
  if exist "Resources\Plazas\PLAZA_BO\CODEX.ini" (
    goto cmdCheck 
  ) else (
    goto GetPlaza
  )
  goto PlazaCheck

:GetPlaza
  set Position=PlazaCheck
  cls
  MODE 78,20
  echo ------------------------------------------------------------------------------
  echo                        Downloading Plazas...
  echo ------------------------------------------------------------------------------
  curl -L  "https://cdn.discordapp.com/attachments/722089860755881996/788352276497825802/Plazas.zip" --output plazas.zip
  ::Extract
  for %%I in ("plazas.zip") do (
  "Resources\7z.exe" x -y -o"Resources\" "%%I" -aoa && del %%I
  )
  set LOGINFO=Plazas Successfully Downloaded and Extracted
  set LogNumber=1
  goto logtolog
::Plaza End



::cmdmenusel START
:cmdCheck
  cls
  if exist "Resources\cmdmenusel.exe" (
    goto ReplacerCheck 
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
  move cmdmenusel.exe Resources
  set LOGINFO=cmdmenusel Successfully Downloaded and Moved
  set LogNumber=1
  goto logtolog
::cmdmenusel END

::replacer START
:ReplacerCheck
  cls
  if exist "Resources\replacer.exe" (
    goto ifSteam 
  ) else (
    goto GetReplacer
  )
  goto ReplacerCheck

:GetReplacer
  set Position=ReplacerCheck
  cls
  MODE 78,20
  echo ------------------------------------------------------------------------------
  echo                        Downloading replacer...
  echo ------------------------------------------------------------------------------
  curl -L  "https://github.com/SlejmUr/R6-AIOTool/raw/master/Requirements/replacer.exe" --output replacer.exe
  move replacer.exe Resources
  set LOGINFO=Replacer Successfully Downloaded and Moved
  set LogNumber=1
  goto logtolog
::replacer END



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
  set Position=PopUpCheck
  MODE 78,20
  echo Please type your Steam Legacy name!
  set /p username="Enter Steam Username:"
  set "LOGINFO=Steam Legacy Name [Username] set to %username% "
  set LogNumber=1
  goto logtolog
::SetSteam END


::FAQ popup START
:PopUpCheck
  findstr /m "POPUP=1" Resources\Settings.ini >Nul
  if %errorlevel%==0 (
  goto faq
  )
  if %errorlevel%==1 (
  goto MainMenu
  )
::FAQ popup END

::MainMenu START
:MainMenu
  set LastSelector=MainMenu
  set Position=MainMenu
  cls
  Title R6S AllInOne Tool
  MODE 62,30
  echo [93m----------------------------NOTES-----------------------------[0m
  echo  Rainbow Six Siege AllInOne Tool
  echo  [31mYou MUST have a copy of Siege on Steam to use the downloader^^![0m
  echo  This tools is forked from [91mZer0Bytes[0m manifest tool
  echo  Our Discord Server: [94m%discord%[0m 
  echo  AIO Tool Version: [32m%AllInOneVersion%[0m 
  echo  Steam User: [96m%username%[0m
  echo  Read FAQ!
  echo [93m----------------------------SELECT----------------------------[0m
  Resources\cmdmenusel f830 "  FAQ and Notes" "  Game Menu" "  Extra Language" "  4K Textures" "  DirectX and VC Redist Downloader" "  Credits" "  BattlEye Checker" "  Change Steam Username" "  Old Logs Delete" "  Zer0 folder Renamer" "  Update" "  Exit" "  Devlog" "  Codex Renamer and Move"

  if %ERRORLEVEL% == 1 (
  set Position=faq
  goto GoingTo
  )
  if %ERRORLEVEL% == 2 (
  set Position=GameMenu
  goto GoingTo
  )
  if %ERRORLEVEL% == 3 (
  set Position=Extra
  goto GoingTo
  )
  if %ERRORLEVEL% == 4 (
  set Position=TextureMenu
  goto GoingTo
  )
  if %ERRORLEVEL% == 5 (
  set Position=dxvcredist
  goto GoingTo
  )
  if %ERRORLEVEL% == 6 (
  set Position=Credit
  goto GoingTo
  )
  if %ERRORLEVEL% == 7 (
  set Position=BattlEyeChecker
  goto GoingTo
  )
  if %ERRORLEVEL% == 8 (
  cls
  set /p username="Enter Steam Username:"
  set "LOGINFO=Changing Steam UserName to %username%"
  set LogNumber=1
  goto logtolog
  )
  if %ERRORLEVEL% == 9 (
  cls
  del log.log
  rd /s /q  "logs\" 2>nul
  echo Logs Deleted^^!
  pause
  set LOGTYPE=2
  set LOGINFO=Full log deleted
  goto logtolog
  )
  if %ERRORLEVEL% == 10 (
  set Position=ZeroFolderRenamer
  goto GoingTo
  )
  if %ERRORLEVEL%==11 (
  set Position=Update
  goto GoingTo
  )
  if %ERRORLEVEL% == 12 (
  set Position=exiting
  set LOGTYPE=1
  set LOGINFO=Exited
  goto logtolog
  )
  if %ERRORLEVEL% == 13 (
  start Devlog.txt
  )
  if %ERRORLEVEL% == 14 (
  goto CodexRenamer
  )
  goto MainMenu
::MainMenu END


::FAQ and notes START
:faq
  cls
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
  Resources\replacer.exe Resources\Settings.ini POPUP=1 POPUP=0 >nul
  pause
  cls
  goto MainMenu
::FAQ and notes END



::GameMenu START
:GameMenu
  cls
  Title R6:S GameMenu
  MODE 34,10
  echo [93m---------------NOTES--------------[0m
  echo     Rainbow Six Siege Game Menu
  echo       Install/Uninstall/Start
  echo [93m--------------SELECT--------------[0m 
  Resources\cmdmenusel f8f0 "    Install Rainbow Six Siege" "   Uninstall Rainbow Six Siege" "   Starting Rainbow Six Siege" "              Back"

  if %ERRORLEVEL% == 1 (
  set Position=InstallMenu
  goto GoingTo
  )
  if %ERRORLEVEL% == 2 (
  set Position=UninstallMenu
  goto GoingTo
  )
  if %ERRORLEVEL% == 3 (
  set Position=StartGame
  goto GoingTo
  )
  if %ERRORLEVEL% == 4 (
  set Position=MainMenu
  goto BackTo
  )
  goto GameMenu
::GameMenu END



::InstallMenu START
:InstallMenu
  set LastSelector=InstallMenu
  cls
  Title Rainbow Six Siege InstallMenu
  MODE 50,14
  echo [93m-----------------------NOTES----------------------[0m
  echo                   Install Selector
  echo          [31mExtra/4K now is unstable ^^![0m
  echo [93m----------------------SELECT----------------------[0m
  Resources\cmdmenusel f8f0 "   Version Downloader" "   Event Downloader" "   Release Downloader" "   Custom Downloader" "   4K Textures Downloader" "   Extra Language Downloader" "   Back"

  if %ERRORLEVEL% == 1 (
  set Position=VersionMenu
  goto GoingTo
  )
  if %ERRORLEVEL% == 2 (
  set Position=EventMenu
  goto GoingTo
  )
  if %ERRORLEVEL% == 3 (
  set Position=ReleaseMenu
  goto GoingTo
  )
  if %ERRORLEVEL% == 4 (
  set Position=CustomMenu
  goto GoingTo
  )
  if %ERRORLEVEL% == 5 (
  set Position=TextureMenu
  goto GoingTo
  )
  if %ERRORLEVEL% == 6 (
  set Position=Extra
  goto GoingTo
  )
  if %ERRORLEVEL% == 7 (
  set Position=GameMenu
  goto BackTo
  )
  goto InstallMenu
::InstallMenu END


::VersionMenu START
:VersionMenu
  cls
  Title Rainbow Six Siege VersionMenu
  MODE 50,30
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
  echo.
  echo Download complete^^!
  echo It's Vanilla
  pause
  cls
  set Downloaded=Vanilla
  goto DownloadCheck
  )
  if %ERRORLEVEL%==2 (
  :BlackIce
  MODE 100,40
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 5188997148801516344 -username %username% -remember-password -dir "R6Downloads\Y1S1_Black_Ice" -validate -max-servers 15 -max-downloads 10
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 7932785808040895147 -username %username% -remember-password -dir "R6Downloads\Y1S1_Black_Ice" -validate -max-servers 15 -max-downloads 10
  echo.
  echo Download complete^^!
  echo It's Black Ice Released
  pause
  cls
  set Downloaded=Black Ice
  goto DownloadCheck
  )
  if %ERRORLEVEL%==3 (
  :DustLine
  MODE 100,40
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 2303064029242396590 -username %username% -remember-password -dir "R6Downloads\Y1S2_Dust_Line" -validate -max-servers 15 -max-downloads 10
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 2206497318678061176 -username %username% -remember-password -dir "R6Downloads\Y1S2_Dust_Line" -validate -max-servers 15 -max-downloads 10
  echo.
  echo Download complete^^!
  echo It's Dust Line Released
  pause
  cls
  set Downloaded=Dust Line
  goto DownloadCheck
  )
  if %ERRORLEVEL%==4 (
  :SkullRainZero
  MODE 100,40
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 5819137024728546741 -username %username% -remember-password -dir "R6Downloads\Y1S3_SkullRain" -validate -max-servers 15 -max-downloads 10
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 5851804596427790505 -username %username% -remember-password -dir "R6Downloads\Y1S3_SkullRain" -validate -max-servers 15 -max-downloads 10
  echo.
  echo Download complete Thanks Zer0 ^^!
  echo Skull Rain 4.2
  pause
  cls
  set Downloaded=Skull Rain 4.2
  goto DownloadCheck
  )
  if %ERRORLEVEL%==5 (
  :RedCrow
  MODE 100,40
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 3576607363557872807 -username %username% -remember-password -dir "R6Downloads\Y1S4_Red_Crow" -validate -max-servers 15 -max-downloads 10
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 8569920171217002292 -username %username% -remember-password -dir "R6Downloads\Y1S4_Red_Crow" -validate -max-servers 15 -max-downloads 10
  echo.
  echo Download complete^^!
  echo It's Red Crow Released^^!
  pause
  cls
  set Downloaded=Red Crow
  goto DownloadCheck
  )
  if %ERRORLEVEL%==6 (
  :VelvetShell
  MODE 100,40
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 2248734317261478192 -username %username% -remember-password -dir "R6Downloads\Y2S1_Velvet_Shell" -validate -max-servers 15 -max-downloads 10
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 8006071763917433748 -username %username% -remember-password -dir "R6Downloads\Y2S1_Velvet_Shell" -validate -max-servers 15 -max-downloads 10
  echo.
  echo Download complete^^!
  echo It's Velvet Shell Released^^!
  pause
  cls
  set Downloaded=Velvet Shell
  goto DownloadCheck
  )
  if %ERRORLEVEL%==7 (
  :HealthZero
  MODE 100,40
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 5875987479498297665 -username %username% -remember-password -dir "R6Downloads\Y2S2_Health_2" -validate -max-servers 15 -max-downloads 10
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 708773000306432190 -username %username% -remember-password -dir "R6Downloads\Y2S2_Health_2" -validate -max-servers 15 -max-downloads 10
  echo.
  echo Download complete Thanks Zer0 ^^!
  echo Health [Zer0]
  pause
  cls
  set Downloaded=Health [Zer0]
  goto DownloadCheck
  )
  if %ERRORLEVEL%==8 (
  :BloodOrchidZero
  MODE 100,40
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 6708129824495912434 -username %username% -remember-password -dir "R6Downloads\Y2S3_BloodOrchid" -validate -max-servers 15 -max-downloads 10
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 1613631671988840841 -username %username% -remember-password -dir "R6Downloads\Y2S3_BloodOrchid" -validate -max-servers 15 -max-downloads 10
  echo.
  echo Download complete Thanks Zer0 ^^!
  echo Blood Orchid 2.3.1.1
  pause
  cls
  set Downloaded=Blood Orchid 2.3.1.1 [Zer0]
  goto DownloadCheck
  )
  if %ERRORLEVEL%==9 (
  :WhiteNoiseZero
  MODE 100,40
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 8748734086032257441 -username %username% -remember-password -dir "R6Downloads\Y2S4_WhiteNoise" -validate -max-servers 15 -max-downloads 10
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 4221297486420648079 -username %username% -remember-password -dir "R6Downloads\Y2S4_WhiteNoise" -validate -max-servers 15 -max-downloads 10
  echo.
  echo Download complete Thanks Zer0 ^^!
  echo WHITE NOISE [Zer0] 
  pause
  cls
  set Downloaded=White Noise [Zer0]
  goto DownloadCheck
  )
  if %ERRORLEVEL%==10 (
  :Chimera
  MODE 100,40
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 5071357104726974256 -username %username% -remember-password -dir "R6Downloads\Y3S1_Chimera" -validate -max-servers 15 -max-downloads 10
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 4701787239566783972 -username %username% -remember-password -dir "R6Downloads\Y3S1_Chimera" -validate -max-servers 15 -max-downloads 10
  echo.
  echo Download complete^^!
  echo It's Chimera Released^^!
  pause
  cls
  set Downloaded=Chimera
  goto DownloadCheck
  )
  if %ERRORLEVEL%==11 (
  :ParaBellum
  MODE 100,40
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 8312108283310615233 -username %username% -remember-password -dir "R6Downloads\Y3S2_Para_Bellum" -validate -max-servers 15 -max-downloads 10
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 8765715607275074515 -username %username% -remember-password -dir "R6Downloads\Y3S2_Para_Bellum" -validate -max-servers 15 -max-downloads 10
  echo.
  echo Download complete^^!
  echo It's Para Bellum Released^^!
  pause
  cls
  set Downloaded=Para Bellum
  goto DownloadCheck
  )
  if %ERRORLEVEL%==12 (
  :MadHouse
  MODE 100,40
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 5562094852451837435 -username %username% -remember-password -dir "R6Downloads\Y3S3_MadHouse" -validate -max-servers 15 -max-downloads 10
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 7781202564071310413 -username %username% -remember-password -dir "R6Downloads\Y3S3_MadHouse" -validate -max-servers 15 -max-downloads 10
  echo.
  echo Download complete Thanks Zer0 ^^!
  echo GRIM SKY [Zer0] / Mad House
  pause
  cls
  set Downloaded=GRIM SKY [Zer0] / Mad House
  goto DownloadCheck
  )
  if %ERRORLEVEL%==13 (
  :WindBastion
  MODE 100,40
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 6502258854032233436 -username %username% -remember-password -dir "R6Downloads\Y3S4_Wind_Bastion" -validate -max-servers 15 -max-downloads 10
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 7659555540733025386 -username %username% -remember-password -dir "R6Downloads\Y3S4_Wind_Bastion" -validate -max-servers 15 -max-downloads 10
  echo.
  echo Download complete ^^!
  echo It's Wind Bastion Released
  pause
  cls
  set Downloaded=Wind Bastion
  goto DownloadCheck
  )
  if %ERRORLEVEL%==14 (
  :RainbowIsMagic
  MODE 100,40
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 8356277316976403078 -username %username% -remember-password -dir "R6Downloads\Y4S1_RainbowIsMagic" -validate -max-servers 15 -max-downloads 10
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 5935578581006804383 -username %username% -remember-password -dir "R6Downloads\Y4S1_RainbowIsMagic" -validate -max-servers 15 -max-downloads 10
  echo.
  echo Download complete Thanks Zer0 ^^!
  echo BURNT HORIZON [Zer0] / Rainbow Is Magic
  pause
  cls
  set Downloaded=BURNT HORIZON [Zer0] / Rainbow Is Magic
  goto DownloadCheck
  )
  if %ERRORLEVEL%==15 (
  :PhantomSight
  MODE 100,40
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 693082837425613508 -username %username% -remember-password -dir "R6Downloads\Y4S2_Phantom_Sight" -validate -max-servers 15 -max-downloads 10
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 5408324128694463720 -username %username% -remember-password -dir "R6Downloads\Y4S2_Phantom_Sight" -validate -max-servers 15 -max-downloads 10
  echo.
  echo Download complete^^!
  echo PHANTOM SIGHT Released / Showdown
  pause
  cls
  set Downloaded=PHANTOM SIGHT / Showdown
  goto DownloadCheck
  )
  if %ERRORLEVEL%==16 (
  :DoktorsCurse
  MODE 100,40
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 3546781236735558235 -username %username% -remember-password -dir "R6Downloads\Y4S3_DoktorsCurse" -validate -max-servers 15 -max-downloads 10
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 7869081741739849703 -username %username% -remember-password -dir "R6Downloads\Y4S3_DoktorsCurse" -validate -max-servers 15 -max-downloads 10
  echo.
  echo Download complete Thanks Zer0 ^^!
  echo EMBER RISE [Zer0] / Doctors Curse
  pause
  cls
  set Downloaded=EMBER RISE [Zer0] / Doctors Curse
  goto DownloadCheck
  )
  if %ERRORLEVEL%==17 (
  :ShiftingTides
  MODE 100,40
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 299124516841461614 -username %username% -remember-password -dir "R6Downloads\Y4S4_Shifting_Tides" -validate -max-servers 20 -max-downloads 15
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 1842268638395240106 -username %username% -remember-password -dir "R6Downloads\Y4S4_Shifting_Tides" -validate -max-servers 20 -max-downloads 15
  echo.
  echo Download complete^^!
  echo It's Shifting Tides Released^^!
  pause
  cls
  set Downloaded=Shifting Tides
  goto DownloadCheck
  )
  if %ERRORLEVEL%==18 (
  :GangDestruction
  MODE 100,40
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 1378283477131353042 -username %username% -remember-password -dir "R6Downloads\Y5S1_GangDestruction" -validate -max-servers 15 -max-downloads 10
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 1739364586766771991 -username %username% -remember-password -dir "R6Downloads\Y5S1_GangDestruction" -validate -max-servers 15 -max-downloads 10
  echo.
  echo Download complete Thanks Zer0 ^^!
  echo Void Edge [Zer0] / Gang Destruction
  pause
  cls
  set Downloaded=Void Edge [Zer0] / Gang Destruction
  goto DownloadCheck
  )
  ::steel wave Y5S2.3.0_C5433707_D1028748_S38774_14603060 (Mute Protocol)
  if %ERRORLEVEL%==19 (
  :MUTEProtocol
  MODE 100,40
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 2287849678928593252 -username %username% -remember-password -dir "R6Downloads\Y5S2_MUTE" -validate -max-servers 15 -max-downloads 10
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 1610834739284564851 -username %username% -remember-password -dir "R6Downloads\Y5S2_MUTE" -validate -max-servers 15 -max-downloads 10
  echo.
  echo Download complete Thanks Zer0 ^^!
  echo Steel Wave [Mute Protocol]
  pause
  cls
  set Downloaded=Steel Wave [omega/Mute Protocol]
  goto DownloadCheck
  )
  ::SteelWave (omega/Mute Protocol)
  if %ERRORLEVEL%==20 (
  :OmegaSteelWave
  MODE 100,40
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 4367817844736324940 -username %username% -remember-password -dir "R6Downloads\Y5S2_SteelWave" -validate -max-servers 15 -max-downloads 10
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 893971391196952070 -username %username% -remember-password -dir "R6Downloads\Y5S2_SteelWave" -validate -max-servers 15 -max-downloads 10
  echo.
  echo Download complete Thanks Zer0 ^^!
  echo Steel Wave [omega/Mute Protocol]
  pause
  cls
  set Downloaded=Steel Wave [omega/Mute Protocol]
  goto DownloadCheck
  )
  if %ERRORLEVEL% == 21 (
  set Position=InstallMenu
  goto BackTo
  )
  goto VersionMenu
::VersionMenu END


::ReleaseMenu START
:ReleaseMenu
  cls
  Title Rainbow Six Siege ReleaseMenu
  MODE 50,30
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
  echo.
  echo Download complete^^!
  echo It's Skull Rain Released^^!
  pause
  cls
  set Downloaded=Skull Rain
  goto DownloadCheck
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
  echo.
  echo Download complete^^!
  echo It's Health Released^^!
  pause
  cls
  set Downloaded=Health
  goto DownloadCheck
  )
  if %ERRORLEVEL%==8 (
  :BloodOrchid
  MODE 100,40
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 8948840210977117778 -username %username% -remember-password -dir "R6Downloads\Y2S3_Blood_Orchid" -validate -max-servers 15 -max-downloads 10
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 2410147212125863824 -username %username% -remember-password -dir "R6Downloads\Y2S3_Blood_Orchid" -validate -max-servers 15 -max-downloads 10
  echo.
  echo Download complete^^!
  echo It's Blood Orchid Released^^!
  pause
  cls
  set Downloaded=Blood Orchid
  goto DownloadCheck
  )
  if %ERRORLEVEL%==9 (
  :WhiteNoise
  MODE 100,40
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 2066250193950057921 -username %username% -remember-password -dir "R6Downloads\Y2S4_White_Noise" -validate -max-servers 15 -max-downloads 10
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 2783803489764777627 -username %username% -remember-password -dir "R6Downloads\Y2S4_White_Noise" -validate -max-servers 15 -max-downloads 10
  echo.
  echo Download complete^^!
  echo It's White Noise Released^^!
  pause
  cls
  set Downloaded=White Noise
  goto DownloadCheck
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
  echo.
  echo Download complete^^!
  echo It's Grim Sky Released^^!
  pause
  cls
  set Downloaded=Grim Sky
  goto DownloadCheck
  )
  if %ERRORLEVEL%==13 (
  goto WindBastion
  )
  if %ERRORLEVEL%==14 (
  :BurntHorizon
  MODE 100,40
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 8985694971177711792 -username %username% -remember-password -dir "R6Downloads\Y4S1_Burnt_Horizon" -validate -max-servers 15 -max-downloads 10
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 4355229858723790756 -username %username% -remember-password -dir "R6Downloads\Y4S1_Burnt_Horizon" -validate -max-servers 15 -max-downloads 10
  echo.
  echo Download complete^^!
  echo It's Burnt Horizon Released^^!
  pause
  cls
  set Downloaded=Burnt Horizon
  goto DownloadCheck
  )
  if %ERRORLEVEL%==15 (
  goto PhantomSight
  )
  if %ERRORLEVEL%==16 (
  :EmberRise
  MODE 100,40
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 7309481042294838052 -username %username% -remember-password -dir "R6Downloads\Y4S3_Ember_Rise" -validate -max-servers 15 -max-downloads 10
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 5429930338066808153 -username %username% -remember-password -dir "R6Downloads\Y4S3_Ember_Rise" -validate -max-servers 15 -max-downloads 10
  echo.
  echo Download complete^^!
  echo It's Ember Rise Released^^!
  pause
  cls
  set Downloaded=Ember Rise
  goto DownloadCheck
  )
  if %ERRORLEVEL%==17 (
  goto ShiftingTides
  )
  if %ERRORLEVEL%==18 (
  :VoidEdge
  MODE 100,40
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 8007091753837589034 -username %username% -remember-password -dir "R6Downloads\Y5S1_Void_Edge" -validate -max-servers 15 -max-downloads 10
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 2810676266503656332 -username %username% -remember-password -dir "R6Downloads\Y5S1_Void_Edge" -validate -max-servers 15 -max-downloads 10
  echo.
  echo Download complete^^!
  echo It's Void Edge Released^^!
  pause
  cls
  set Downloaded=Void Edge
  goto DownloadCheck
  )
  if %ERRORLEVEL%==19 (
  :SteelWave
  MODE 100,40
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 7032500641931923367 -username %username% -remember-password -dir "R6Downloads\Y5S2_Steel_Wave" -validate -max-servers 15 -max-downloads 10
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 8083217055977195199 -username %username% -remember-password -dir "R6Downloads\Y5S2_Steel_Wave" -validate -max-servers 15 -max-downloads 10
  echo.
  echo Download complete^^!
  echo It's Steel Wave Released^^!
  pause
  cls
  set Downloaded=Steel Wave
  goto DownloadCheck
  )
  if %ERRORLEVEL%==20 (
  :ShadowLegacy
  MODE 100,40
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 885453180592640750 -username %username% -remember-password -dir "R6Downloads\Y5S3_Shadow_Legacy" -validate -max-servers 15 -max-downloads 10
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 7750070106878890861 -username %username% -remember-password -dir "R6Downloads\Y5S3_Shadow_Legacy" -validate -max-servers 15 -max-downloads 10
  echo.
  echo Download complete^^!
  echo It's Shadow Legacy Released^^!
  pause
  cls
  set Downloaded=Shadow Legacy
  goto DownloadCheck
  )
  if %ERRORLEVEL%==21 (
  :NeonDawn
  MODE 100,40
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 752517632960395491 -username %username% -remember-password -dir "R6Downloads\Y5S4_Neon_Dawn" -validate -max-servers 15 -max-downloads 10
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 7979405601806736439 -username %username% -remember-password -dir "R6Downloads\Y5S4_Neon_Dawn" -validate -max-servers 15 -max-downloads 10
  echo.
  echo Download complete^^!
  echo It's Neon Dawn Released^^!
  pause
  cls
  set Downloaded=Neon Dawn
  goto DownloadCheck
  )
  if %ERRORLEVEL% == 22 (
  set Position=InstallMenu
  goto BackTo
  )
  goto ReleaseMenu
::ReleaseMenu END


::EventMenu START
:EventMenu
  cls
  Title Rainbow Six Siege Event Downloader
  MODE 52,25
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
  echo.
  echo Download complete ^^!
  echo Sugar Fright / Telly
  pause
  cls
  set Downloaded=Sugar Fright / Telly
  goto DownloadCheck
  )
  if %ERRORLEVEL% == 11 (
  set Position=InstallMenu
  goto BackTo
  )
  goto EventMenu
::EventMenu END


::CustomMenu START
:CustomMenu
  cls
  Title Rainbow Six Siege CustomMenu
  MODE 50,20
  echo [93m-----------------------NOTES----------------------[0m
  echo                   Custom Selector
  echo            You need set everything ^^!
  echo [93m----------------------SELECT----------------------[0m
  Resources\cmdmenusel f8f0 "   Set Default things" "   Set App" "   Set Depot" "   Set Manifest" "   Set Path/Dir" "   Start Download" "   Back"
  
  if %ERRORLEVEL% == 1 (
  cls
  set AppID=359550
  set CustomDir="R6Downloads/%ALL%"
  echo Successfully set default things^^!
  echo You still need to set ManifestID and DepotID ^^!
  pause
  set Position=CustomMenu
  set LOGINFO=Custom Setting Default
  set LogNumber=1
  goto logtolog
  )
  if %ERRORLEVEL% == 2 (
  :CustomAppID
  cls
  echo Siege AppID Is : 359550
  set /p AppID="Enter AppID: "
  set Position=CustomMenu
  set LOGINFO=Custom Setting AppID
  set LogNumber=1
  goto logtolog
  )
  if %ERRORLEVEL% == 3 (
  :CustomDepotID
  cls
  echo Use Valid DepotID ^^!
  set /p DepotID="Enter DepotID: "
  set Position=CustomMenu
  set LOGINFO=Custom Setting DepotID
  set LogNumber=1
  goto logtolog
  )
  if %ERRORLEVEL% == 4 (
  :CustomManifestID
  cls
  echo Use Valid ManifestID ^^!
  set /p ManifestID="Enter ManifestID: "
  set Position=CustomMenu
  set LOGINFO=Custom Setting ManifestID
  set LogNumber=1
  goto logtolog
  )
  if %ERRORLEVEL% == 5 (
  :CustomDir
  cls
  echo Set Custom Directory
  echo Like this: ^"DirNane/Path^"
  set /p CustomDir="Enter CustomDir: "
  set Position=CustomMenu
  set LOGINFO=Custom Setting CustomDir
  set LogNumber=1
  goto logtolog
  )
  if %ERRORLEVEL% == 6 (
  MODE 100,40
  cls
  if [%AppID%]==[] (
    echo AppID is empty, please set it^^!
    pause
    set Position=CustomAppID
    set LOGINFO=AppID is empty
    set LogNumber=1
    goto logtolog
  )
  if [%DepotID%]==[] (
    echo DepotID is empty, please set it^^!
    pause
    set Position=CustomDepotID
    set LOGINFO=DepotID is empty
    set LogNumber=1
    goto logtolog
  )
  if [%ManifestID%]==[] (
    echo ManifestID is empty, please set it^^!
    pause
    set Position=CustomManifestID
    set LOGINFO=ManifestID is empty
    set LogNumber=1
    goto logtolog
  )
  if [%CustomDir%]==[] (
    echo CustomDir is empty, please set it^^!
    pause
    set Position=CustomDir
    set LOGINFO=CustomDir is empty
    set LogNumber=1
    goto logtolog
  )
  echo Custom Manifest Downloading %AppID% %DepotID% %ManifestID% on %CustomDir%
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app %AppID% -depot %DepotID% -manifest %ManifestID% -username %username% -remember-password -dir %CustomDir% -validate -max-servers 15 -max-downloads 10
  echo.
  echo Custom: %AppID% %DepotID% %ManifestID% Downloaded on %CustomDir%
  pause
  set Position=CustomMenu
  set LOGINFO=Custom Manifest: %AppID% %DepotID% %ManifestID% Downloaded on %CustomDir%
  set LogNumber=1
  goto logtolog
  )
  if %ERRORLEVEL% == 7 (
  set Position=InstallMenu
  goto BackTo
  )
  goto CustomMenu
::CustomMenu END


::TextureMenu START
:TextureMenu
  cls
  Title Rainbow Six Siege 4K Textures Downloader
  MODE 50,10
  echo [93m----------------------NOTES-----------------------[0m
  echo                   4K Textures Selector
  echo   Insert note here 
  echo [93m----------------------SELECT----------------------[0m
  Resources\cmdmenusel f8f0 "   4K Version" "   4K Event" "   4K Release" "   Back"

  if %ERRORLEVEL% == 1 (
  set Position=4kVersion
  goto GoingTo
  )
  if %ERRORLEVEL% == 2 (
  set Position=4kEvent
  goto GoingTo
  )
  if %ERRORLEVEL% == 3 (
  set Position=4kRelease
  goto GoingTo
  )
  if %ERRORLEVEL% == 4 (
    if %LastSelector% == MainMenu (
      set Position=MainMenu
      goto BackTo
    ) else (
      set Position=InstallMenu
      goto BackTo
    )
  )
  goto TextureMenu
::TextureMenu END

::4kVersion START
:4kVersion
  cls
  Title Rainbow Six Siege 4K Version Downloader
  MODE 50,38
  echo [93m----------------------NOTES-----------------------[0m
  echo   Health, White Noise, Void Edge, Vanilla, etc...
  echo   Stuff is same with in R6Manifest / 4kRelease
  echo [93m----------------------SELECT----------------------[0m
  Resources\cmdmenusel f8f0 "   Vanilla" "   Black Ice" "   Dust Line" "   Skull Rain" "   Red Crow" "   Velvet Shell" "   Health" "   Blood Orchid" "   White Noise" "   Chimera" "   Para Bellum" "   Grim Sky" "   Wind Bastion" "   Burnt Horizon" "   Phantom Sight" "   Ember Rise" "   Shifting Tides" "   Void Edge" "   Steel Wave [Mute]" "   Back"

  if %ERRORLEVEL%==1 (
  :Vanilla4k
  MODE 100,40
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377239 -manifest 8394183851197739981 -username %username% -remember-password -dir "R6Downloads\Y1S0_Vanilla" -validate -max-servers 15 -max-downloads 10
  echo.
  echo Download complete^^!
  echo It's Vanilla 4K^^!
  pause
  cls
  set Downloaded=Vanilla 4K
  goto DownloadCheck
  )
  if %ERRORLEVEL%==2 (
  :BlackIce4k
  MODE 100,40
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377239 -manifest 3756048967966286899 -username %username% -remember-password -dir "R6Downloads\Y1S1_Black_Ice" -validate -max-servers 15 -max-downloads 10
  echo.
  echo Download complete^^!
  echo It's Black Ice 4K^^!
  pause
  cls
  set Downloaded=Black Ice 4K
  goto DownloadCheck
  )
  if %ERRORLEVEL%==3 (
  :DustLine4k
  MODE 100,40
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377239 -manifest 1338949402410764888 -username %username% -remember-password -dir "R6Downloads\Y1S2_Dust_Line" -validate -max-servers 15 -max-downloads 10
  echo.
  echo Download complete^^!
  echo It's Dust Line 4K^^!
  pause
  cls
  set Downloaded=Dust Line 4K
  goto DownloadCheck
  )
  if %ERRORLEVEL%==4 (
  :SkullRain4kZero
  MODE 100,40
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377239 -manifest 3267970968757091405 -username %username% -remember-password -dir "R6Downloads\Y1S3_SkullRain" -validate -max-servers 15 -max-downloads 10
  echo.
  echo Download complete Thanks Zer0 ^^!
  echo Skull Rain 4k [Zero]
  pause
  cls
  set Downloaded=Skull Rain 4k [Zero]
  goto DownloadCheck
  )
  if %ERRORLEVEL%==5 (
  :RedCrow4k
  MODE 100,40
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377239 -manifest 1825939060444887403 -username %username% -remember-password -dir "R6Downloads\Y1S4_Red_Crow" -validate -max-servers 15 -max-downloads 10
  echo.
  echo Download complete^^!
  echo It's Red Crow 4K^^!
  pause
  cls
  set Downloaded=Red Crow 4K
  goto DownloadCheck
  )
  if %ERRORLEVEL%==6 (
  :VelvetShell4k
  MODE 100,40
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377239 -manifest 3196596628759979362 -username %username% -remember-password -dir "R6Downloads\Y2S1_Velvet_Shell" -validate -max-servers 15 -max-downloads 10
  echo.
  echo Download complete^^!
  echo It's Velvet Shell 4K^^!
  pause
  cls
  set Downloaded=Velvet Shell 4K
  goto DownloadCheck
  )
  if %ERRORLEVEL%==7 (
  :Health4kZero
  MODE 100,40
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377239 -manifest 7497579858536910279 -username %username% -remember-password -dir "R6Downloads\Y2S2_Health_2" -validate -max-servers 15 -max-downloads 10
  echo.
  echo Download complete Thanks Zer0 ^^!
  echo Health 4k [Zero]
  pause
  cls
  set Downloaded=Health 4K
  goto DownloadCheck
  )
  if %ERRORLEVEL%==8 (
  :BloodOrchid4kZero
  MODE 100,40
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377239 -manifest 6420469519659049757 -username %username% -remember-password -dir "R6Downloads\Y2S3_BloodOrchid" -validate -max-servers 15 -max-downloads 10
  echo.
  echo Download complete Thanks Zer0 ^^!
  echo Blood Orchid 4k [Zero]
  pause
  cls
  set Downloaded=Blood Orchid 4K
  goto DownloadCheck
  )
  if %ERRORLEVEL%==9 (
  :WhiteNoise4kZero
  MODE 100,40
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377239 -manifest 959656357428794421 -username %username% -remember-password -dir "R6Downloads\Y2S4_WhiteNoise" -validate -max-servers 15 -max-downloads 10
  echo.
  echo Download complete Thanks Zer0 ^^!
  echo White Noise 4k [Zero]
  pause
  cls
  set Downloaded=White Noise 4K
  goto DownloadCheck
  )
  if %ERRORLEVEL%==10 (
  :Chimera4k
  MODE 100,40
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377239 -manifest 1668513364192382097 -username %username% -remember-password -dir "R6Downloads\Y3S1_Chimera" -validate -max-servers 15 -max-downloads 10
  echo.
  echo Download complete^^!
  echo Chimera / Outback 4K
  pause
  cls
  set Downloaded=Chimera / Outback 4K
  goto DownloadCheck
  )
  if %ERRORLEVEL%==11 (
  :ParaBellum4k
  MODE 100,40
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377239 -manifest 204186978012641075 -username %username% -remember-password -dir "R6Downloads\Y3S2_Para_Bellum" -validate -max-servers 15 -max-downloads 10
  echo.
  echo Download complete^^!
  echo It's Para Bellum 4K^^!
  pause
  cls
  set Downloaded=Para Bellum 4K
  goto DownloadCheck
  )
  if %ERRORLEVEL%==12 (
  :MadHouse4k
  MODE 100,40
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377239 -manifest 6431001239225997495 -username %username% -remember-password -dir "R6Downloads\Y3S3_MadHouse" -validate -max-servers 15 -max-downloads 10
  echo.
  echo Download complete Thanks Zer0 ^^!
  echo MadHouse 4k
  pause
  cls
  set Downloaded=Mad House 4K
  goto DownloadCheck
  )
  if %ERRORLEVEL%==13 (
  :WindBastion4k
  MODE 100,40
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377239 -manifest 2243348760021617592 -username %username% -remember-password -dir "R6Downloads\Y3S4_Wind_Bastion" -validate -max-servers 15 -max-downloads 10
  echo.
  echo Download complete^^!
  echo It's Wind Bastion 4K^^!
  pause
  cls
  set Downloaded=Wind Bastion  4K
  goto DownloadCheck
  )
  if %ERRORLEVEL%==14 (
  :RainbowIsMagic4k
  MODE 100,40
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377239 -manifest 3462709886432904855 -username %username% -remember-password -dir "R6Downloads\Y4S1_RainbowIsMagic" -validate -max-servers 15 -max-downloads 10
  echo.
  echo Download complete Thanks Zer0 ^^!
  echo Rainbow Is Magic 4k
  pause
  cls
  set Downloaded=Rainbow Is Magic 4K
  goto DownloadCheck
  )
  if %ERRORLEVEL%==15 (
  :PhantomSight4k
  MODE 100,40
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377239 -manifest 4107080515154236795 -username %username% -remember-password -dir "R6Downloads\Y4S2_Phantom_Sight" -validate -max-servers 15 -max-downloads 10
  echo.
  echo Download complete ^^!
  echo It's Phantom Sight 4K ^^!
  pause
  cls
  set Downloaded=Phantom Sight 4K
  goto DownloadCheck
  )
  if %ERRORLEVEL%==16 (
  :DoktorsCurse4k
  MODE 100,40
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377239 -manifest 4319184561394137009 -username %username% -remember-password -dir "R6Downloads\Y4S3_DoktorsCurse" -validate -max-servers 15 -max-downloads 10
  echo.
  echo Download complete Thanks Zer0 ^^!
  echo Doktors Curse 4k 
  pause
  cls
  set Downloaded=Doktors Curse 4K
  goto DownloadCheck
  )
  if %ERRORLEVEL%==17 (
  :ShiftingTides4k
  MODE 100,40
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377239 -manifest 6048763664997452513 -username %username% -remember-password -dir "R6Downloads\Y4S4_Shifting_Tides" -validate -max-servers 15 -max-downloads 10
  echo.
  echo Download complete^^!
  echo It's Shifting Tides / Road To S.I. 4K^^!
  pause
  cls
  set Downloaded=Shifting Tides / Road To S.I. 4K
  goto DownloadCheck
  )
  if %ERRORLEVEL%==18 (
  :GangDestruction4k
  MODE 100,40
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377239 -manifest 1775661942779524815 -username %username% -remember-password -dir "R6Downloads\Y5S1_GangDestruction" -validate -max-servers 15 -max-downloads 10
  echo.
  echo Download complete Thanks Zer0 ^^!
  echo Gang Destruction 4k
  pause
  cls
  set Downloaded=Gang Destruction 4K
  goto DownloadCheck
  )
  if %ERRORLEVEL%==19 (
  :MUTEProtocol4k
  MODE 100,40
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377239 -manifest 1430519549301269175 -username %username% -remember-password -dir "R6Downloads\Y5S2_MUTE" -validate -max-servers 15 -max-downloads 10
  echo.
  echo Download complete Thanks Zer0 ^^!
  echo MUTE Protocol 4k
  pause
  cls
  set Downloaded=MUTE Protocol 4K
  goto DownloadCheck
  )
  if %ERRORLEVEL% == 20 (
  set Position=GameMenu
  goto BackTo
  )
  goto 4kVersion
::4kVersion END

::4kRelease START
:4kRelease
  cls
  Title Rainbow Six Siege 4K Release Downloader
  MODE 50,38
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
  echo.
  echo Download complete^^!
  echo It's Skull Rain 4K^^!
  pause
  cls
  set Downloaded=Skull Rain 4K
  goto DownloadCheck
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
  echo.
  echo Download complete^^!
  echo It's Health 4K^^!
  pause
  cls
  set Downloaded=Health 4K
  goto DownloadCheck
  )
  if %ERRORLEVEL%==8 (
  :BloodOrchid4k
  MODE 100,40
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377239 -manifest 3065193946575458487 -username %username% -remember-password -dir "R6Downloads\Y2S3_Blood_Orchid" -validate -max-servers 15 -max-downloads 10
  echo.
  echo Download complete^^!
  echo It's Blood Orchid 4K^^!
  pause
  cls
  set Downloaded=Blood Orchid 4K
  goto DownloadCheck
  )
  if %ERRORLEVEL%==9 (
  :WhiteNoise4k
  MODE 100,40
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377239 -manifest 1118649577165385479 -username %username% -remember-password -dir "R6Downloads\Y2S4_White_Noise" -validate -max-servers 15 -max-downloads 10
  echo.
  echo Download complete^^!
  echo It's White Noise 4K^^!
  pause
  cls
  set Downloaded=White Noise 4K
  goto DownloadCheck
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
  echo.
  echo Download complete^^!
  echo It's Grim Sky 4K^^!
  pause
  cls
  set Downloaded=Grim Sky 4K
  goto DownloadCheck
  )
  if %ERRORLEVEL%==13 (
  goto WindBastion4k
  )
  if %ERRORLEVEL%==14 (
  :BurntHorizon4k
  MODE 100,40
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377239 -manifest 888629411354320742 -username %username% -remember-password -dir "R6Downloads\Y4S1_Burnt_Horizon" -validate -max-servers 15 -max-downloads 10
  echo.
  echo Download complete^^!
  echo It's Burnt Horizon 4K^^!
  pause
  cls
  set Downloaded=Burnt Horizon 4K
  goto DownloadCheck
  )
  if %ERRORLEVEL%==15 (
  goto PhantomSight4k
  )
  if %ERRORLEVEL%==16 (
  :EmberRise4k
  MODE 100,40
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377239 -manifest 8340682081776225833 -username %username% -remember-password -dir "R6Downloads\Y4S3_Ember_Rise" -validate -max-servers 15 -max-downloads 10
  echo.
  echo Download complete^^!
  echo It's Ember Rise 4K^^!
  pause
  cls
  set Downloaded=Ember Rise 4K
  goto DownloadCheck
  )
  if %ERRORLEVEL%==17 (
  goto ShiftingTides4k
  )
  if %ERRORLEVEL%==18 (
  :VoidEdge4k
  MODE 100,40
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377239 -manifest 2194493692563107142 -username %username% -remember-password -dir "R6Downloads\Y5S1_Void_Edge" -validate -max-servers 15 -max-downloads 10
  echo.
  echo Download complete^^!
  echo It's Void Edge 4K^^!
  pause
  cls
  set Downloaded=Void Edge 4K
  goto DownloadCheck
  )
  if %ERRORLEVEL%==19 (
  :SteelWave4k
  MODE 100,40
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377239 -manifest 3257522596542046976 -username %username% -remember-password -dir "R6Downloads\Y5S2_Steel_Wave" -validate -max-servers 15 -max-downloads 10
  echo.
  echo Download complete^^!
  echo It's Steel Wave 4K^^!
  pause
  cls
  set Downloaded=Steel Wave 4K
  goto DownloadCheck
  )
  if %ERRORLEVEL%==20 (
  :ShadowLegacy4k
  MODE 100,40
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377239 -manifest 5051396185388503167 -username %username% -remember-password -dir "R6Downloads\Y5S3_Shadow_Legacy" -validate -max-servers 15 -max-downloads 10
  echo.
  echo Download complete^^!
  echo It's Shadow Legacy 4K^^!
  pause
  cls
  set Downloaded=Shadow Legacy 4K
  goto DownloadCheck
  )
  if %ERRORLEVEL%==21 (
  :NeonDawn4k
  MODE 100,40
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377239 -manifest 7681923351308243133 -username %username% -remember-password -dir "R6Downloads\Y5S4_Neon_Dawn" -validate -max-servers 15 -max-downloads 10
  echo.
  echo Download complete^^!
  echo It's Neon Dawn 4K^^!
  pause
  cls
  set Downloaded=Neon Dawn 4K
  goto DownloadCheck
  )
  if %ERRORLEVEL% == 22 (
  set Position=TextureMenu
  goto BackTo
  )
  goto 4kRelease
::4kRelease END

::4kEvent START
:4kEvent
  cls
  Title Rainbow Six Siege 4K Event Downloader
  MODE 50,38
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
  echo.
  echo Download complete^^!
  echo It's Sugar Fright / Telly 4K^^!
  pause
  cls
  set Downloaded=Sugar Fright / Telly 4K
  goto DownloadCheck
  )
  if %ERRORLEVEL% == 10 (
  set Position=GameMenu
  goto BackTo
  )
  goto 4kEvent
::4kEvent END



::UninstallMenu START
:UninstallMenu
  cls
  Title Rainbow Six Siege UninstallMenu
  MODE 50,40
  echo [93m-----------------------NOTES----------------------[0m
  echo                   Uninstall Menu
  echo    Please select the correct downloaded folder.
  echo [93m----------------------SELECT----------------------[0m
  Resources\cmdmenusel f8f0 "   Y1S0_Vanilla"    "   Y1S1_Black_Ice"    "   Y1S2_Dust_Line"    "   Y1S3_Skull_Rain"    "   Y1S3_SkullRain"    "   Y1S4_Red_Crow"    "   Y2S1_Velvet_Shell"    "   Y2S2_Health"    "   Y2S2_Health_2"    "   Y2S3_Blood_Orchid"    "   Y2S3_BloodOrchid"    "   Y2S4_White_Noise"    "   Y2S4_WhiteNoise"    "   Y3S1_Chimera"    "   Y3S2_Para_Bellum"    "   Y3S3_Grim_Sky"    "   Y3S3_MadHouse"    "   Y3S4_Wind_Bastion"    "   Y4S1_Burnt_Horizon"    "   Y4S1_RainbowIsMagic"    "   Y4S2_Phantom_Sight"    "   Y4S3_Ember_Rise"    "   Y4S3_DoktorsCurse"    "   Y4S4_Shifting_Tides"    "   Y5S1_Void_Edge"    "   Y5S1_GangDestruction"    "   Y5S2_Steel_Wave"    "   Y5S2_MUTE"    "   Y5S2_SteelWave"    "   Y5S3_Shadow_Legacy"    "   Y5S3_Sugar_Fright" "   Y5S4_Neon_Dawn"   "   Back"

  if %ERRORLEVEL%==1 (
  set DeleteDir="R6Downloads\Y1S0_Vanilla"
  goto SelectToCheck
  )
  if %ERRORLEVEL%==2 (
  set DeleteDir="R6Downloads\Y1S1_Black_Ice"
  goto SelectToCheck
  )
  if %ERRORLEVEL%==3 (
  set DeleteDir="R6Downloads\Y1S2_Dust_Line"
  goto SelectToCheck
  )
  if %ERRORLEVEL%==4 (
  set DeleteDir="R6Downloads\Y1S3_Skull_Rain"
  goto SelectToCheck
  )
  if %ERRORLEVEL%==5 (
  set DeleteDir="R6Downloads\Y1S3_SkullRain"
  goto SelectToCheck
  )
  if %ERRORLEVEL%==6 (
  set DeleteDir="R6Downloads\Y1S4_Red_Crow"
  goto SelectToCheck
  )
  if %ERRORLEVEL%==7 (
  set DeleteDir="R6Downloads\Y2S1_Velvet_Shell"
  goto SelectToCheck
  )
  if %ERRORLEVEL%==8 (
  set DeleteDir="R6Downloads\Y2S2_Health"
  goto SelectToCheck
  )
  if %ERRORLEVEL%==9 (
  set DeleteDir="R6Downloads\Y2S2_Health_2"
  goto SelectToCheck
  )
  if %ERRORLEVEL%==10 (
  set DeleteDir="R6Downloads\Y2S3_Blood_Orchid"
  goto SelectToCheck
  )
  if %ERRORLEVEL%==11 (
  set DeleteDir="R6Downloads\Y2S3_BloodOrchid"
  goto SelectToCheck
  )
  if %ERRORLEVEL%==12 (
  set DeleteDir="R6Downloads\Y2S4_White_Noise"
  goto SelectToCheck
  )
  if %ERRORLEVEL%==13 (
  set DeleteDir="R6Downloads\Y2S4_WhiteNoise"
  goto SelectToCheck
  )
  if %ERRORLEVEL%==14 (
  set DeleteDir="R6Downloads\Y3S1_Chimera"
  goto SelectToCheck
  )
  if %ERRORLEVEL%==15 (
  set DeleteDir="R6Downloads\Y3S2_Para_Bellum"
  goto SelectToCheck
  )
  if %ERRORLEVEL%==16 (
  set DeleteDir="R6Downloads\Y3S3_Grim_Sky"
  goto SelectToCheck
  )
  if %ERRORLEVEL%==17 (
  set DeleteDir="R6Downloads\Y3S3_MadHouse"
  goto SelectToCheck
  )
  if %ERRORLEVEL%==18 (
  set DeleteDir="R6Downloads\Y3S4_Wind_Bastion"
  goto SelectToCheck
  )
  if %ERRORLEVEL%==19 (
  set DeleteDir="R6Downloads\Y4S1_Burnt_Horizon"
  goto SelectToCheck
  )
  if %ERRORLEVEL%==20 (
  set DeleteDir="R6Downloads\Y4S1_RainbowIsMagic"
  goto SelectToCheck
  )
  if %ERRORLEVEL%==21 (
  set DeleteDir="R6Downloads\Y4S2_Phantom_Sight"
  goto SelectToCheck
  )
  if %ERRORLEVEL%==22 (
  set DeleteDir="R6Downloads\Y4S3_Ember_Rise"
  goto SelectToCheck
  )
  if %ERRORLEVEL%==23 (
  set DeleteDir="R6Downloads\Y4S3_DoktorsCurse"
  goto SelectToCheck
  )
  if %ERRORLEVEL%==24 (
  set DeleteDir="R6Downloads\Y4S4_Shifting_Tides"
  goto SelectToCheck
  )
  if %ERRORLEVEL%==25 (
  set DeleteDir="R6Downloads\Y5S1_Void_Edge"
  goto SelectToCheck
  )
  if %ERRORLEVEL%==26 (
  set DeleteDir="R6Downloads\Y5S1_GangDestruction"
  goto SelectToCheck
  )
  if %ERRORLEVEL%==27 (
  set DeleteDir="R6Downloads\Y5S2_Steel_Wave"
  goto SelectToCheck
  )
  if %ERRORLEVEL%==28 (
  set DeleteDir="R6Downloads\Y5S2_MUTE"
  goto SelectToCheck
  )
  if %ERRORLEVEL%==29 (
  set DeleteDir="R6Downloads\Y5S2_SteelWave"
  goto SelectToCheck
  )
  if %ERRORLEVEL%==30 (
  set DeleteDir="R6Downloads\Y5S3_Shadow_Legacy"
  goto SelectToCheck
  )
  if %ERRORLEVEL%==31 (
  set DeleteDir="R6Downloads\Y5S3_Sugar_Fright"
  goto SelectToCheck
  )
  if %ERRORLEVEL%==32 (
  set DeleteDir="R6Downloads\Y5S4_Neon_Dawn"
  goto SelectToCheck
  )
  if %ERRORLEVEL%==33 (
  set Position=GameMenu
  goto BackTo
  )
  goto UninstallMenu
::UninstallMenu END

::DeleteFolder START
:DeleteFolder
  MODE 60,20
  cls
  rd /s /q %DeleteDir% 2>nul || echo Error^^!
  if errorlevel 2 (
    echo Make sure you^'ve selected the correct download folder.
    pause
    goto Failed
    )
  if errorlevel 0 (
    echo Waiting to fully delete the folder.
    timeout /t 4 >nul 
    echo Folder deleted^^!
    pause
    goto DeleteDone
  )
::DeleteFolder END



::FULL STARTGAME START
::StartGame START
:StartGame
  cls
  Title Rainbow Six Siege Game Starter
  MODE 50,40
  echo [93m-----------------------NOTES----------------------[0m
  echo                   Game Starter
  echo    Please select the correct downloaded folder.
  echo [93m----------------------SELECT----------------------[0m
  Resources\cmdmenusel f8f0 "   Y1S0_Vanilla"    "   Y1S1_Black_Ice"    "   Y1S2_Dust_Line"    "   Y1S3_Skull_Rain"    "   Y1S3_SkullRain"    "   Y1S4_Red_Crow"    "   Y2S1_Velvet_Shell"    "   Y2S2_Health"    "   Y2S2_Health_2"    "   Y2S3_Blood_Orchid"    "   Y2S3_BloodOrchid"    "   Y2S4_White_Noise"    "   Y2S4_WhiteNoise"    "   Y3S1_Chimera"    "   Y3S2_Para_Bellum"    "   Y3S3_Grim_Sky"    "   Y3S3_MadHouse"    "   Y3S4_Wind_Bastion"    "   Y4S1_Burnt_Horizon"    "   Y4S1_RainbowIsMagic"    "   Y4S2_Phantom_Sight"    "   Y4S3_Ember_Rise"    "   Y4S3_DoktorsCurse"    "   Y4S4_Shifting_Tides"    "   Y5S1_Void_Edge"    "   Y5S1_GangDestruction"    "   Y5S2_Steel_Wave"    "   Y5S2_MUTE"    "   Y5S2_SteelWave"    "   Y5S3_Shadow_Legacy"    "   Y5S3_Sugar_Fright"   "   Y5S4_Neon_Dawn"   "   Back"

  if %ERRORLEVEL%==1 (
  set StartDir=R6Downloads\Y1S0_Vanilla
  goto SelectToCheck
  )
  if %ERRORLEVEL%==2 (
  set StartDir=R6Downloads\Y1S1_Black_Ice
  goto SelectToCheck
  )
  if %ERRORLEVEL%==3 (
  set StartDir=R6Downloads\Y1S2_Dust_Line
  goto SelectToCheck
  )
  if %ERRORLEVEL%==4 (
  set StartDir=R6Downloads\Y1S3_Skull_Rain
  goto SelectToCheck
  )
  if %ERRORLEVEL%==5 (
  set StartDir=R6Downloads\Y1S3_SkullRain
  goto SelectToCheck
  )
  if %ERRORLEVEL%==6 (
  set StartDir=R6Downloads\Y1S4_Red_Crow
  goto SelectToCheck
  )
  if %ERRORLEVEL%==7 (
  set StartDir=R6Downloads\Y2S1_Velvet_Shell
  goto SelectToCheck
  )
  if %ERRORLEVEL%==8 (
  set StartDir=R6Downloads\Y2S2_Health
  goto SelectToCheck
  )
  if %ERRORLEVEL%==9 (
  set StartDir=R6Downloads\Y2S2_Health_2
  goto SelectToCheck
  )
  if %ERRORLEVEL%==10 (
  set StartDir=R6Downloads\Y2S3_Blood_Orchid
  goto SelectToCheck
  )
  if %ERRORLEVEL%==11 (
  set StartDir=R6Downloads\Y2S3_BloodOrchid
  goto SelectToCheck
  )
  if %ERRORLEVEL%==12 (
  set StartDir=R6Downloads\Y2S4_White_Noise
  goto SelectToCheck
  )
  if %ERRORLEVEL%==13 (
  set StartDir=R6Downloads\Y2S4_WhiteNoise
  goto SelectToCheck
  )
  if %ERRORLEVEL%==14 (
  set StartDir=R6Downloads\Y3S1_Chimera
  goto SelectToCheck
  )
  if %ERRORLEVEL%==15 (
  set StartDir=R6Downloads\Y3S2_Para_Bellum
  goto SelectToCheck
  )
  if %ERRORLEVEL%==16 (
  set StartDir=R6Downloads\Y3S3_Grim_Sky
  goto SelectToCheck
  )
  if %ERRORLEVEL%==17 (
  set StartDir=R6Downloads\Y3S3_MadHouse
  goto SelectToCheck
  )
  if %ERRORLEVEL%==18 (
  set StartDir=R6Downloads\Y3S4_Wind_Bastion
  goto SelectToCheck
  )
  if %ERRORLEVEL%==19 (
  set StartDir=R6Downloads\Y4S1_Burnt_Horizon
  goto SelectToCheck
  )
  if %ERRORLEVEL%==20 (
  set StartDir=R6Downloads\Y4S1_RainbowIsMagic
  goto SelectToCheck
  )
  if %ERRORLEVEL%==21 (
  set StartDir=R6Downloads\Y4S2_Phantom_Sight
  goto SelectToCheck
  )
  if %ERRORLEVEL%==22 (
  set StartDir=R6Downloads\Y4S3_Ember_Rise
  goto SelectToCheck
  )
  if %ERRORLEVEL%==23 (
  set StartDir=R6Downloads\Y4S3_DoktorsCurse
  goto SelectToCheck
  )
  if %ERRORLEVEL%==24 (
  set StartDir=R6Downloads\Y4S4_Shifting_Tides
  goto SelectToCheck
  )
  if %ERRORLEVEL%==25 (
  set StartDir=R6Downloads\Y5S1_Void_Edge
  goto SelectToCheck
  )
  if %ERRORLEVEL%==26 (
  set StartDir=R6Downloads\Y5S1_GangDestruction
  goto SelectToCheck
  )
  if %ERRORLEVEL%==27 (
  set StartDir=R6Downloads\Y5S2_Steel_Wave
  goto SelectToCheck
  )
  if %ERRORLEVEL%==28 (
  set StartDir=R6Downloads\Y5S2_MUTE
  goto SelectToCheck
  )
  if %ERRORLEVEL%==29 (
  set StartDir=R6Downloads\Y5S2_SteelWave
  goto SelectToCheck
  )
  if %ERRORLEVEL%==30 (
  set StartDir=R6Downloads\Y5S3_Shadow_Legacy
  goto SelectToCheck
  )
  if %ERRORLEVEL%==31 (
  set StartDir=R6Downloads\Y5S3_Sugar_Fright
  goto SelectToCheck
  )
  if %ERRORLEVEL%==32 (
  set StartDir=R6Downloads\Y5S4_Neon_Dawn
  goto SelectToCheck
  )
  if %ERRORLEVEL%==33 (
  set Position=GameMenu
  goto BackTo
  )
  goto StartGame
::StartGame END

::BE Disable/ RSG Skip START
  :BEcheck
  if exist "%StartDir%\RainbowSix_BE.exe" (
    set Position=StartChoose
    set LOGINFO=RainbowSix_BE.exe Founded
    set LogNumber=1
    goto logtolog
    )
    goto nothaveBE

  :nothaveBE
  if exist "%StartDir%\RainbowSixGame.exe" (
    set startexe=%StartDir%\RainbowSixGame.exe
    set Position=GameStarter
    set LOGINFO=RainbowSixGame.exe Founded
    set LogNumber=1
    goto logtolog
    ) else (
    goto StartGame
    )
    goto nothaveBE
::BE Disable/ RSG Skip END

::StartChoose START
:StartChoose
  cls
  MODE 50,10
  echo [93m-----------------------NOTES----------------------[0m
  echo                   Start Choose
  echo        DirectX is a normal default R6:S
  echo [93m----------------------SELECT----------------------[0m
  Resources\cmdmenusel f8f0 "   DirectX" "   Vulkan" "   Back"

  if %ERRORLEVEL%==1 (
  set startexe=%StartDir%\RainbowSix.exe
  goto GameStarter
  )
  if %ERRORLEVEL%==2 (
  set startexe=%StartDir%\RainbowSix_Vulkan.exe
  goto GameStarter
  )
  if %ERRORLEVEL%==3 (
  set Position=GameMenu
  goto BackTo
  )
  goto StartChoose
::StartChoose END

::GameStarter START
:GameStarter
  cls
  MODE 60,20
  echo Starting : %startexe%
  start %startexe% /belaunch
  pause
  set Position=GameMenu
  set LOGINFO=%startexe% Started
  set LogNumber=1
  goto logtolog
::GameStarter END
::FULL STARTGAME END


:Extra
  cls
  echo Extra is Currently unavaible ^^!
  pause
  goto MainMenu



::dxvcredist START
:dxvcredist
  cls
  Title DirectX + VC Redist Downloader
  MODE 41,10
  echo [93m------------------NOTES------------------[0m
  echo     DirectX + VC Redist Downloader
  echo [93m------------------SELECT-----------------[0m
  Resources\cmdmenusel f8f0 "   DirectX" "   VC 2010 Redist" "   VC 2012 Redist" "   VC 2015 Redist"  "   VC 2017 Redist" " Back"

  if %ERRORLEVEL% == 1 (
  MODE 100,40
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 228990 -manifest 1829726630299308803 -username %username% -remember-password -dir "R6Downloads\DirectX" -validate -max-servers 15 -max-downloads 10
  echo.
  echo Download complete^^!
  echo It's DirectX^^!
  pause
  cls
  set Downloaded=DirectX
  goto DownloadCheck
  )
  if %ERRORLEVEL% == 2 (
  MODE 100,40
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 228983 -manifest 8124929965194586177 -username %username% -remember-password -dir "R6Downloads\VC_2010_Redist" -validate -max-servers 15 -max-downloads 10
  echo.
  echo Download complete^^!
  echo It's VC 2010 Redist^^!
  pause
  cls
  set Downloaded=VC 2010 Redist
  goto DownloadCheck
  )
  if %ERRORLEVEL% == 3 (
  MODE 100,40
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 228984 -manifest 2547553897526095397 -username %username% -remember-password -dir "R6Downloads\VC_2012_Redist" -validate -max-servers 15 -max-downloads 10
  echo.
  echo Download complete^^!
  echo It's VC 2012 Redist^^!
  pause
  cls
  set Downloaded=VC 2012 Redist
  goto DownloadCheck
  )
  if %ERRORLEVEL% == 4 (
  MODE 100,40
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 228986 -manifest 8782296191957114623 -username %username% -remember-password -dir "R6Downloads\VC_2015_Redist" -validate -max-servers 15 -max-downloads 10
  echo.
  echo Download complete^^!
  echo It's VC 2015 Redist^^!
  pause
  cls
  set Downloaded=VC 2015 Redist
  goto DownloadCheck
  )
  if %ERRORLEVEL% == 5 (
  MODE 100,40
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 228987 -manifest 4302102680580581867 -username %username% -remember-password -dir "R6Downloads\VC_2017_Redist" -validate -max-servers 15 -max-downloads 10
  echo.
  echo Download complete^^!
  echo It's VC 2017 Redist^^!
  pause
  cls
  set Downloaded=VC 2017 Redist
  goto DownloadCheck
  )
  if %ERRORLEVEL% == 6 (
  set Position=MainMenu
  goto BackTo
  )
  goto dxvcredist
::dxvcredist END


::ZeroFolderRenamer START
:ZeroFolderRenamer
  set Position=MainMenu
  cls
  Title Zero Folder Renamer
  MODE 50,30
  echo Make sure you not Downloaded two times^^!
  pause
  echo Waiting to fully rename the folders.
  ren "R6Downloads\Y1S1_BlackIce" "Y1S1_Black_Ice" 2>nul
  ren "R6Downloads\Y1S2_DustLine" "Y1S2_Dust_Line" 2>nul
  ren "R6Downloads\Y1S4_RedCrow" "Y1S4_Red_Crow" 2>nul
  ren "R6Downloads\Y2S1_VelvetShell" "Y2S1_Velvet_Shell" 2>nul
  ren "R6Downloads\Y2S2_Health_FixingAndRepairingTheGame" "Y2S2_Health_2" 2>nul
  ren "R6Downloads\Y2S4_WhiteNoise" "Y2S4_White_Noise" 2>nul
  ren "R6Downloads\Y3S1_Chimera_Outbreak" "Y3S1_Chimera" 2>nul
  ren "R6Downloads\Y3S2_ParaBellum" "Y3S2_Para_Bellum" 2>nul
  ren "R6Downloads\Y3S3_GrimSky_MadHouse" "Y3S3_MadHouse" 2>nul
  ren "R6Downloads\Y3S4_WindBastion" "Y3S4_Wind_Bastion" 2>nul
  ren "R6Downloads\Y4S1_BurntHorizon_RainbowisMagic" "Y4S1_RainbowIsMagic" 2>nul
  ren "R6Downloads\Y4S2_PhantomSight_Showdown" "Y4S2_Phantom_Sight" 2>nul
  ren "R6Downloads\Y4S3_EmberRise_DoktorsCurse" "Y4S3_DoktorsCurse" 2>nul
  ren "R6Downloads\Y4S4_ShiftingTides_Stadium" "Y4S4_Shifting_Tides" 2>nul
  ren "R6Downloads\Y5S1_VoidEdge_GangDestruction" "Y5S1_GangDestruction" 2>nul
  ren "R6Downloads\Y5S2_SteelWave_Morphues" "Y5S2_MUTE" 2>nul
  ren "R6Downloads\Y5S2_SteelWave_Morphues_V2311" "Y5S2_Steel_Wave" 2>nul
  echo Renamer end ^^!
  pause >nul | echo Press any key to go back to MainMenu
  set LOGINFO=Fully rename the folders.
  set LogNumber=1
  goto logtolog
::ZeroFolderRenamer END


::CREDIT START
::© 2020 SlejmUr
:Credit
  cls
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
  cls
  Title Update
  MODE 75,20
  curl -L  "https://raw.githubusercontent.com/SlejmUr/R6-AIOTool/master/TXTS/notes"
  echo.
  pause
  goto MainMenu
::Update END


:CodexRenamer
  cls
  echo CODEX Renamer is Currently unavaible ^^!
  pause
  goto MainMenu


::BattlEyeChecker START
:BattlEyeChecker
  set Position=MainMenu
  cls
  color 09
  MODE 36,8
  set EXE=RainbowSix_BE.exe
  FOR /F %%x IN ('tasklist /NH /FI "IMAGENAME eq %EXE%"') DO IF %%x == %EXE% goto FOUND
  goto NOTFOUND
  :NOTFOUND
  echo ------------------------------------
  echo [-] BattleEye is Not running
  echo ------------------------------------
  pause
  set LOGINFO=BattleEye is Not running
  set LogNumber=1
  goto logtolog
  :FOUND
  echo ------------------------------------
  echo [+] BattleEye is running
  echo ------------------------------------
  pause
  set LOGINFO=BattleEye is running
  set LogNumber=2
  goto logtolog
::BattlEyeChecker END

::LOG THINGS START
  :LogCheck
    if exist "log.log" (
    goto SizeCheck
    ) else (
    echo.>>log.log
    goto logstart
    )

  :SizeCheck
  set maxlogsize=102400
  FOR /F "usebackq" %%A IN ('log.log') DO set size=%%~zA
  IF %size% LSS %maxlogsize% ( 
    echo.>>log.log
    set Position=logstart
    set LogNumber=1
    set "LOGINFO=Log file smaller than %maxlogsize% Byte, Continue..."
    goto logtolog
    ) else ( 
    set Position=LogZipping
    set LogNumber=2
    set "LOGINFO=Log file bigger than %maxlogsize% Byte, Zipping..."
    goto logtolog
    )

  :LogZipping
    if exist "Resources\7z.exe" (
      mkdir logs
      "Resources\7z.exe" a -tzip -y %logzip%.zip log.log -mmt >nul
      move %logzip%.zip logs >nul
      del log.log >nul
      goto logstart
    ) else (
      mkdir Resources
      goto Emer7zip
    )

  :logtolog
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

  :GoingTo
    set LOGINFO=Going to %Position%
    set LogNumber=1
    goto logtolog

  :BackTo
    set LOGINFO=Back to %Position%
    set LogNumber=1
    goto logtolog

  :SelectToCheck
    if [%DeleteDir%]==[] (
    goto StartDirCheck
    ) else (
    goto DeleteDirCheck
    )
    if [%StartDir%]==[] (
    goto DownloadCheck
    ) else (
    goto StartDirCheck
    )


  :StartDirCheck
    if exist "%StartDir%\RainbowSix.exe" (
      set "Selected=%StartDir%"
      goto StartDirFound
    ) else (
      goto Failed
    )
    goto Failed

  :StartDirFound
    set Position=BEcheck
    set LOGINFO=%Selected% Selected to Started
    set LogNumber=1
    goto logtolog


  :DownloadCheck
    if [%Downloaded%]==[] (
    goto Failed
    ) else (
    set "Selected=%Downloaded%"
    goto DownloadFound
    )
    goto DownloadCheck

  :DownloadFound
    set Position=GameMenu
    set LOGINFO=%Selected% Downloaded
    set LogNumber=1
    goto logtolog


  :DeleteDirCheck
    if [%DeleteDir%]==[] (
    goto Failed
    ) else (
    set "Selected=%DeleteDir%"
    goto DeleteDirFound
    )
    goto DeleteDirCheck

  :DeleteDirFound
    set Position=DeleteFolder
    set LOGINFO=%Selected% Selected to Deleted
    set LogNumber=1
    goto logtolog

  :DeleteDone
    set Position=GameMenu
    set LOGINFO=%Selected% Successfully Deleted
    set LogNumber=1
    goto logtolog

  :Failed
    set Position=GameMenu
    set LOGINFO=Selected folder doesn't exist, moved to GameMenu
    set LogNumber=2
    goto logtolog
::LOG THINGS END

::Exiting
:exiting
  echo. >>log.log
  exit
