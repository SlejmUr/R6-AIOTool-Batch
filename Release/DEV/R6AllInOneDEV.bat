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
	goto log
::TIME SET END



::LOG start
:log
  if exist "log.log" (
  ren "log.log" "%ALL%-log.log"
  mkdir logs
  move "%ALL%-log.log" "logs"
  cls
  echo ------------------------------------------------>>log.log
  echo You are using %AllInOneVersion% version>>log.log
  goto github
  ) else (
  echo ------------------------------------------------>>log.log
  echo You are using %AllInOneVersion% version>>log.log
  goto github
  )
::LOG end



::Github Connect START
:github
  ping github.com>nul
  if errorlevel 1 (
  echo I cant connect github, Continue at OW RISK!
  echo I cant connect github, Continue at OW RISK! - %TIME% >>log.log
  pause
  goto MainCMD
  ) 
  if errorlevel 0 (
  echo I can connect github, YEY
  echo I can connect github, YEY - %TIME% >>log.log
  goto SiniCheck
  )
::Github Connect END



::Settings.ini get START
:SiniCheck
  MODE 62,50
  if exist "Resources\Setting.ini" (
    goto SiniSet
  ) else (
    mkdir Resources
    goto noSini
  )

:noSini
  MODE 78,20
  echo ------------------------------------------------------------------------------
  echo                              Downloading Setting.ini...
  echo ------------------------------------------------------------------------------
  curl -L  "https://github.com/SlejmUr/R6-AIOTool/raw/master/Requirements/Settings.ini" --output Setting.ini
  echo Download Setting.ini - %TIME%>>log.log
  cls
  goto moveS
  cls
  )

:moveS
  move Setting.ini Resources
  echo Setting.ini Moved - %TIME%>>log.log
  goto SiniCheck
::Setting.ini get END



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
	set cmdmenusel=1
  echo ------------SET START----------------->>log.log
  echo S.ini set to default things >>log.log
goto dotnetSET
::S:INI SET / Finder END

::SET Things START
:: SET CHECKERS START

::Set dotnet
:dotnetSET
	findstr /m "Dotnet=1" Resources\Setting.ini >Nul
	if %errorlevel%==0 (
	echo "Dotnet" set to 1
	echo "Dotnet" set to 1 >>log.log
	set Dotnet=1
	)
	if %errorlevel%==1 (
	echo "Dotnet" set to 0
	echo "Dotnet" set to 0 >>log.log
	set Dotnet=0
	)
	goto 7zipSET
::Set 7zip
:7zipSET
	findstr /m "zip=1" Resources\Setting.ini >Nul
	if %errorlevel%==0 (
	echo "zip" set to 1
	echo "zip" set to 1  >>log.log
	set zip=1
	)
	if %errorlevel%==1 (
	echo "zip" set to 0
	echo "zip" set to 0 >>log.log
	set zip=0
	)
	goto DepotSET
::Set Depot
:DepotSET
	findstr /m "Depot=1" Resources\Setting.ini >Nul
	if %errorlevel%==0 (
	echo "Depot" set to 1
	echo "Depot" set to 1 >>log.log
	set Depot=1
	)
	if %errorlevel%==1 (
	echo "Depot" set to 0
	echo "Depot" set to 0 >>log.log
	set Depot=0
	)
	goto PlazaSET
::Set Plaza
:PlazaSET
	findstr /m "Plaza=1" Resources\Setting.ini >Nul
	if %errorlevel%==0 (
	echo "Plaza" set to 1
	echo "Plaza" set to 1 >>log.log
	set Plaza=1
	)
	if %errorlevel%==1 (
	echo "Plaza" set to 0
	echo "Plaza" set to 0 >>log.log
	set Plaza=0
	)
	goto SteamSET
:: SET CHECKERS END

:: SET SET START
::Set Get SteamName
:SteamSET
	findstr /m "SteamName=1" Resources\Setting.ini >Nul
	if %errorlevel%==0 (
	echo "SteamName" set to 1
	echo "SteamName" set to 1 >>log.log
	set SteamName=1
	)
	if %errorlevel%==1 (
	echo "SteamName" set to 0
	echo "SteamName" set to 0 >>log.log
	set SteamName=0
	)
	goto DevVersionSET
::Set Dev Version
:DevVersionSET
	findstr /m "DevVersion=1" Resources\Setting.ini >Nul
	if %errorlevel%==0 (
	echo "DevVersion" set to 1
	echo "DevVersion" set to 1 >>log.log
	set DevVersion=1
	)
	if %errorlevel%==1 (
	echo "DevVersion=1" set to 0
	echo "DevVersion=1" set to 0 >>log.log
	set DevVersion=0
	)
  echo ------------SET END----------------->>log.log
	goto MateBypass
::matec bypass
:MateBypass
	if exist "C:\Users\matec\" (
	set DevVersion=1
	echo matec was found
	echo matec was found, automaticly Dev things enabled>>log.log
	) else (
	set DevVersion=0
	echo matec wasn't found
	)
	goto ifdotnet
:: SET SET END
::SET Things END



::Dotnet start
:ifdotnet
	if %dotnet%==1 (
	goto verifydotnet
	) else (
	goto if7zip
	)

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
  goto if7zip
  ) else (
  echo Oh no, exist checker not found dotnet - %TIME% >>log.log
  goto dotnet
  )
::dotnet end


::7zip start
:if7zip
	if %zip%==1 (
	goto 7zipcheck
	) else (
	goto ifDD
	)

:7zipcheck
  MODE 62,50
  if exist "Resources\7z.exe" (
    goto ifDD
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
:ifDD
	if %zip%==1 (
	goto DepotCheck
	) else (
	goto ifPlaza
	)


:DepotCheck
  cls
  if exist "Resources\DepotDownloader\DepotDownloader.dll" (
    goto ifPlaza 
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
:ifPlaza
	if %zip%==1 (
	goto PlazaCheck
	) else (
	goto ifcmd
	)

:PlazaCheck
  cls
  if exist "Resources\Plazas\PLAZA_BO\CODEX.ini" (
    goto ifcmd 
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



::cmdmenusel START
:ifcmd
	if %cmdmenusel%==1 (
	goto cmdCheck
	) else (
	goto ifSteam
	)

:cmdCheck
  cls
  if exist "Resources\cmdmenusel.exe" (
    goto ifSteam 
  ) else (
    goto GetCmd
  )
:GetCmd
  cls
  MODE 78,20
  echo ------------------------------------------------------------------------------
  echo                        Downloading cmdmenusel...
  echo ------------------------------------------------------------------------------
  curl -L  "https://github.com/SlejmUr/R6-AIOTool/raw/master/Requirements/cmdmenusel.exe" --output cmdmenusel.exe
  echo Download cmdmenusel - %TIME%>>log.log
  cls
  goto movecmd

:movecmd
  move cmdmenusel.exe Resources
  goto cmdCheck
::cmdmenusel END



::SetSteam START
:ifSteam
	if %SteamName%==1 (
	goto SetSteam
	) else (
  set username=matecraft1111
	goto MainCMD
	)
:SetSteam
	MODE 78,20
	echo Please type your Steam Legacy name!
	set /p username="Enter Steam Username:"
	cls
	goto MainMenu
::SetSteam END



::MainMenu START
:MainMenu
  cls
  Title R6S AllInOne Downloader
  MODE 62,42
  echo MainMenu Loaded>>log.log
  set LastSelector=MainMenu
  echo [93m----------------------------NOTES-----------------------------[0m
  echo  Rainbow Six Siege Old Version Downloader
  echo  [31mYou MUST have a copy of Siege on Steam to use the downloader.[0m
  echo  This tools is forked from [91mZer0Bytes[0m manifest tool
  echo  Our Discord Server: [94m%discord%[0m 
  echo  AIO Tool Version: [32m%AllInOneVersion%[0m 
  echo  Steam User: [96m%username%[0m
  echo  Read FAQ!
  echo [93m----------------------------SELECT----------------------------[0m
  echo  [92mWhat would you like to select?[0m 
  echo  [33m(1)[0m [36mFAQ and Notes[0m 
  echo  [33m(2)[0m [36mGame Menu [0m 
  echo  [33m(3)[0m [36mExtra Language[0m 
  echo  [33m(4)[0m [36m4K Textures [0m 
  echo  [33m(5)[0m [36mDirectX and VC Redist Downloader [0m 
  echo  [33m(6)[0m [36mCredits[0m 
  echo  [33m(7)[0m [36mBattlEye Checker[0m 
  echo  [33m(8)[0m [36mOpen LOG![0m 
  echo  [33m(9)[0m [36mChange Steam Username[0m 
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
  goto MainMenu
  )
  if %option%==9 (
  echo Changing Steam UserName - %TIME%>>log.log
  cls
  set /p username="Enter Steam Username:"
  goto MainMenu
  )
  if %option%==10 (
  cls
  goto MainMenu
  )
  if %option%==11 (
  cls
  rd /s /q  "logs\"
  pause
  )
  if %option%==12 (
  cls
  goto MainCMD
  )
  goto MainMenu
::MainMenu END



::MainCMD START
:MainCMD
  cls
  Title R6S AllInOne Tool
  MODE 62,40
  echo MainCMD loaded>>log.log
  set LastSelector=MainMenu
  echo [93m----------------------------NOTES-----------------------------[0m
  echo  Rainbow Six Siege AllInOne Tool
  echo  [31mYou MUST have a copy of Siege on Steam to use the downloader.[0m
  echo  This tools is forked from [91mZer0Bytes[0m manifest tool
  echo  Our Discord Server: [94m%discord%[0m 
  echo  AIO Tool Version: [32m%AllInOneVersion%[0m 
  echo  Steam User: [96m%username%[0m
  echo  Read FAQ!
  echo [93m----------------------------SELECT----------------------------[0m
	Resources\cmdmenusel f830 "  FAQ and Notes" "  Game Menu" "  Extra Language" "  4K Textures" "  DirectX and VC Redist Downloader" "  Credits" "  BattlEye Checker" "  Change Steam Username" "  Old Logs Delete" "  Exit"
  if %ERRORLEVEL% == 1 (
  echo FAQ Choosed>>log.log
  cls
  goto faq
  )
  if %ERRORLEVEL% == 2 (
  echo GameMenu Choosed>>log.log
  cls
  goto GameMenu
  )
  if %ERRORLEVEL% == 3 (
  echo Extra Menu Choosed>>log.log
  cls
  goto Extra
  )
  if %ERRORLEVEL% == 4 (
  echo TextureMenu Choosed>>log.log
  cls
  goto TextureMenu
  )
  if %ERRORLEVEL% == 5 (
  echo dxvcredist Choosed>>log.log
  cls
  goto dxvcredist
  )
  if %ERRORLEVEL% == 6 (
  echo Credit Choosed>>log.log
  cls
  goto Credit
  )
  if %ERRORLEVEL% == 7 (
  echo BattlEyeChecker Choosed>>log.log
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
  echo Logs Delete Choosed>>log.log
  cls
  rd /s /q  "logs\"
  pause
  )
  if %ERRORLEVEL% == 10 (
  echo Back/Exit - %TIME%>>log.log
  exit
  )
	goto MainCMD
::MainCMD END


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
  echo  FAQ readed>>log.log
  pause
  cls
  goto Notes
::and
:Notes
  Title Notes
  MODE 110,20
  echo  Notes:
  echo  I Moved the my "Release" manifests to Manifest Options
  echo  I'm not tested this manifests: (ALL not have GB option) and ALL 4K Textures, and ALL Language
  echo  Planning to add Extra Language option in Events
  echo  Plaza_NEW not working on Shadow Legacy and Steel Wave too
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
  echo InstallMenu Choosed>>log.log
  cls
  goto InstallMenu
  )
  if %ERRORLEVEL% == 2 (
  echo UninstallMenu Choosed>>log.log
  cls
  goto UninstallMenu
  )
  if %ERRORLEVEL% == 3 (
  echo StartGame Choosed>>log.log
  cls
  goto StartGame
  )
  if %ERRORLEVEL% == 4 (
  echo Back - %TIME%>>log.log
  cls
  goto MainCMD
  )
  goto GameMenu
::GameMenu END



::InstallMenu START
:InstallMenu
  cls
  Title Rainbow Six Siege InstallMenu
  MODE 50,40
  echo InstallMenu Loaded>>log.log
  set LastSelector=InstallMenu
  echo [93m-----------------------NOTES----------------------[0m
  echo                   Install Selector
  echo          [31mCustom manifest now is unstable![0m
  echo [93m----------------------SELECT----------------------[0m
  Resources\cmdmenusel f8f0 "   Version Downloader" "   Event Downloader" "   Release Downloader" "   Custom Downloader" "   4K Textures Downloader" "   Extra Language Downloader" "   Back"

  if %ERRORLEVEL% == 1 (
  echo VersionMenu Choosed>>log.log
  cls
  goto VersionMenu
  )
  if %ERRORLEVEL% == 2 (
  echo EventMenu Choosed>>log.log
  cls
  goto EventMenu
  )
  if %ERRORLEVEL% == 3 (
  echo ReleaseMenu Choosed>>log.log
  cls
  goto ReleaseMenu
  )
  if %ERRORLEVEL% == 4 (
  echo CustomMenu Choosed>>log.log
  cls
  goto CustomMenu
  )
  if %ERRORLEVEL% == 5 (
  echo TextureMenu Choosed>>log.log
  cls
  goto TextureMenu
  )
  if %ERRORLEVEL% == 6 (
  echo Extra Choosed>>log.log
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
  MODE 50,40
  echo VersionMenu Loaded>>log.log
  echo [93m-----------------------NOTES----------------------[0m
  echo                   Version Selector
  echo      Manifests is from Zer0Bytes Manifest tool
  echo [93m----------------------SELECT----------------------[0m
  Resources\cmdmenusel f8f0 "   Vanilla" "   Black Ice" "   Dust Line" "   Skull Rain" "   Red Crow" "   Velvet Shell" "   Health" "   Blood Orchid" "   White Noise" "   Chimera" "   Para Bellum" "   Grim Sky" "   Wind Bastion" "   Burnt Horizon" "   Phantom Sight" "   Ember Rise" "   Shifting Tides" "   Void Edge" "   Steel Wave [Mute]" "   Steel Wave [Omega/Mute]" "   Back"

  ::Vanilla
  if %ERRORLEVEL%==1 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 8358812283631269928 -username %username% -remember-password -dir "R6Downloads\Y1S0_Vanilla" -validate -max-servers 15 -max-downloads 10
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 3893422760579204530 -username %username% -remember-password -dir "R6Downloads\Y1S0_Vanilla" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Vanilla [v8194013]
  echo Vanilla Choosed>>log.log
  goto MainMenu
  )
  ::BLACK ICE Released
  if %ERRORLEVEL%==2 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 5188997148801516344 -username %username% -remember-password -dir "R6Downloads\Y1S1_Black_Ice" -validate -max-servers 15 -max-downloads 10
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 7932785808040895147 -username %username% -remember-password -dir "R6Downloads\Y1S1_Black_Ice" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's BLACK ICE Released [IDK how but v11726982]
  echo BLACK ICE Choosed>>log.log
  goto MainMenu
  )
  ::DUST LINE Released
  if %ERRORLEVEL%==3 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 2303064029242396590 -username %username% -remember-password -dir "R6Downloads\Y1S2_Dust_Line" -validate -max-servers 15 -max-downloads 10
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 2206497318678061176 -username %username% -remember-password -dir "R6Downloads\Y1S2_Dust_Line" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's DUST LINE Released [v9132097]
  echo DUST LINE Choosed>>log.log
  goto MainMenu
  )
  ::Skull Rain 4.2
  if %ERRORLEVEL%==4 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 5819137024728546741 -username %username% -remember-password -dir "R6Downloads\Y1S3_SkullRain" -validate -max-servers 15 -max-downloads 10
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 5851804596427790505 -username %username% -remember-password -dir "R6Downloads\Y1S3_SkullRain" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete  Thanks Zer0!
  echo Skull Rain 4.2 [v9860556]
  echo Skull Rain 4.2 Choosed>>log.log
  goto MainMenu
  )
  ::RED CROW Released
  if %ERRORLEVEL%==5 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 3576607363557872807 -username %username% -remember-password -dir "R6Downloads\Y1S4_Red_Crow" -validate -max-servers 15 -max-downloads 10
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 8569920171217002292 -username %username% -remember-password -dir "R6Downloads\Y1S4_Red_Crow" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's RED CROW Released!
  echo RED CROW Choosed>>log.log
  goto MainMenu
  )
  ::VELVET SHELL Released
  if %ERRORLEVEL%==6 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 2248734317261478192 -username %username% -remember-password -dir "R6Downloads\Y2S1_Velvet_Shell" -validate -max-servers 15 -max-downloads 10
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 8006071763917433748 -username %username% -remember-password -dir "R6Downloads\Y2S1_Velvet_Shell" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's VELVET SHELL Released
  echo VELVET SHELL Choosed>>log.log
  goto MainMenu
  )
  ::Health Manifest
  if %ERRORLEVEL%==7 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 5875987479498297665 -username %username% -remember-password -dir "R6Downloads\Y2S2_Health_2" -validate -max-servers 15 -max-downloads 10
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 708773000306432190 -username %username% -remember-password -dir "R6Downloads\Y2S2_Health_2" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete! Thanks Zer0!
  echo Health [Zer0] Choosed>>log.log
  goto MainMenu
  )
  ::Blood Orchid 2.3.1.1
  if %ERRORLEVEL%==8 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 6708129824495912434 -username %username% -remember-password -dir "R6Downloads\Y2S3_BloodOrchid" -validate -max-servers 15 -max-downloads 10
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 1613631671988840841 -username %username% -remember-password -dir "R6Downloads\Y2S3_BloodOrchid" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete Thanks Zer0!
  echo Blood Orchid 2.3.1.1 [Zer0] Choosed>>log.log
  goto MainMenu
  )
  ::WHITE NOISE Manifest
  if %ERRORLEVEL%==9 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 8748734086032257441 -username %username% -remember-password -dir "R6Downloads\Y2S4_WhiteNoise" -validate -max-servers 15 -max-downloads 10
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 4221297486420648079 -username %username% -remember-password -dir "R6Downloads\Y2S4_WhiteNoise" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete Thanks Zer0!
  echo WHITE NOISE [Zer0] Choosed>>log.log
  goto MainMenu
  )
  ::CHIMERA Released
  if %ERRORLEVEL%==10 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 5071357104726974256 -username %username% -remember-password -dir "R6Downloads\Y3S1_Chimera" -validate -max-servers 15 -max-downloads 10
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 4701787239566783972 -username %username% -remember-password -dir "R6Downloads\Y3S1_Chimera" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's CHIMERA  Released
  echo CHIMERA Choosed>>log.log
  goto MainMenu
  )
  ::PARA BELLUM Released
  if %ERRORLEVEL%==11 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 8312108283310615233 -username %username% -remember-password -dir "R6Downloads\Y3S2_Para_Bellum" -validate -max-servers 15 -max-downloads 10
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 8765715607275074515 -username %username% -remember-password -dir "R6Downloads\Y3S2_Para_Bellum" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's PARA BELLUM Released!
  echo PARA BELLUM Choosed>>log.log
  goto MainMenu
  )
  ::GRIM SKY Manifest / Mad House
  if %ERRORLEVEL%==12 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 5562094852451837435 -username %username% -remember-password -dir "R6Downloads\Y3S3_MadHouse" -validate -max-servers 15 -max-downloads 10
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 7781202564071310413 -username %username% -remember-password -dir "R6Downloads\Y3S3_MadHouse" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete Thanks Zer0!
  echo GRIM SKY [Zer0] Choosed>>log.log
  goto MainMenu
  )
  ::WIND BASTION Released
  if %ERRORLEVEL%==13 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 6502258854032233436 -username %username% -remember-password -dir "R6Downloads\Y3S4_Wind_Bastion" -validate -max-servers 15 -max-downloads 10
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 7659555540733025386 -username %username% -remember-password -dir "R6Downloads\Y3S4_Wind_Bastion" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's WIND BASTION Released [v12512571]
  echo WIND BASTION [v12512571] Choosed>>log.log
  goto MainMenu
  )
  ::BURNT HORIZON manifest / Rainbow Is Magic
  if %ERRORLEVEL%==14 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 8356277316976403078 -username %username% -remember-password -dir "R6Downloads\Y4S1_RainbowIsMagic" -validate -max-servers 15 -max-downloads 10
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 5935578581006804383 -username %username% -remember-password -dir "R6Downloads\Y4S1_RainbowIsMagic" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete Thanks Zer0
  echo BURNT HORIZON [Zer0] Choosed>>log.log
  goto MainMenu
  )
  ::PHANTOM SIGHT Released
  if %ERRORLEVEL%==15 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 693082837425613508 -username %username% -remember-password -dir "R6Downloads\Y4S2_Phantom_Sight" -validate -max-servers 15 -max-downloads 10
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 5408324128694463720 -username %username% -remember-password -dir "R6Downloads\Y4S2_Phantom_Sight" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's PHANTOM SIGHT Released!
  echo PHANTOM SIGHT Choosed>>log.log
  goto MainMenu
  )
  ::EMBER RISE manifest / Doctors Curse
  if %ERRORLEVEL%==16 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 3546781236735558235 -username %username% -remember-password -dir "R6Downloads\Y4S3_DoktorsCurse" -validate -max-servers 15 -max-downloads 10
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 7869081741739849703 -username %username% -remember-password -dir "R6Downloads\Y4S3_DoktorsCurse" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete Thanks Zer0!
  echo EMBER RISE [Zer0] Choosed>>log.log
  goto MainMenu
  )
  ::SHIFTING TIDES Released
  if %ERRORLEVEL%==17 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 299124516841461614 -username %username% -remember-password -dir "R6Downloads\Y4S4_Shifting_Tides" -validate -max-servers 20 -max-downloads 15
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 1842268638395240106 -username %username% -remember-password -dir "R6Downloads\Y4S4_Shifting_Tides" -validate -max-servers 20 -max-downloads 15
  pause
  cls
  echo Download complete!
  echo It's SHIFTING TIDES Released!
  echo SHIFTING TIDES Choosed>>log.log
  goto MainMenu
  )
  ::Void Edge manifest / Gang Destruction
  if %ERRORLEVEL%==18 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 1378283477131353042 -username %username% -remember-password -dir "R6Downloads\Y5S1_GangDestruction" -validate -max-servers 15 -max-downloads 10
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 1739364586766771991 -username %username% -remember-password -dir "R6Downloads\Y5S1_GangDestruction" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete Thanks Zer0!
  echo Void Edge [Zer0] Choosed>>log.log
  goto MainMenu
  )
  ::steel wave Y5S2.3.0_C5433707_D1028748_S38774_14603060 (Mute Protocol)
  if %ERRORLEVEL%==19 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 2287849678928593252 -username %username% -remember-password -dir "R6Downloads\Y5S2_MUTE" -validate -max-servers 15 -max-downloads 10
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 1610834739284564851 -username %username% -remember-password -dir "R6Downloads\Y5S2_MUTE" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete Thanks Zer0!
  echo [v14603060] steel wave [Mute Protocol] Choosed>>log.log
  goto MainMenu
  )
  ::SteelWave (omega/Mute Protocol)
  if %ERRORLEVEL%==20 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 4367817844736324940 -username %username% -remember-password -dir "R6Downloads\Y5S2_SteelWave" -validate -max-servers 15 -max-downloads 10
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 893971391196952070 -username %username% -remember-password -dir "R6Downloads\Y5S2_SteelWave" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete Thanks Zer0!
  echo [v14664131] SteelWave [omega/Mute Protocol] Choosed>>log.log
  goto MainMenu
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
  MODE 50,40
  echo ReleaseMenu Loaded>>log.log
  echo [93m-----------------------NOTES----------------------[0m
  echo                   Release Selector
  echo      Only new, released version of game build
  echo [93m----------------------SELECT----------------------[0m
  Resources\cmdmenusel f8f0 "   Vanilla" "   Black Ice" "   Dust Line" "   Skull Rain" "   Red Crow" "   Velvet Shell" "   Health" "   Blood Orchid" "   White Noise" "   Chimera" "   Para Bellum" "   Grim Sky" "   Wind Bastion" "   Burnt Horizon" "   Phantom Sight" "   Ember Rise" "   Shifting Tides" "   Void Edge" "   Steel Wave" "   Shadow Legacy" "   Back"

  ::Vanilla
  if %ERRORLEVEL%==1 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 8358812283631269928 -username %username% -remember-password -dir "R6Downloads\Y1S0_Vanilla" -validate -max-servers 15 -max-downloads 10
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 3893422760579204530 -username %username% -remember-password -dir "R6Downloads\Y1S0_Vanilla" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Vanilla [v8194013]
  echo Vanilla Choosed>>log.log
  goto MainMenu
  )
  ::BLACK ICE Released
  if %ERRORLEVEL%==2 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 5188997148801516344 -username %username% -remember-password -dir "R6Downloads\Y1S1_Black_Ice" -validate -max-servers 15 -max-downloads 10
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 7932785808040895147 -username %username% -remember-password -dir "R6Downloads\Y1S1_Black_Ice" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's BLACK ICE Released [IDK how but v11726982]
  echo BLACK ICE Choosed>>log.log
  goto MainMenu
  )
  ::DUST LINE Released
  if %ERRORLEVEL%==3 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 2303064029242396590 -username %username% -remember-password -dir "R6Downloads\Y1S2_Dust_Line" -validate -max-servers 15 -max-downloads 10
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 2206497318678061176 -username %username% -remember-password -dir "R6Downloads\Y1S2_Dust_Line" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's DUST LINE Released [v9132097]
  echo DUST LINE Choosed>>log.log
  goto MainMenu
  )
  ::SKULL RAIN Released
  if %ERRORLEVEL%==4 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 3552784069501585540 -username %username% -remember-password -dir "R6Downloads\Y1S3_Skull_Rain" -validate -max-servers 15 -max-downloads 10
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 6528040263176897081 -username %username% -remember-password -dir "R6Downloads\Y1S3_Skull_Rain" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's SKULL RAIN Released [v9654076]
  echo SKULL RAIN Choosed>>log.log
  goto MainMenu
  )
  ::RED CROW Released
  if %ERRORLEVEL%==5 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 3576607363557872807 -username %username% -remember-password -dir "R6Downloads\Y1S4_Red_Crow" -validate -max-servers 15 -max-downloads 10
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 8569920171217002292 -username %username% -remember-password -dir "R6Downloads\Y1S4_Red_Crow" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's RED CROW Released!
  echo RED CROW Choosed>>log.log
  goto MainMenu
  )
  ::VELVET SHELL Released
  if %ERRORLEVEL%==6 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 2248734317261478192 -username %username% -remember-password -dir "R6Downloads\Y2S1_Velvet_Shell" -validate -max-servers 15 -max-downloads 10
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 8006071763917433748 -username %username% -remember-password -dir "R6Downloads\Y2S1_Velvet_Shell" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's VELVET SHELL Released
  echo VELVET SHELL Choosed>>log.log
  goto MainMenu
  )
  ::Health Released
  if %ERRORLEVEL%==7 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 2786501509753402970 -username %username% -remember-password -dir "R6Downloads\Y2S2_Health" -validate -max-servers 15 -max-downloads 10
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 2332919753188284154 -username %username% -remember-password -dir "R6Downloads\Y2S2_Health" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Health Released!
  echo Health Choosed>>log.log
  goto MainMenu
  )
  ::BLOOD ORCHID Released
  if %ERRORLEVEL%==8 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 8948840210977117778 -username %username% -remember-password -dir "R6Downloads\Y2S3_Blood_Orchid" -validate -max-servers 15 -max-downloads 10
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 2410147212125863824 -username %username% -remember-password -dir "R6Downloads\Y2S3_Blood_Orchid" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's BLOOD ORCHID Released!
  echo BLOOD ORCHID Choosed>>log.log
  goto MainMenu
  )
  ::WHITE NOISE Released
  if %ERRORLEVEL%==9 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 2066250193950057921 -username %username% -remember-password -dir "R6Downloads\Y2S4_White_Noise" -validate -max-servers 15 -max-downloads 10
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 2783803489764777627 -username %username% -remember-password -dir "R6Downloads\Y2S4_White_Noise" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's WHITE NOISE  Released!
  echo WHITE NOISE Choosed>>log.log
  goto MainMenu
  )
  ::CHIMERA Released
  if %ERRORLEVEL%==10 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 5071357104726974256 -username %username% -remember-password -dir "R6Downloads\Y3S1_Chimera" -validate -max-servers 15 -max-downloads 10
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 4701787239566783972 -username %username% -remember-password -dir "R6Downloads\Y3S1_Chimera" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's CHIMERA  Released
  echo CHIMERA Choosed>>log.log
  goto MainMenu
  )
  ::PARA BELLUM Released
  if %ERRORLEVEL%==11 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 8312108283310615233 -username %username% -remember-password -dir "R6Downloads\Y3S2_Para_Bellum" -validate -max-servers 15 -max-downloads 10
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 8765715607275074515 -username %username% -remember-password -dir "R6Downloads\Y3S2_Para_Bellum" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's PARA BELLUM Released!
  echo PARA BELLUM Choosed>>log.log
  goto MainMenu
  )
  ::GRIM SKY Released
  if %ERRORLEVEL%==12 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 7286067994760020542 -username %username% -remember-password -dir "R6Downloads\Y3S3_Grim_Sky" -validate -max-servers 15 -max-downloads 10
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 4133951394045241747 -username %username% -remember-password -dir "R6Downloads\Y3S3_Grim_Sky" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's GRIM SKY Released!
  echo  GRIM SKY Choosed>>log.log
  goto MainMenu
  )
  ::WIND BASTION Released
  if %ERRORLEVEL%==13 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 6502258854032233436 -username %username% -remember-password -dir "R6Downloads\Y3S4_Wind_Bastion" -validate -max-servers 15 -max-downloads 10
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 7659555540733025386 -username %username% -remember-password -dir "R6Downloads\Y3S4_Wind_Bastion" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's WIND BASTION Released [v12512571]
  echo WIND BASTION [v12512571] Choosed>>log.log
  goto MainMenu
  )
  ::BURNT HORIZON Released
  if %ERRORLEVEL%==14 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 8985694971177711792 -username %username% -remember-password -dir "R6Downloads\Y4S1_Burnt_Horizon" -validate -max-servers 15 -max-downloads 10
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 4355229858723790756 -username %username% -remember-password -dir "R6Downloads\Y4S1_Burnt_Horizon" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's BURNT HORIZON Released!
  echo BURNT HORIZON Choosed>>log.log
  goto MainMenu
  )
  ::PHANTOM SIGHT Released
  if %ERRORLEVEL%==15 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 693082837425613508 -username %username% -remember-password -dir "R6Downloads\Y4S2_Phantom_Sight" -validate -max-servers 15 -max-downloads 10
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 5408324128694463720 -username %username% -remember-password -dir "R6Downloads\Y4S2_Phantom_Sight" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's PHANTOM SIGHT Released!
  echo PHANTOM SIGHT Choosed>>log.log
  goto MainMenu
  )
  ::EMBER RISE Released
  if %ERRORLEVEL%==16 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 7309481042294838052 -username %username% -remember-password -dir "R6Downloads\Y4S3_Ember_Rise" -validate -max-servers 15 -max-downloads 10
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 5429930338066808153 -username %username% -remember-password -dir "R6Downloads\Y4S3_Ember_Rise" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's EMBER RISE Released!
  echo EMBER RISE Choosed>>log.log
  goto MainMenu
  )
  ::SHIFTING TIDES Released
  if %ERRORLEVEL%==17 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 299124516841461614 -username %username% -remember-password -dir "R6Downloads\Y4S4_Shifting_Tides" -validate -max-servers 20 -max-downloads 15
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 1842268638395240106 -username %username% -remember-password -dir "R6Downloads\Y4S4_Shifting_Tides" -validate -max-servers 20 -max-downloads 15
  pause
  cls
  echo Download complete!
  echo It's SHIFTING TIDES Released!
  echo SHIFTING TIDES Choosed>>log.log
  goto MainMenu
  )
  ::VOID EDGE Released
  if %ERRORLEVEL%==18 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 8007091753837589034 -username %username% -remember-password -dir "R6Downloads\Y5S1_Void_Edge" -validate -max-servers 15 -max-downloads 10
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 2810676266503656332 -username %username% -remember-password -dir "R6Downloads\Y5S1_Void_Edge" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's VOID EDGE Released!
  echo VOID EDGE Choosed>>log.log
  goto MainMenu
  )
  ::STEEL WAVE
  if %ERRORLEVEL%==19 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 7032500641931923367 -username %username% -remember-password -dir "R6Downloads\Y5S2_Steel_Wave" -validate -max-servers 15 -max-downloads 10
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 8083217055977195199 -username %username% -remember-password -dir "R6Downloads\Y5S2_Steel_Wave" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's STEEL WAVE Released!
  echo STEEL WAVE Choosed>>log.log
  goto MainMenu
  )
  ::Shadow Legacy
  if %ERRORLEVEL%==20 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 885453180592640750 -username %username% -remember-password -dir "R6Downloads\Y5S3_Shadow_Legacy" -validate -max-servers 15 -max-downloads 10
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 7750070106878890861 -username %username% -remember-password -dir "R6Downloads\Y5S3_Shadow_Legacy" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Shadow Legacy Released!
  echo Shadow Legacy Choosed>>log.log
  goto MainMenu
  )
  if %ERRORLEVEL% == 21 (
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
  echo   The Omega Mute is not broken, use that.
  echo [93m-----------------------SELECT-----------------------[0m
  Resources\cmdmenusel f8f0 "   Outback" "   Mad House" "   Rainbow is Magic" "   Road To S.I. 2020" "   Gang Destruction / Golden Gun" "   M.U.T.E Protocol (Support Omega)" "   M.U.T.E Protocol (Not supported Omega)" "   Sugar Fright / Telly" "   Back"
  
  ::CHIMERA Released
  if %ERRORLEVEL%==1 (
  MODE 100,40
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 5071357104726974256 -username %username% -remember-password -dir "R6Downloads\Y3S1_Chimera" -validate -max-servers 15 -max-downloads 10
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 4701787239566783972 -username %username% -remember-password -dir "R6Downloads\Y3S1_Chimera" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's CHIMERA Released
  echo Chimera / Outback Choosed>>log.log
  goto MainMenu
  )
  ::MadHouse EVENT
  if %ERRORLEVEL%==2 (
  MODE 100,40
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 3546781236735558235 -username %username% -remember-password -dir "R6Downloads\Y3S3_MadHouse" -validate -max-servers 15 -max-downloads 10
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 1556527176552332195 -username %username% -remember-password -dir "R6Downloads\Y3S3_MadHouse" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Mad House!
  echo Mad House Choosed>>log.log
  goto MainMenu
  )
  ::Rainbow is Magic EVENT
  if %ERRORLEVEL%==3 (
  MODE 100,40
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 8356277316976403078 -username %username% -remember-password -dir "R6Downloads\Y4S1_RainbowIsMagic" -validate -max-servers 15 -max-downloads 10
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 5935578581006804383 -username %username% -remember-password -dir "R6Downloads\Y4S1_RainbowIsMagic" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Rainbow is Magic!
  echo Rainbow is Magic Choosed>>log.log
  goto MainMenu
  )
  ::SHIFTING TIDES Released
  if %ERRORLEVEL%==4 (
  MODE 100,40
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 299124516841461614 -username %username% -remember-password -dir "R6Downloads\Y4S4_Shifting_Tides" -validate -max-servers 20 -max-downloads 15
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 1842268638395240106 -username %username% -remember-password -dir "R6Downloads\Y4S4_Shifting_Tides" -validate -max-servers 20 -max-downloads 15
  pause
  cls
  echo Download complete!
  echo It's SHIFTING TIDES Released!
  echo SHIFTING TIDES / Road To S.I. 2020 Choosed>>log.log
  goto MainMenu
  )
  ::The Grand Larceny
  if %ERRORLEVEL%==5 (
  MODE 100,40
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 4736360397583523381 -username %username% -remember-password -dir "R6Downloads\Y5S1_TheGrandLarceny" -validate -max-servers 15 -max-downloads 10
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 6296533808765702678 -username %username% -remember-password -dir "R6Downloads\Y5S1_TheGrandLarceny" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's The Grand Larceny!
  echo  Grand Larceny Choosed>>log.log
  goto MainMenu
  )
  ::MUTE EVENT
  if %ERRORLEVEL%==6 (
  MODE 100,40
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 4367817844736324940 -username %username% -remember-password -dir "R6Downloads\Y5S2_MUTE" -validate -max-servers 15 -max-downloads 10
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 893971391196952070 -username %username% -remember-password -dir "R6Downloads\Y5S2_MUTE" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete
  echo It's M.U.T.E Protocol [Support Omega]
  echo M.U.T.E Protocol [Support Omega] Choosed>>log.log
  goto MainMenu
  )
  ::MUTE EVENT W/o Omega
  if %ERRORLEVEL%==7 (
  MODE 100,40
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 2287849678928593252 -username %username% -remember-password -dir "R6Downloads\Y5S2_SteelWave" -validate -max-servers 15 -max-downloads 10
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 1610834739284564851 -username %username% -remember-password -dir "R6Downloads\Y5S2_SteelWave" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete
  echo It's M.U.T.E Protocol [Not supported Omega] 
  echo M.U.T.E Protocol [Not supported Omega] Choosed>>log.log
  goto MainMenu
  )
  ::Sugar Fright / Telly
  if %ERRORLEVEL%==8 (
  MODE 100,40
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 3265954110064157115 -username %username% -remember-password -dir "R6Downloads\Y5S3_Sugar_Fright" -validate -max-servers 15 -max-downloads 10
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 5436378897406471956 -username %username% -remember-password -dir "R6Downloads\Y5S3_Sugar_Fright" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete 
  echo It's Sugar Fright
  echo Sugar Fright / Telly Choosed>>log.log
  goto MainMenu
  )
  if %ERRORLEVEL% == 9 (
  echo Back - %TIME%>>log.log
  cls
  goto InstallMenu
  )
  goto EventMenu
::EventMenu END


::TextureMenu START
:TextureMenu
  cls
  Title Rainbow Six Siege 4K Textures Downloader
  MODE 50,38
  echo TextureMenu Loaded >>log.log
  echo [93m----------------------NOTES-----------------------[0m
  echo                   4K Textures Selector
  echo   Insert note here 
  echo [93m----------------------SELECT----------------------[0m  
  Resources\cmdmenusel f8f0 "4kRelease" "4kVersion" "4kEvent" "Back"

  if %ERRORLEVEL% == 1 (
  echo 4kRelease Choosed>>log.log
  cls
  goto 4kRelease
  )
  if %ERRORLEVEL% == 2 (
  echo 4kVersion Choosed>>log.log
  cls
  goto 4kVersion
  )
  if %ERRORLEVEL% == 3 (
  echo 4kEvent Choosed>>log.log
  cls
  goto 4kEvent
  )
  if %ERRORLEVEL% == 4 (
  cls
  echo Where to back?>>log.log
    if %LastSelector% == MainMenu (
      echo Back to %LastSelector% - %TIME%>>log.log
      cls
      goto MainCMD
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

  ::Vanilla4k
  if %ERRORLEVEL%==1 (
  MODE 100,40
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377239 -manifest 8394183851197739981 -username %username% -remember-password -dir "R6Downloads\Y1S0_Vanilla" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Vanilla 4K!
  goto MainMenu
  )
  ::BlackIce4k
  if %ERRORLEVEL%==2 (
  MODE 100,40
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377239 -manifest 3756048967966286899 -username %username% -remember-password -dir "R6Downloads\Y1S1_Black_Ice" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Black Ice 4K!
  goto MainMenu
  )
  ::DustLine4k
  if %ERRORLEVEL%==3 (
  MODE 100,40
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377239 -manifest 1338949402410764888 -username %username% -remember-password -dir "R6Downloads\Y1S2_Dust_Line" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Dust Line 4K!
  goto MainMenu
  )
  ::SkullRain4kZero
  if %ERRORLEVEL%==4 (
  MODE 100,40
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377239 -manifest 3267970968757091405 -username %username% -remember-password -dir "R6Downloads\Y1S3_SkullRain" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete Thanks Zer0!
  goto MainMenu
  )
  )
  ::RedCrow4k
  if %ERRORLEVEL%==5 (
  MODE 100,40
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377239 -manifest 1825939060444887403 -username %username% -remember-password -dir "R6Downloads\Y1S4_Red_Crow" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Red Crow 4K!
  goto MainMenu
  )
  ::VelvetShell4k
  if %ERRORLEVEL%==6 (
  MODE 100,40
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377239 -manifest 3196596628759979362 -username %username% -remember-password -dir "R6Downloads\Y2S1_Velvet_Shell" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Velvet Shell 4K!
  goto MainMenu
  )
  ::Health4kZero
  if %ERRORLEVEL%==7 (
  MODE 100,40
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377239 -manifest 7497579858536910279 -username %username% -remember-password -dir "R6Downloads\Y2S2_Health_2" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete Thanks Zer0!
  goto MainMenu
  )
  ::BloodOrchid4kZero
  if %ERRORLEVEL%==8 (
  MODE 100,40
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377239 -manifest 6420469519659049757 -username %username% -remember-password -dir "R6Downloads\Y2S3_BloodOrchid" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete Thanks Zer0!
  goto MainMenu
  )
  ::WhiteNoise4kZero
  if %ERRORLEVEL%==9 (
  MODE 100,40
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377239 -manifest 1118649577165385479 -username %username% -remember-password -dir "R6Downloads\Y2S4_WhiteNoise" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete! Thanks Zer0!
  goto MainMenu
  )
  ::Chimera4k
  if %ERRORLEVEL%==10 (
  MODE 100,40
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377239 -manifest 1668513364192382097 -username %username% -remember-password -dir "R6Downloads\Y3S1_Chimera" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Chimera 4K!
  goto MainMenu
  )
  ::ParaBellum4k
  if %ERRORLEVEL%==11 (
  MODE 100,40
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377239 -manifest 204186978012641075 -username %username% -remember-password -dir "R6Downloads\Y3S2_Para_Bellum" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Para Bellum 4K!
  goto MainMenu
  )
  ::MadHouse4k
  if %ERRORLEVEL%==12 (
  MODE 100,40
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377239 -manifest 6431001239225997495 -username %username% -remember-password -dir "R6Downloads\Y3S3_GrimSky" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete Thanks Zer0!
  goto MainMenu
  )
  ::WindBastion4k
  if %ERRORLEVEL%==13 (
  MODE 100,40
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377239 -manifest 2243348760021617592 -username %username% -remember-password -dir "R6Downloads\Y3S4_Wind_Bastion" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Wind Bastion 4K!
  goto MainMenu
  )
  ::RainbowIsMagic4k
  if %ERRORLEVEL%==14 (
  MODE 100,40
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377239 -manifest 8394183851197739981 -username %username% -remember-password -dir "R6Downloads\Y4S1_BurntHorizon" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete Thanks Zer0!
  goto MainMenu
  )
  ::PhantomSight4k
  if %ERRORLEVEL%==15 (
  MODE 100,40
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377239 -manifest 4107080515154236795 -username %username% -remember-password -dir "R6Downloads\Y4S2_Phantom_Sight" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Phantom Sight 4K!
  goto MainMenu
  )
  ::DoktorsCurse4k
  if %ERRORLEVEL%==16 (
  MODE 100,40
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377239 -manifest 4319184561394137009 -username %username% -remember-password -dir "R6Downloads\Y4S3_EmberRise" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete Thanks Zer0!
  goto MainMenu
  )
  ::ShiftingTides4k
  if %ERRORLEVEL%==17 (
  MODE 100,40
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377239 -manifest 6048763664997452513 -username %username% -remember-password -dir "R6Downloads\Y4S4_Shifting_Tides" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Shifting Tides 4K!
  goto MainMenu
  )
  ::GrandLarceny4k
  if %ERRORLEVEL%==18 (
  MODE 100,40
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377239 -manifest 2194493692563107142 -username %username% -remember-password -dir "R6Downloads\Y5S1_VoidEdge" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete Thanks Zer0!
  goto MainMenu
  )
  ::MUTEProtocol4k
  if %ERRORLEVEL%==19 (
  MODE 100,40
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377239 -manifest 1430519549301269175 -username %username% -remember-password -dir "R6Downloads\Y5S2_MUTE" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete Thanks Zer0!
  goto MainMenu
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
  Resources\cmdmenusel f8f0 "   Vanilla" "   Black Ice" "   Dust Line" "   Skull Rain" "   Red Crow" "   Velvet Shell" "   Health" "   Blood Orchid" "   White Noise" "   Chimera" "   Para Bellum" "   Grim Sky" "   Wind Bastion" "   Burnt Horizon" "   Phantom Sight" "   Ember Rise" "   Shifting Tides" "   Void Edge" "   Steel Wave" "   Shadow Legacy" "   Back"

  ::Vanilla4k
  if %ERRORLEVEL%==1 (
  MODE 100,40
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377239 -manifest 8394183851197739981 -username %username% -remember-password -dir "R6Downloads\Y1S0_Vanilla" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Vanilla 4K!
  goto MainMenu
  )
  ::BlackIce4k
  if %ERRORLEVEL%==2 (
  MODE 100,40
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377239 -manifest 3756048967966286899 -username %username% -remember-password -dir "R6Downloads\Y1S1_Black_Ice" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Black Ice 4K!
  goto MainMenu
  )
  ::DustLine4k
  if %ERRORLEVEL%==3 (
  MODE 100,40
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377239 -manifest 1338949402410764888 -username %username% -remember-password -dir "R6Downloads\Y1S2_Dust_Line" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Dust Line 4K!
  goto MainMenu
  )
  ::SkullRain4k
  if %ERRORLEVEL%==4 (
  MODE 100,40
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377239 -manifest 5184390432533910806 -username %username% -remember-password -dir "R6Downloads\Y1S3_Skull_Rain" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Skull Rain 4K! 
  goto MainMenu
  )
  ::RedCrow4k
  if %ERRORLEVEL%==5 (
  MODE 100,40
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377239 -manifest 1825939060444887403 -username %username% -remember-password -dir "R6Downloads\Y1S4_Red_Crow" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Red Crow 4K!
  goto MainMenu
  )
  ::VelvetShell4k
  if %ERRORLEVEL%==6 (
  MODE 100,40
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377239 -manifest 3196596628759979362 -username %username% -remember-password -dir "R6Downloads\Y2S1_Velvet_Shell" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Velvet Shell 4K!
  goto MainMenu
  )
  ::Health4k
  if %ERRORLEVEL%==7 (
  MODE 100,40
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377239 -manifest 7497579858536910279 -username %username% -remember-password -dir "R6Downloads\Y2S2_Health" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Health 4K!
  goto MainMenu
  )
  ::BloodOrchid4k
  if %ERRORLEVEL%==8 (
  MODE 100,40
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377239 -manifest 3065193946575458487 -username %username% -remember-password -dir "R6Downloads\Y2S3_Blood_Orchid" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Blood Orchid 4K!
  goto MainMenu
  )
  ::WhiteNoise4k
  if %ERRORLEVEL%==9 (
  MODE 100,40
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377239 -manifest 1118649577165385479 -username %username% -remember-password -dir "R6Downloads\Y2S4_White_Noise" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's White Noise 4K!
  goto MainMenu
  )
  ::Chimera4k
  if %ERRORLEVEL%==10 (
  MODE 100,40
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377239 -manifest 1668513364192382097 -username %username% -remember-password -dir "R6Downloads\Y3S1_Chimera" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Chimera 4K!
  goto MainMenu
  )
  ::ParaBellum4k
  if %ERRORLEVEL%==11 (
  MODE 100,40
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377239 -manifest 204186978012641075 -username %username% -remember-password -dir "R6Downloads\Y3S2_Para_Bellum" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Para Bellum 4K!
  goto MainMenu
  )
  ::GrimSky4k
  if %ERRORLEVEL%==12 (
  MODE 100,40
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377239 -manifest 3378966402050009606 -username %username% -remember-password -dir "R6Downloads\Y3S3_Grim_Sky" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Grim Sky 4K!
  goto MainMenu
  )
  ::WindBastion4k
  if %ERRORLEVEL%==13 (
  MODE 100,40
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377239 -manifest 2243348760021617592 -username %username% -remember-password -dir "R6Downloads\Y3S4_Wind_Bastion" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Wind Bastion 4K!
  goto MainMenu
  )
  ::BurntHorizon4k
  if %ERRORLEVEL%==14 (
  MODE 100,40
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377239 -manifest 888629411354320742 -username %username% -remember-password -dir "R6Downloads\Y4S1_Burnt_Horizon" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Burnt Horizon 4K!
  goto MainMenu
  )
  ::PhantomSight4k
  if %ERRORLEVEL%==15 (
  MODE 100,40
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377239 -manifest 4107080515154236795 -username %username% -remember-password -dir "R6Downloads\Y4S2_Phantom_Sight" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Phantom Sight 4K!
  goto MainMenu
  )
  ::EmberRise4k
  if %ERRORLEVEL%==16 (
  MODE 100,40
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377239 -manifest 8340682081776225833 -username %username% -remember-password -dir "R6Downloads\Y4S3_Ember_Rise" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Ember Rise 4K!
  goto MainMenu
  )
  ::ShiftingTides4k
  if %ERRORLEVEL%==17 (
  MODE 100,40
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377239 -manifest 6048763664997452513 -username %username% -remember-password -dir "R6Downloads\Y4S4_Shifting_Tides" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Shifting Tides 4K!
  goto MainMenu
  )
  ::VoidEdge4k
  if %ERRORLEVEL%==18 (
  MODE 100,40
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377239 -manifest 2194493692563107142 -username %username% -remember-password -dir "R6Downloads\Y5S1_Void_Edge" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Void Edge 4K!
  goto MainMenu
  )
  ::SteelWave4k
  if %ERRORLEVEL%==19 (
  MODE 100,40
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377239 -manifest 3257522596542046976 -username %username% -remember-password -dir "R6Downloads\Y5S2_Steel_Wave" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Steel Wave 4K!
  goto MainMenu
  )
  ::ShadowLegacy4k
  if %ERRORLEVEL%==20 (
  MODE 100,40
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377239 -manifest 5051396185388503167 -username %username% -remember-password -dir "R6Downloads\Y5S3_Shadow_Legacy" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Shadow Legacy 4K!
  goto MainMenu
  )
  if %ERRORLEVEL% == 21 (
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
  
  ::Chimera4k
  if %ERRORLEVEL%==1 (
  MODE 100,40
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377239 -manifest 1668513364192382097 -username %username% -remember-password -dir "R6Downloads\Y3S1_Chimera" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Chimera / Outback 4K!
  goto MainMenu
  )
  ::MadHouse4k
  if %ERRORLEVEL%==2 (
  MODE 100,40
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377239 -manifest 6431001239225997495 -username %username% -remember-password -dir "R6Downloads\Y3S3_GrimSky" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete Thanks Zer0!
  goto MainMenu
  )
  ::RainbowIsMagic4k
  if %ERRORLEVEL%==3 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377239 -manifest 8394183851197739981 -username %username% -remember-password -dir "R6Downloads\Y4S1_BurntHorizon" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete Thanks Zer0!
  goto MainMenu
  )
  ::PhantomSight4k
  if %ERRORLEVEL%==4 (
  MODE 100,40
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377239 -manifest 4107080515154236795 -username %username% -remember-password -dir "R6Downloads\Y4S2_Phantom_Sight" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Phantom Sight 4K!
  goto MainMenu
  )
  ::DoktorsCurse4k
  if %ERRORLEVEL%==5 (
  MODE 100,40
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377239 -manifest 4319184561394137009 -username %username% -remember-password -dir "R6Downloads\Y4S3_EmberRise" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete Thanks Zer0!
  goto MainMenu
  )
  ::ShiftingTides4k
  if %ERRORLEVEL%==6 (
  MODE 100,40
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377239 -manifest 6048763664997452513 -username %username% -remember-password -dir "R6Downloads\Y4S4_Shifting_Tides" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Shifting Tides / Road To S.I. 4K!
  goto MainMenu
  )
  ::GrandLarceny4k
  if %ERRORLEVEL%==7 (
  MODE 100,40
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377239 -manifest 2194493692563107142 -username %username% -remember-password -dir "R6Downloads\Y5S1_VoidEdge" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete Thanks Zer0!
  goto MainMenu
  )
  ::MUTEProtocol4k
  if %ERRORLEVEL%==8 (
  MODE 100,40
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377239 -manifest 1430519549301269175 -username %username% -remember-password -dir "R6Downloads\Y5S2_MUTE" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete Thanks Zer0!
  goto MainMenu
  )
  ::SugarFright4k
  if %ERRORLEVEL%==9 (
  MODE 100,40
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377239 -manifest 3569318872166878802 -username %username% -remember-password -dir "R6Downloads\Y5S3_Sugar_Fright" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete 
  echo It's Sugar Fright / Telly 4K!
  goto MainMenu
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
  echo # 21 = Sugar Fright / Telly
  ::echo # 21 = Placeholder
  echo --------------------------------------------------
  set /p version="Enter Selection:"


  if %version%==1 (
  rd /s /q "R6Downloads\Y1S0_Vanilla"
  timeout /t 4
  cls
  echo Vanilla Choosed [U]>>log.log
  echo Delete complete!
  goto MainMenu
  )
  if %version%==2 (
  rd /s /q "R6Downloads\Y1S1_Black_Ice"
  timeout /t 4
  cls
  echo Y1S1_Black_Ice Choosed [U]>>log.log
  echo Delete complete!
  goto MainMenu
  )
  if %version%==3 (
  rd /s /q "R6Downloads\Y1S2_Dust_Line"
  timeout /t 4
  cls
  echo Y1S2_Dust_Line Choosed [U]>>log.log
  echo Delete complete!
  goto MainMenu
  )
  if %version%==4 (
  rd /s /q "R6Downloads\Y1S3_Skull_Rain"
  timeout /t 4
  cls
  echo Y1S3_Skull_Rain Choosed [U]>>log.log
  echo Delete complete!
  goto MainMenu
  )
  if %version%==41 (
  rd /s /q "R6Downloads\Y1S3_SkullRain"
  timeout /t 4
  cls
  echo Y1S3_SkullRain Choosed [U]>>log.log
  echo Delete complete!
  goto MainMenu
  )
  if %version%==5 (
  rd /s /q "R6Downloads\Y1S4_Red_Crow"
  timeout /t 4
  cls
  echo Y1S4_Red_Crow Choosed [U]>>log.log
  echo Delete complete!
  goto MainMenu
  )
  if %version%==6 (
  rd /s /q "R6Downloads\Y2S1_Velvet_Shell"
  timeout /t 4
  cls
  echo Y2S1_Velvet_Shell Choosed [U]>>log.log
  echo Delete complete!
  goto MainMenu
  )
  if %version%==7 (
  rd /s /q "R6Downloads\Y2S2_Health"
  timeout /t 4
  cls
  echo Y2S2_Health Choosed [U]>>log.log
  echo Delete complete!
  goto MainMenu
  )
  if %version%==71 (
  rd /s /q "R6Downloads\Y2S2_Health_2"
  timeout /t 4
  cls
  echo Y2S2_Health_2 Choosed [U]>>log.log
  echo Delete complete!
  goto MainMenu
  )
  if %version%==8 (
  rd /s /q "R6Downloads\Y2S3_Blood_Orchid"
  timeout /t 4
  cls
  echo Y2S3_Blood_Orchid Choosed [U]>>log.log
  echo Delete complete!
  goto MainMenu
  )
  if %version%==81 (
  rd /s /q "R6Downloads\Y2S3_BloodOrchid"
  timeout /t 4
  cls
  echo Y2S3_BloodOrchid Choosed [U]>>log.log
  echo Delete complete!
  goto MainMenu
  )
  if %version%==9 (
  rd /s /q "R6Downloads\Y2S4_White_Noise"
  timeout /t 4
  cls
  echo Y2S4_White_Noise Choosed [U]>>log.log
  echo Delete complete!
  goto MainMenu
  )
  if %version%==91 (
  rd /s /q "R6Downloads\Y2S4_WhiteNoise"
  timeout /t 4
  cls
  echo Y2S4_WhiteNoise Choosed [U]>>log.log
  echo Delete complete!
  goto MainMenu
  )
  if %version%==10 (
  rd /s /q "R6Downloads\Y3S1_Chimera"
  timeout /t 4
  cls
  echo Y3S1_Chimera Choosed [U]>>log.log
  echo Delete complete!
  goto MainMenu
  )
  if %version%==11 (
  rd /s /q "R6Downloads\Y3S2_Para_Bellum"
  timeout /t 4
  cls
  echo Y3S2_Para_Bellum Choosed [U]>>log.log
  echo Delete complete!
  goto MainMenu
  )
  if %version%==12 (
  rd /s /q "R6Downloads\Y3S3_Grim_Sky"
  timeout /t 4
  cls
  echo Y3S3_Grim_Sky Choosed [U]>>log.log
  echo Delete complete!
  goto MainMenu
  )
  if %version%==120 (
  rd /s /q "R6Downloads\Y3S3_MadHouse"
  timeout /t 4
  cls
  echo Y3S3_MadHouse Choosed [U]>>log.log
  echo Delete complete!
  goto MainMenu
  )
  if %version%==121 (
  rd /s /q "R6Downloads\Y3S3_GrimSky"
  timeout /t 4
  cls
  echo Y3S3_GrimSky Choosed [U]>>log.log
  echo Delete complete!
  goto MainMenu
  )
  if %version%==13 (
  rd /s /q "R6Downloads\Y3S4_Wind_Bastion"
  timeout /t 4
  cls
  echo Y3S4_Wind_Bastion Choosed [U]>>log.log
  echo Delete complete!
  goto MainMenu
  )
  if %version%==14 (
  rd /s /q "R6Downloads\Y4S1_Burnt_Horizon"
  timeout /t 4
  cls
  echo Y4S1_Burnt_Horizon Choosed [U]>>log.log
  echo Delete complete!
  goto MainMenu
  )
  if %version%==140 (
  rd /s /q "R6Downloads\Y4S1_RainbowIsMagic"
  timeout /t 4
  cls
  echo Y4S1_RainbowIsMagic Choosed [U]>>log.log
  echo Delete complete!
  goto MainMenu
  )
  if %version%==141 (
  rd /s /q "R6Downloads\Y4S1_BurntHorizon"
  timeout /t 4
  cls
  echo Y4S1_BurntHorizon Choosed [U]>>log.log
  echo Delete complete!
  goto MainMenu
  )
  if %version%==15 (
  rd /s /q "R6Downloads\Y4S2_Phantom_Sight"
  timeout /t 4
  cls
  echo Y4S2_Phantom_Sight Choosed [U]>>log.log
  echo Delete complete!
  goto MainMenu
  )
  if %version%==16 (
  rd /s /q "R6Downloads\Y4S3_Ember_Rise"
  timeout /t 4
  cls
  echo Y4S3_Ember_Rise Choosed [U]>>log.log
  echo Delete complete!
  goto MainMenu
  )
  if %version%==17 (
  rd /s /q "R6Downloads\Y4S4_Shifting_Tides"
  timeout /t 4
  cls
  echo Y4S4_Shifting_Tides Choosed [U]>>log.log
  echo Delete complete!
  goto MainMenu
  )
  if %version%==18 (
  rd /s /q "R6Downloads\Y5S1_Void_Edge"
  timeout /t 4
  cls
  echo Y5S1_Void_Edge Choosed [U]>>log.log
  echo Delete complete!
  goto MainMenu
  )
  if %version%==190 (
  rd /s /q "R6Downloads\Y5S1_TheGrandLarceny"
  timeout /t 4
  cls
  echo Y5S1_TheGrandLarceny Choosed [U]>>log.log
  echo Delete complete!
  goto MainMenu
  )
  if %version%==181 (
  rd /s /q "R6Downloads\Y5S1_VoidEdge"
  timeout /t 4
  cls
  echo Y5S1_VoidEdge Choosed [U]>>log.log
  echo Delete complete!
  goto MainMenu
  )
  if %version%==19 (
  rd /s /q "R6Downloads\Y5S2_Steel_Wave"
  timeout /t 4
  cls
  echo Y5S2_Steel_Wave Choosed [U]>>log.log
  echo Delete complete!
  goto MainMenu
  )
  if %version%==190 (
  rd /s /q "R6Downloads\Y5S2_MUTE"
  timeout /t 4
  cls
  echo Y5S2_SteelWave Choosed [U]>>log.log
  echo Delete complete!
  goto MainMenu
  )
  if %version%==191 (
  rd /s /q "R6Downloads\Y5S2_SteelWave"
  timeout /t 4
  cls
  echo Y5S2_SteelWave Choosed [U]>>log.log
  echo Delete complete!
  goto MainMenu
  )
  if %version%==20 (
  rd /s /q "R6Downloads\Y5S3_Shadow_Legacy"
  timeout /t 4
  cls
  echo Y5S3_Shadow_Legacy Choosed [U]>>log.log
  echo Delete complete!
  goto MainMenu
  )
  if %version%==21 (
  rd /s /q "R6Downloads\Y5S3_Sugar_Fright"
  timeout /t 4
  cls
  echo Sugar Fright / Telly Choosed [U]>>log.log
  echo Delete complete!
  goto MainMenu
  )
  if %version%==22 (
  rd /s /q "R6Downloads\Placeholder"
  timeout /t 4
  cls
  echo Placeholder Choosed [U]>>log.log
  echo Delete complete!
  goto MainMenu
  )
  goto GameMenu
::UninstallMenu END


:Extra
cls
echo Extra is Currently unavaible
pause
goto MainCMD




::StartGame START
:StartGame
  cls
  Title Rainbow Six Siege Game Starter
  echo StartGame Loaded>>log.log
  MODE 50,50
  echo [93m-----------------------NOTES----------------------[0m
  echo                   Game Starter
  echo      Currently Not Available Press 0 to go back!
  echo [93m----------------------SELECT----------------------[0m
  ::echo --------------------------------------------------
  ::echo # 0 = Back
  ::echo --------------------------------------------------
  ::echo Start Game:
  ::echo # 2 = Vanilla 1.0 (Y1S0) [First Steam Version] 
  ::echo # 3 = Black Ice (Y1S1_release)
  ::echo # 4 = Dust Line (Y1S2_release)
  ::echo # 5 = Skull Rain (Y1S3_release)
  ::echo # 51 = Skull Rain (4.2)
  ::echo # 6 = Red Crow (Y1S4_release)
  ::echo # 7 = Velvet Shell (Y2S1_release)
  ::echo # 8 = Health (Y2S2_release)
  ::echo # 81 = Health (Zer0 Manifest)
  ::echo # 9 = Blood Orchid (Y2S3_release)
  ::echo # 91 = Blood Orchid (2.3.1.1) X
  ::echo # 10 = White Noise (Y2S4_release)
  ::echo # 101= White Noise (Zer0 Manifest)
  ::echo # 11 = Chimera [(Y3S1_release)] X 
  ::echo # 12 = Para Bellum (Y3S2_release)
  ::echo # 13 = Grim Sky (Y3S3_release)
  ::echo # 131 = Grim Sky (Zer0 Manifest)
  ::echo # 14 = Wind Bastion (Y3S4_release)
  ::echo # 15 = Burnt Horizon (Y3S1_release)
  ::echo # 151 = Burnt Horizon (Zer0 Manifest)
  ::echo # 16 = Phantom Sight (Y4S2_release)
  ::echo # 17 = Ember Rise (Y4S3_release)
  ::echo # 171 = Ember Rise (Zer0 Manifest)
  ::echo # 18 = Shifting Tides (Y4S4_release)
  ::echo # 19 = Void Edge (Y5S1_release)
  ::echo # 191 = Void Edge (Zer0 Manifest)
  ::echo # 20 = Steel Wave (Y5S2_release)
  ::echo # 201 = Steel Wave (Zer0 Manifest)
  ::echo # 21 = Shadow Legacy (Y5S3_release)
  ::echo --------------------------------------------------
  ::echo Start Event:
  ::echo # 1399 = Mad House
  ::echo # 1599 = Rainbow is Magic
  ::echo # 1999 = The Grand Larceny
  ::echo # 2099 = M.U.T.E
  ::echo --------------------------------------------------
  set /p startgame="Start:"
  if %startgame%==0 (
  cls
  goto MainMenu
  )
  ::Start GameStarter
  if %startgame%==1 (
  cls
  goto FAQ
  )
  if %startgame%==2 (
  	if exist "R6Downloads\Y1S0_Vanilla\RainbowSix.exe" (
  		echo Starting.....
  		R6Downloads\Y1S0_Vanilla\RainbowSix.exe /belaunch
  		pause
  		)
  	goto DownloadMenu
  )
  if %startgame%==3 (
  	if exist "R6Downloads\Y1S1_Black_Ice\RainbowSix.exe" (
  		echo Starting.....
  		R6Downloads\Y1S1_Black_Ice\RainbowSix.exe /belaunch
  		pause
  		)
  	goto DownloadMenu
  )
  if %startgame%==4 (
  	if exist "R6Downloads\Y1S2_Dust_Line\RainbowSix.exe" (
  		echo Starting.....
  		R6Downloads\Y1S2_Dust_Line\RainbowSix.exe /belaunch
  		pause
  		)
  	goto DownloadMenu
  )
  if %startgame%==5 (
  	if exist "R6Downloads\Y1S3_Skull_Rain\RainbowSixGame.exe" (
  		echo Starting.....
  		R6Downloads\Y1S3_Skull_Rain\RainbowSixGame.exe /belaunch
  		pause
  		)
  	goto DownloadMenu
  )
  if %startgame%==51 (
  	if exist "R6Downloads\Y1S3_SkullRain\RainbowSixGame.exe" (
  		echo Starting.....
  		R6Downloads\Y1S3_SkullRain\RainbowSixGame.exe /belaunch
  		pause
  		)
  	goto DownloadMenu
  )
  if %startgame%==6 (
  	if exist "R6Downloads\Y1S4_Red_Crow\RainbowSixGame.exe" (
  		echo Starting.....
  		R6Downloads\Y1S4_Red_Crow\RainbowSixGame.exe /belaunch
  		pause
  		)
  	goto DownloadMenu
  )
  if %startgame%==7 (
  	if exist "R6Downloads\Y2S1_Velvet_Shell\RainbowSixGame.exe" (
  		echo Starting.....
  		R6Downloads\Y2S1_Velvet_Shell\RainbowSixGame.exe /belaunch
  		pause
  		)
  	goto DownloadMenu
  )
  if %startgame%==8 (
  	if exist "R6Downloads\Y2S2_Health\RainbowSixGame.exe" (
  		echo Starting.....
  		R6Downloads\Y2S2_Health\RainbowSixGame.exe /belaunch
  		pause
  		)
  	goto DownloadMenu
  )
  if %startgame%==81 (
    if exist "R6Downloads\Y2S2_Health_2\RainbowSix.exe" (
      echo Starting.....
      R6Downloads\Y2S2_Health_2\RainbowSix.exe /belaunch
      pause
      )
    goto DownloadMenu
  )
  if %startgame%==9 (
  	if exist "R6Downloads\Y2S3_Blood_Orchid\RainbowSix.exe" (
  		echo Starting.....
  		R6Downloads\Y2S3_Blood_Orchid\RainbowSix.exe /belaunch
  		pause
  		)
  	goto DownloadMenu
  )
  if %startgame%==91 (
  	if exist "R6Downloads\Y2S3_BloodOrchid\RainbowSix.exe" (
  		echo Starting.....
  		R6Downloads\Y2S3_BloodOrchid\RainbowSix.exe /belaunch
  		pause
  		)
  	goto DownloadMenu
  )
  if %startgame%==10 (
  	if exist "R6Downloads\Y2S4_White_Noise\RainbowSix.exe" (
  		echo Starting.....
  		R6Downloads\Y2S4_White_Noise\RainbowSix.exe /belaunch
  		pause
  		)
  	goto DownloadMenu
  )
  if %startgame%==101 (
    if exist "R6Downloads\Y2S4_WhiteNoise\RainbowSix.exe" (
      echo Starting.....
      R6Downloads\Y2S4_WhiteNoise\RainbowSix.exe /belaunch
      pause
      )
    goto DownloadMenu
  )
  if %startgame%==11 (
  	if exist "R6Downloads\Y3S1_Chimera\RainbowSix.exe" (
  		echo Starting.....
  		R6Downloads\Y3S1_Chimera\RainbowSix.exe /belaunch
  		pause
  		)
  	goto DownloadMenu
  )
  if %startgame%==12 (
  	if exist "R6Downloads\Y3S2_Para_Bellum\RainbowSix.exe" (
  		echo Starting.....
  		R6Downloads\Y3S2_Para_Bellum\RainbowSix.exe /belaunch
  		pause
  		)
  	goto DownloadMenu
  )
  if %startgame%==13 (
  	if exist "R6Downloads\Y3S3_Grim_Sky\RainbowSix.exe" (
  		echo Starting.....
  		R6Downloads\Y3S3_Grim_Sky\RainbowSix.exe /belaunch
  		pause
  		)
  	goto DownloadMenu
  )
  if %startgame%==131 (
    if exist "R6Downloads\Y3S3_GrimSky\RainbowSix.exe" (
      echo Starting.....
      R6Downloads\Y3S3_GrimSky\RainbowSix.exe /belaunch
      pause
      )
    goto DownloadMenu
  )
  if %startgame%==14 (
  	if exist "R6Downloads\Y3S4_Wind_Bastion\RainbowSix.exe" (
  		echo Starting.....
  		R6Downloads\Y3S4_Wind_Bastion\RainbowSix.exe /belaunch
  		pause
  		)
  	goto DownloadMenu
  )
  if %startgame%==15 (
  	if exist "R6Downloads\Y4S1_Burnt_Horizon\RainbowSix.exe" (
  		echo Starting.....
  		R6Downloads\Y4S1_Burnt_Horizon\RainbowSix.exe /belaunch
  		pause
  		)
  	goto DownloadMenu
  )
  if %startgame%==151 (
    if exist "R6Downloads\Y4S1_BurntHorizon\RainbowSix.exe" (
      echo Starting.....
      R6Downloads\Y4S1_BurntHorizon\RainbowSix.exe /belaunch
      pause
      )
    goto DownloadMenu
  )
  if %startgame%==16 (
  	if exist "R6Downloads\Y4S2_Phantom_Sight\RainbowSix.exe" (
  		echo Starting.....
  		R6Downloads\Y4S2_Phantom_Sight\RainbowSix.exe /belaunch
  		pause
  		)
  	goto DownloadMenu
  )
  if %startgame%==17 (
  	if exist "R6Downloads\Y4S3_Ember_Rise\RainbowSix.exe" (
  		echo Starting.....
  		R6Downloads\Y4S3_Ember_Rise\RainbowSix.exe /belaunch
  		pause
  		)
  	goto DownloadMenu
  )
  if %startgame%==171 (
    if exist "R6Downloads\Y4S3_EmberRise\RainbowSix.exe" (
      echo Starting.....
      R6Downloads\Y4S3_EmberRise\RainbowSix.exe /belaunch
      pause
      )
    goto DownloadMenu
  )
  if %startgame%==18 (
  	if exist "R6Downloads\Y4S4_Shifting_Tides\RainbowSix.exe" (
  		echo Starting.....
  		R6Downloads\Y4S4_Shifting_Tides\RainbowSix.exe /belaunch
  		pause
  		)
  	goto DownloadMenu
  )
  if %startgame%==19 (
  	if exist "R6Downloads\Y5S1_Void_Edge\RainbowSix.exe" (
  		echo Starting.....
  		R6Downloads\Y5S1_Void_Edge\RainbowSix.exe /belaunch
  		pause
  		)
  	goto DownloadMenu
  )
  if %startgame%==191 (
    if exist "R6Downloads\Y5S1_VoidEdge\RainbowSix.exe" (
      echo Starting.....
      R6Downloads\Y5S1_VoidEdge\RainbowSix.exe /belaunch
      pause
      )
    goto DownloadMenu
  )
  if %startgame%==20 (
  	if exist "R6Downloads\Y5S2_Steel_Wave\RainbowSix.exe" (
  		echo Starting.....
  		R6Downloads\Y5S2_Steel_Wave\RainbowSix.exe /belaunch
  		pause
  		)
  	goto DownloadMenu
  )
  if %startgame%==201 (
    if exist "R6Downloads\Y5S2_SteelWave\RainbowSix.exe" (
      echo Starting.....
      R6Downloads\Y5S2_SteelWave\RainbowSix.exe /belaunch
      pause
      )
    goto DownloadMenu
  )
  if %startgame%==21 (
    if exist "R6Downloads\Y5S3_Shadow_Legacy\RainbowSix.exe" (
      echo Starting.....
      R6Downloads\Y5S3_Shadow_Legacy\RainbowSix.exe /belaunch
      pause
      )
  if %startgame%==22 (
    if exist "R6Downloads\Placeholder\RainbowSix.exe" (
      echo Starting.....
      R6Downloads\Placeholder\RainbowSix.exe /belaunch
      pause
      )
    goto DownloadMenu
  )
    goto DownloadMenu
  )
  ::End GameStarter
  ::Start EvenStrarter
  if %startgame%==1399 (
  	if exist "R6Downloads\Y3S3_MadHouse\RainbowSix.exe" (
  		echo Starting.....
  		R6Downloads\Y3S3_MadHouse\RainbowSix.exe /belaunch
  		pause
  		)
  	goto DownloadMenu
  )
  if %startgame%==1599 (
  	if exist "R6Downloads\Y4S1_RainbowIsMagic\RainbowSix.exe" (
  		echo Starting.....
  		R6Downloads\Y4S1_RainbowIsMagic\RainbowSix.exe /belaunch
  		pause
  		)
  	goto DownloadMenu
  )
  if %startgame%==1999 (
  	if exist "R6Downloads\Y5S1_TheGrandLarceny\RainbowSix.exe" (
  		echo Starting.....
  		R6Downloads\Y5S1_TheGrandLarceny\RainbowSix.exe /belaunch
  		pause
  		)
  	goto DownloadMenu
  )
  if %startgame%==2099 (
  	if exist "R6Downloads\Y5S2_MUTE\RainbowSix.exe" (
  		echo Starting.....
  		R6Downloads\Y5S2_MUTE\RainbowSix.exe /belaunch
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
  echo Download complete!
  echo It's DirectX!
  goto MainMenu
  )
  if %ERRORLEVEL% == 2 (
  MODE 100,40
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 228983 -manifest 8124929965194586177 -username %username% -remember-password -dir "R6Downloads\VC_2010_Redist" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's VC 2010 Redist!
  goto MainMenu
  )
  if %ERRORLEVEL% == 3 (
  MODE 100,40
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 228984 -manifest 2547553897526095397 -username %username% -remember-password -dir "R6Downloads\VC_2012_Redist" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's VC 2012 Redist!
  goto MainMenu
  )
  if %ERRORLEVEL% == 4 (
  MODE 100,40
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 228986 -manifest 8782296191957114623 -username %username% -remember-password -dir "R6Downloads\VC_2015_Redist" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's VC 2015 Redist!
  goto MainMenu
  )
  if %ERRORLEVEL% == 5 (
  MODE 100,40
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 228987 -manifest 4302102680580581867 -username %username% -remember-password -dir "R6Downloads\VC_2017_Redist" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's VC 2017 Redist!
  goto MainMenu
  )
  if %ERRORLEVEL% == 6 (
  cls
  goto MainCMD
  )
  goto dxvcredist
::dxvcredist END



::CREDIT START
::© 2020 SlejmUr
:Credit
  Title CREDIT
  MODE 75,20
  echo I would like to thank everyone who helped this project getting developed:
  echo Thanks Zer0Byte the first version of MenuV and for can I forked him code!
  echo Thanks DepotDownloader creators!
  echo Thanks SteamDB!
  echo Thanks Markster for Plaza's!
  echo And thank you for using it!
  echo Thanks Ancientkingg for Log idea, DotNet Checker Second Version
  echo First Version: 2020 June 17
  echo Updated Version: 2020 TDB
  pause
  cls
  goto MainMenu
::CREDIT END



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



exit
