::
::                        +hmNNNmh+    
::                       yMMMMMMMMMy  
::                       mMMMh hMMMd  
::                       mMMMh:oso:.  
::                       mMMMMMMMMMs  
::                       mMMNdNNhmMd  
::                       mMMs  `-sMd  
::          Rainbow Six  mMMy smMMMd    
::            Modding    mMMy mMMMMd  
::                       hMMy.NMMMMy  
::                       `ohmNMNmh+   
:: Zer0Bytes#4428 https://i.imgur.com/nBKIDOX.png
:: Updated by SlejmUr#4007 ✓ Verified Dickhead
::
@shift /0
@echo off
setlocal enableextensions enabledelayedexpansion

::STARTUP
  Title STARTUP
  echo Welcome to AIO Tool^^!
  echo Loading...
  echo Please be patient ^^!
  set homepath=%cd%
  set AllInOneVersion=1.3.2.1
  set discord=discord.gg/EvrGzAV
  set discordname=R6:S Modding United
  set DepotSDK=377237
  set SKUname=WW Content
  set lang=eng
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

::Github Connect START
  :github
    ping github.com >nul
    if errorlevel 1 (
    set Position=MainMenu
    echo Connection to GitHub failed, continue at your own risk.^^!
    set LOGINFO=Cannot establish connection to Github.
    set LogNumber=2
    pause
    goto logtolog
    ) 
    if errorlevel 0 (
    set Position=SiniCheck
    echo Connection to Github successful.^^!
    set LOGINFO=Connection to Github successful.
    set LogNumber=1
    goto logtolog
    )
    goto github
::Github Connect END


::Settings.ini get START
  :SiniCheck
    if exist "Resources\Settings.ini" (
      goto dotnetSET
    ) else (
      mkdir Resources
      goto noSini
    )
    goto SiniCheck

  :noSini
    set Position=SiniCheck
    MODE 78,20
    echo ------------------------------------------------------------------------------
    echo                              Downloading Settings.ini...
    echo ------------------------------------------------------------------------------
    curl -L  "https://github.com/SlejmUr/R6-AIOTool-Batch/raw/master/Requirements/Settings.ini" --output Settings.ini
    move Settings.ini Resources
    set LOGINFO=Settings.ini Downloaded and moved.
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
      goto ifdotnet
  :: SET SET END
::SET Things END


::Dotnet START
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
    echo .NET is not found in the registry.
    set LOGINFO=Registery editor not found dotnet
    set LogNumber=2
    goto logtolog
    ) else (
    echo .NET found.
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
    set LOGINFO= .NET Runtime is missing, please install it.
    set LogNumber=3
    goto logtolog

  :checkertwo
    set Position=if7zip
    if exist "C:\Program Files\dotnet\dotnet.exe" (
    echo .NET found.
    set LOGINFO=Exist checker is found the version
    set LogNumber=1
    goto logtolog
    ) else (
    set Position=dotnet
    echo .NET is missing, please install it.
    set LOGINFO=Exist checker not found dotnet
    set LogNumber=2
    goto logtolog
    )
    goto checkertwo
::Dotnet END


::7zip START
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
    echo                       Downloading 7-Zip as dependency...
    echo ------------------------------------------------------------------------------
    curl -L  "https://github.com/DataCluster0/R6TBBatchTool/raw/master/Requirements/7z.exe" --output 7z.exe
    move 7z.exe Resources
    set LOGINFO=7zip [as dependency] Successfully downloaded, Compressing....
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
    set LOGINFO=7zip Successfully downloaded.
    set LogNumber=1
    goto logtolog
::7zip END


::DD START
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
    goto DepotCheck

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
    set LOGINFO=DepotDownloader Download complete.
    set LogNumber=1
    goto logtolog
::DD END

::Plaza START
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
    echo                          Downloading Plaza Bypass...
    echo ------------------------------------------------------------------------------
    curl -L  "https://cdn.discordapp.com/attachments/722089860755881996/800424536646090782/Plazas.zip" --output plazas.zip
    ::Extract
    for %%I in ("plazas.zip") do (
    "Resources\7z.exe" x -y -o"Resources\" "%%I" -aoa && del %%I
    )
    set LOGINFO=Plaza Bypass Successfully downloaded.
    set LogNumber=1
    goto logtolog
::Plaza END


::cmdmenusel START
  :cmdCheck
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
    curl -L  "https://github.com/SlejmUr/R6-AIOTool-Batch/raw/master/Requirements/cmdmenusel.exe" --output cmdmenusel.exe
    move cmdmenusel.exe Resources
    set LOGINFO=cmdmenusel Successfully downloaded.
    set LogNumber=1
    goto logtolog
::cmdmenusel END

::replacer START
  :ReplacerCheck
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
    curl -L  "https://github.com/SlejmUr/R6-AIOTool-Batch/raw/master/Requirements/replacer.exe" --output replacer.exe
    move replacer.exe Resources
    set LOGINFO=Replacer Successfully downloaded.
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
    cls
    MODE 78,10
    echo Please type in your Steam username^^! [Not the profile name.]
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
    goto PopUpCheck
::FAQ popup END

::MainMenu START
:MainMenu
  set LastSelector=MainMenu
  set Position=MainMenu
  cls
  Title R6S AllInOne Tool
  MODE 62,25
  echo [93m----------------------------NOTES-----------------------------[0m
  echo  Rainbow Six Siege AllInOne Tool
  echo  [31mYou MUST have a copy of Siege on Steam to use the downloader^^![0m
  echo  This tools is forked from [91mZer0Bytes'[0m manifest tool
  echo  Our Discord Server: [94m%discord%[0m 
  echo  AIO Tool Version: [32m%AllInOneVersion%[0m 
  echo  Steam User: [96m%username%[0m ^| Sku : [36m%SKUname%[0m 
  echo  FAQ Language: %lang% ^| Downloader for: %discordname%
  echo [93m----------------------------SELECT----------------------------[0m
  Resources\cmdmenusel f830 "  FAQ and Notes" "  Game Menu" "  Extra Language" "  4K Textures" "  DirectX and VC Redist Downloader" "  Credits" "  BattlEye Checker" "  Change Steam Username" "  Old Logs Delete" "  Zer0 folder Renamer" "  Crack replace" "  SKU Switch" "  Lang Switch" "  Update" "  Exit"

  if %ERRORLEVEL% == 1 (
  set Position=faq
  goto GoingTo
  )
  if %ERRORLEVEL% == 2 (
  set Position=GameMenu
  goto GoingTo
  )
  if %ERRORLEVEL% == 3 (
  set Position=ExtraMenu
  goto GoingTo
  )
  if %ERRORLEVEL% == 4 (
  set Position=TextureMenu
  goto GoingTo
  )
  if %ERRORLEVEL% == 5 (
  set Position=dxvcredistdownloader
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
  MODE 78,20
  set /p username="Enter New Steam Username:"
  set "LOGINFO=Changing Steam UserName to %username%"
  set LogNumber=1
  goto logtolog
  )
  if %ERRORLEVEL% == 9 (
  cls
  MODE 78,20
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
  if %ERRORLEVEL% == 11 (
  set Position=CrackMenu
  goto GoingTo
  )
  if %ERRORLEVEL% == 12 (
    if %DepotSDK% == 377237 (
      set DepotSDK=377238
      set SKUname=RUS Content
      ) else (
      set DepotSDK=377237
      set SKUname=WW Content
      )
  )
  if %ERRORLEVEL%==13 (
    if %lang% == eng (
      set lang=hun
      ) else (
      set lang=eng
      )
  )
  if %ERRORLEVEL%==14 (
  set Position=Update
  goto GoingTo
  ) 
  if %ERRORLEVEL% == 15 (
  set Position=exiting
  set LOGTYPE=1
  set LOGINFO=Exited
  goto logtolog
  )
  goto MainMenu
::MainMenu END


::FAQ and notes START
  :faq
    cls
    Title FAQ
    MODE 120,44
    curl -L  "https://raw.githubusercontent.com/SlejmUr/R6-AIOTool-Batch/master/TXTS/lang/"%lang%"/faq.txt"
    echo.
    pause
    cls
    goto Notes
  ::and
  :Notes
    Title Notes
    MODE 90,40
    curl -L  "https://raw.githubusercontent.com/SlejmUr/R6-AIOTool-Batch/master/TXTS/lang/"%lang%"/notes.txt"
    echo  Discord: SlejmUr#4007 ^| Server: %discord%
    echo.
    curl -L  "https://raw.githubusercontent.com/SlejmUr/R6-AIOTool-Batch/master/TXTS/lang/"%lang%"/shey-notes.txt"
    echo.
    Resources\replacer.exe Resources\Settings.ini POPUP=1 POPUP=0 >nul
    pause
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


::INSTALL START
  ::InstallMenu START
  :InstallMenu
    set LastSelector=InstallMenu
    cls
    Title Rainbow Six Siege Install Selector
    MODE 50,14
    echo [93m-----------------------NOTES----------------------[0m
    echo                 Install Selector
    echo            [31mEverything is now stable^^![0m
    echo [93m----------------------SELECT----------------------[0m
    Resources\cmdmenusel f8f0 "   Version Downloader" "   Event Downloader" "   Release Downloader" "   Shey Downloader" "   Custom Downloader" "   4K Textures Downloader" "   Extra Language Downloader" "   Back"

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
    set Position=SheyMenu
    goto GoingTo
    )
    if %ERRORLEVEL% == 5 (
    set Position=CustomMenu
    goto GoingTo
    )
    if %ERRORLEVEL% == 6 (
    set Position=TextureMenu
    goto GoingTo
    )
    if %ERRORLEVEL% == 7 (
    set Position=ExtraMenu
    goto GoingTo
    )
    if %ERRORLEVEL% == 8 (
    set Position=GameMenu
    goto BackTo
    )
    goto InstallMenu
  ::InstallMenu END

  ::VersionMenu START
  :VersionMenu
    cls
    Title Rainbow Six Siege Version Downloader
    MODE 50,27
    echo [93m-----------------------NOTES----------------------[0m
    echo                 Version Downloader
    echo        Manifests from Zer0Bytes^' Manifest tool
    echo [93m----------------------SELECT----------------------[0m
    Resources\cmdmenusel f8f0 "   Vanilla" "   Black Ice" "   Dust Line" "   Skull Rain" "   Red Crow" "   Velvet Shell" "   Health" "   Blood Orchid" "   White Noise" "   Chimera" "   Para Bellum" "   Grim Sky" "   Wind Bastion" "   Burnt Horizon" "   Phantom Sight" "   Ember Rise" "   Shifting Tides" "   Void Edge" "   Steel Wave [Mute]" "   Steel Wave [Omega/Mute]" "   Sugar Fright / Telly [R6Global]" "   Back"

    if %ERRORLEVEL%==1 (
    :Vanilla
    set Position=Downloading
    set DownloadName=Vanilla
    set ManifestContent=3893422760579204530
    set DownloadPath=R6Downloads\Y1S0_Vanilla
      if %DepotSDK% == 377237 (
        set ManifestSDK=8358812283631269928
      ) else (
        set ManifestSDK=6835384933146381100
      )
    goto GoingTo
    )
    if %ERRORLEVEL%==2 (
    :BlackIce
    set Position=Downloading
    set DownloadName=Black Ice
    set ManifestContent=7932785808040895147
    set DownloadPath=R6Downloads\Y1S1_Black_Ice
    if %DepotSDK% == 377237 (
        set ManifestSDK=5188997148801516344
      ) else (
        set ManifestSDK=5362991837480196824
      )
    goto GoingTo
    )
    if %ERRORLEVEL%==3 (
    :DustLine
    set Position=Downloading
    set DownloadName=Dust Line
    set ManifestContent=2206497318678061176
    set DownloadPath=R6Downloads\Y1S2_Dust_Line
    if %DepotSDK% == 377237 (
        set ManifestSDK=2303064029242396590
      ) else (
        set ManifestSDK=3040224537841664111
      )
    goto GoingTo
    )
    if %ERRORLEVEL%==4 (
    :SkullRainZero
    set Position=Downloading
    set DownloadName=Skull Rain 4.2
    set ManifestContent=5851804596427790505
    set DownloadPath=R6Downloads\Y1S3_SkullRain
    if %DepotSDK% == 377237 (
        set ManifestSDK=5819137024728546741
      ) else (
        set ManifestSDK=7597187834633512926
      )
    goto GoingTo
    )
    if %ERRORLEVEL%==5 (
    :RedCrow
    set Position=Downloading
    set DownloadName=Red Crow
    set ManifestContent=8569920171217002292
    set DownloadPath=R6Downloads\Y1S4_Red_Crow
    if %DepotSDK% == 377237 (
        set ManifestSDK=3576607363557872807
      ) else (
        set ManifestSDK=912564683190696342
      )
    goto GoingTo
    )
    if %ERRORLEVEL%==6 (
    :VelvetShell
    set Position=Downloading
    set DownloadName=Velvet Shell
    set ManifestContent=8006071763917433748
    set DownloadPath=R6Downloads\Y2S1_Velvet_Shell
    if %DepotSDK% == 377237 (
        set ManifestSDK=2248734317261478192
      ) else (
        set ManifestSDK=2687181326074258760
      )
    goto GoingTo
    )
    if %ERRORLEVEL%==7 (
    :Health
    set Position=Downloading
    set DownloadName=Health
    set ManifestContent=708773000306432190
    set DownloadPath=R6Downloads\Y2S2_Health
    if %DepotSDK% == 377237 (
        set ManifestSDK=5875987479498297665
      ) else (
        set ManifestSDK=8542242518901049325
      )
    goto GoingTo
    )
    if %ERRORLEVEL%==8 (
    :BloodOrchidZero
    set Position=Downloading
    set DownloadName=Blood Orchid 2.3.1.1 [Zer0]
    set ManifestContent=1613631671988840841
    set DownloadPath=R6Downloads\Y2S3_BloodOrchid
    if %DepotSDK% == 377237 (
        set ManifestSDK=6309847129820490464
      ) else (
        set ManifestSDK=3899500673949464829
      )
    goto GoingTo
    )
    if %ERRORLEVEL%==9 (
    :WhiteNoiseZero
    set Position=Downloading
    set DownloadName=White Noise [Zer0]
    set ManifestContent=4221297486420648079
    set DownloadPath=R6Downloads\Y2S4_WhiteNoise
    if %DepotSDK% == 377237 (
        set ManifestSDK=8748734086032257441
      ) else (
        set ManifestSDK=8175359039160965183
      )
    goto GoingTo
    )
    if %ERRORLEVEL%==10 (
    :Chimera
    set Position=Downloading
    set DownloadName=Chimera
    set ManifestContent=4701787239566783972
    set DownloadPath=R6Downloads\Y3S1_Chimera
    if %DepotSDK% == 377237 (
        set ManifestSDK=5071357104726974256
      ) else (
        set ManifestSDK=4768963659370299631
      )
    goto GoingTo
    )
    if %ERRORLEVEL%==11 (
    :ParaBellum
    set Position=Downloading
    set DownloadName=Para Bellum
    set ManifestContent=8765715607275074515
    set DownloadPath=R6Downloads\Y3S2_Para_Bellum
    if %DepotSDK% == 377237 (
        set ManifestSDK=8312108283310615233
      ) else (
        set ManifestSDK=1474330970340166539
      )
    goto GoingTo
    )
    if %ERRORLEVEL%==12 (
    :MadHouse
    set Position=Downloading
    set DownloadName=GRIM SKY [Zer0] / Mad House
    set ManifestContent=7781202564071310413
    set DownloadPath=R6Downloads\Y3S3_MadHouse
    if %DepotSDK% == 377237 (
        set ManifestSDK=5562094852451837435
      ) else (
        set ManifestSDK=5465169470949211447
      )
    goto GoingTo
    )
    if %ERRORLEVEL%==13 (
    :WindBastion
    set Position=Downloading
    set DownloadName=Wind Bastion
    set ManifestContent=7659555540733025386
    set DownloadPath=R6Downloads\Y3S4_Wind_Bastion
    if %DepotSDK% == 377237 (
        set ManifestSDK=6502258854032233436
      ) else (
        set ManifestSDK=5406593359909338734
      )
    goto GoingTo
    )
    if %ERRORLEVEL%==14 (
    :RainbowIsMagic
    set Position=Downloading
    set DownloadName=BURNT HORIZON [Zer0] / Rainbow Is Magic
    set ManifestContent=5935578581006804383
    set DownloadPath=R6Downloads\Y4S1_RainbowIsMagic
    if %DepotSDK% == 377237 (
        set ManifestSDK=8356277316976403078
      ) else (
        set ManifestSDK=1384328559966859661
      )
    goto GoingTo
    )
    if %ERRORLEVEL%==15 (
    :PhantomSight
    set Position=Downloading
    set DownloadName=PHANTOM SIGHT / Showdown
    set ManifestContent=5408324128694463720
    set DownloadPath=R6Downloads\Y4S2_Phantom_Sight
    if %DepotSDK% == 377237 (
        set ManifestSDK=693082837425613508
      ) else (
        set ManifestSDK=3326664059403997209
      )
    goto GoingTo
    )
    if %ERRORLEVEL%==16 (
    :DoktorsCurse
    set Position=Downloading
    set DownloadName=EMBER RISE [Zer0] / Doctors Curse
    set ManifestContent=7869081741739849703
    set DownloadPath=R6Downloads\Y4S3_DoktorsCurse
    if %DepotSDK% == 377237 (
        set ManifestSDK=3546781236735558235
      ) else (
        set ManifestSDK=9016692046802024636
      )
    goto GoingTo
    )
    if %ERRORLEVEL%==17 (
    :ShiftingTides
    set Position=Downloading
    set DownloadName=Shifting Tides
    set ManifestContent=1842268638395240106
    set DownloadPath=R6Downloads\Y4S4_Shifting_Tides
    if %DepotSDK% == 377237 (
        set ManifestSDK=299124516841461614
      ) else (
        set ManifestSDK=510172308722680354
      )
    goto GoingTo
    )
    if %ERRORLEVEL%==18 (
    :GangDestruction
    set Position=Downloading
    set DownloadName=Void Edge [Zer0] / Gang Destruction
    set ManifestContent=1739364586766771991
    set DownloadPath=R6Downloads\Y5S1_GangDestruction
    if %DepotSDK% == 377237 (
        set ManifestSDK=1378283477131353042
      ) else (
        set ManifestSDK=8141661820686844368
      )
    goto GoingTo
    )
    ::steel wave Y5S2.3.0_C5433707_D1028748_S38774_14603060 (Mute Protocol)
    if %ERRORLEVEL%==19 (
    :MUTEProtocol
    set Position=Downloading
    set DownloadName=Steel Wave [Mute Protocol]
    set ManifestContent=1610834739284564851
    set DownloadPath=R6Downloads\Y5S2_MUTE
    if %DepotSDK% == 377237 (
        set ManifestSDK=2287849678928593252
      ) else (
        set ManifestSDK=8753206532335363245
      )
    goto GoingTo
    )
    ::SteelWave (omega/Mute Protocol)
    if %ERRORLEVEL%==20 (
    :OmegaSteelWave
    set Position=Downloading
    set DownloadName=Steel Wave [Omega/Mute Protocol]
    set ManifestContent=893971391196952070
    set DownloadPath=R6Downloads\Y5S2_SteelWave
    if %DepotSDK% == 377237 (
        set ManifestSDK=4367817844736324940
      ) else (
        set ManifestSDK=6938478745264725185
      )
    goto GoingTo
    )
    if %ERRORLEVEL%==21 (
    :Sugar_Fright_Mystc
    set Position=Downloading
    set DownloadName=Sugar Fright / Telly [R6Global]
    set ManifestContent=3089981610366186823
    set DownloadPath=R6Downloads\Sugar_Fright
    if %DepotSDK% == 377237 (
        set ManifestSDK=85893637567200342
      ) else (
        set ManifestSDK=4020038723910014041
      )
    goto GoingTo
    ) 
    if %ERRORLEVEL% == 22 (
    set Position=InstallMenu
    goto BackTo
    )
    goto VersionMenu
  ::VersionMenu END

  ::EventMenu START
  :EventMenu
    cls
    Title Rainbow Six Siege Event Downloader
    MODE 64,20
    echo [93m--------------------------NOTES---------------------------------[0m
    echo   Outbreak will download Operation Chimera.
    echo   Road To S.I. will download Shifting Tides.
    echo   Showdown will download Phantom Sight.
    echo   Mute [Omega] is supported by Myxtc.Jnx^'s R6SGlobal tool.
    echo [93m--------------------------SELECT--------------------------------[0m
    Resources\cmdmenusel f8f0 "   Outbreak" "   Mad House" "   Rainbow is Magic" "   Showdown" "   Doctors Curse" "   Road To S.I. 2020" "   Gang Destruction / Golden Gun" "   M.U.T.E Protocol | Not supported by Omega" "   M.U.T.E Protocol | Omega/R6Global" "   Sugar Fright / Telly | Before Chanka Update" "   Sugar Fright / Telly | After Chanka Update [R6Global]" "   Back"

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
    set Position=Downloading
    set DownloadName=Sugar Fright / Telly
    set ManifestContent=5436378897406471956
    set DownloadPath=R6Downloads\Y5S3_Sugar_Fright
    if %DepotSDK% == 377237 (
      set ManifestSDK=3265954110064157115
      ) else (
      set ManifestSDK=693505476132312360
      )
    goto GoingTo
    )
    if %ERRORLEVEL%==11 (
    goto Sugar_Fright_Mystc
    ) 
    if %ERRORLEVEL%==12 (
    set Position=InstallMenu
    goto BackTo
    )
    goto EventMenu
  ::EventMenu END

  ::ReleaseMenu START
  :ReleaseMenu
    cls
    Title Rainbow Six Siege Release Downloader
    MODE 50,28
    echo [93m-----------------------NOTES----------------------[0m
    echo                 Release Downloader
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
    set Position=Downloading
    set DownloadName=Skull Rain
    set ManifestContent=6528040263176897081
    set DownloadPath=R6Downloads\Y1S3_Skull_Rain
    if %DepotSDK% == 377237 (
        set ManifestSDK=3552784069501585540
      ) else (
        set ManifestSDK=2956768406107766016
      )
    goto GoingTo
    )
    if %ERRORLEVEL%==5 (
    goto RedCrow
    )
    if %ERRORLEVEL%==6 (
    goto VelvetShell
    )
    if %ERRORLEVEL%==7 (
    goto Health
    )
    if %ERRORLEVEL%==8 (
    :BloodOrchid
    set Position=Downloading
    set DownloadName=Blood Orchid
    set ManifestContent=2595400291492146232
    set DownloadPath=R6Downloads\Y2S3_Blood_Orchid
    if %DepotSDK% == 377237 (
        set ManifestSDK=8738820022932508379
      ) else (
        set ManifestSDK=4662662335520989204
      )
    goto GoingTo
    )
    if %ERRORLEVEL%==9 (
    :WhiteNoise
    set Position=Downloading
    set DownloadName=White Noise
    set ManifestContent=2783803489764777627
    set DownloadPath=R6Downloads\Y2S4_White_Noise
    if %DepotSDK% == 377237 (
        set ManifestSDK=2066250193950057921
      ) else (
        set ManifestSDK=8421028160473337894
      )
    goto GoingTo
    )
    if %ERRORLEVEL%==10 (
    goto Chimera
    )
    if %ERRORLEVEL%==11 (
    goto ParaBellum
    )
    if %ERRORLEVEL%==12 (
    :GrimSky
    set Position=Downloading
    set DownloadName=Grim Sky
    set ManifestContent=4133951394045241747
    set DownloadPath=R6Downloads\Y3S3_Grim_Sky
    if %DepotSDK% == 377237 (
        set ManifestSDK=7286067994760020542
      ) else (
        set ManifestSDK=3144556314994867170
      )
    goto GoingTo
    )
    if %ERRORLEVEL%==13 (
    goto WindBastion
    )
    if %ERRORLEVEL%==14 (
    :BurntHorizon
    set Position=Downloading
    set DownloadName=Burnt Horizon
    set ManifestContent=4355229858723790756
    set DownloadPath=R6Downloads\Y4S1_Burnt_Horizon
    if %DepotSDK% == 377237 (
        set ManifestSDK=8985694971177711792
      ) else (
        set ManifestSDK=3777349673527123995
      )
    goto GoingTo
    )
    if %ERRORLEVEL%==15 (
    goto PhantomSight
    )
    if %ERRORLEVEL%==16 (
    :EmberRise
    set Position=Downloading
    set DownloadName=Ember Rise
    set ManifestContent=5429930338066808153
    set DownloadPath=R6Downloads\Y4S3_Ember_Rise
    if %DepotSDK% == 377237 (
        set ManifestSDK=7309481042294838052
      ) else (
        set ManifestSDK=684480090862996679
      )
    goto GoingTo
    )
    if %ERRORLEVEL%==17 (
    goto ShiftingTides
    )
    if %ERRORLEVEL%==18 (
    :VoidEdge
    set Position=Downloading
    set DownloadName=Void Edge
    set ManifestContent=2810676266503656332
    set DownloadPath=R6Downloads\Y5S1_Void_Edge
    if %DepotSDK% == 377237 (
        set ManifestSDK=8007091753837589034
      ) else (
        set ManifestSDK=2583838033617047180
      )
    goto GoingTo
    )
    if %ERRORLEVEL%==19 (
    :SteelWave
    set Position=Downloading
    set DownloadName=Steel Wave
    set ManifestContent=2911638056757212246
    set DownloadPath=R6Downloads\Y5S2_Steel_Wave
    if %DepotSDK% == 377237 (
        set ManifestSDK=1296806240678481187
      ) else (
        set ManifestSDK=5838065097101371940
      )
    goto GoingTo
    )
    if %ERRORLEVEL%==20 (
    :ShadowLegacy
    set Position=Downloading
    set DownloadName=Shadow Legacy
    set ManifestContent=7750070106878890861
    set DownloadPath=R6Downloads\Y5S3_Shadow_Legacy
    if %DepotSDK% == 377237 (
        set ManifestSDK=885453180592640750
      ) else (
        set ManifestSDK=6833050800226599890
      )
    goto GoingTo
    )
    if %ERRORLEVEL%==21 (
    :NeonDawn
    set Position=Downloading
    set DownloadName=Neon Dawn
    set ManifestContent=7979405601806736439
    set DownloadPath=R6Downloads\Y5S4_Neon_Dawn
    if %DepotSDK% == 377237 (
        set ManifestSDK=752517632960395491
      ) else (
        set ManifestSDK=4263017894965855363
      )
    goto GoingTo
    )
    if %ERRORLEVEL% == 22 (
    set Position=InstallMenu
    goto BackTo
    )
    goto ReleaseMenu
  ::ReleaseMenu END

  ::SheyMenu START
  :SheyMenu
    cls
    Title Rainbow Six Siege Shey Downloader
    MODE 50,8
    echo [93m-----------------------NOTES----------------------[0m
    echo                   Shey Downloader
    echo        Only shey searched build^^! Check notes^^!
    echo [93m----------------------SELECT----------------------[0m
    Resources\cmdmenusel f8f0 "   Y2S3_BloodOrchid2" "   Y5S1_VoidEdge" "   Back"

    if %ERRORLEVEL%==1 (
    :BloodOrchidShey
    set Position=Downloading
    set DownloadName=Blood Orchid [Shey]
    set ManifestContent=1613631671988840841
    set DownloadPath=R6Downloads\Y2S3_BloodOrchid2
    if %DepotSDK% == 377237 (
        set ManifestSDK=6708129824495912434
      ) else (
        set ManifestSDK=4662662335520989204
      )
    goto GoingTo
    )
    if %ERRORLEVEL%==2 (
    :VoidEdgeShey
    set Position=Downloading
    set DownloadName=Void Edge [Shey]
    set ManifestContent=6296533808765702678
    set DownloadPath=R6Downloads\Y5S1_VoidEdge
    if %DepotSDK% == 377237 (
        set ManifestSDK=4736360397583523381
      ) else (
        set ManifestSDK=2583838033617047180
      )
    goto GoingTo
    )
    if %ERRORLEVEL% == 3 (
    set Position=InstallMenu
    goto BackTo
    )
    goto SheyMenu
  ::SheyMenu END

  ::CustomMenu START
  :CustomMenu
    cls
    Title Rainbow Six Siege Custom Downloader
    MODE 50,14
    echo [93m-----------------------NOTES----------------------[0m
    echo                  Custom Downloader
    echo         You need to set the values manually^^!
    echo   This can be used to download any game you own.
    echo [93m----------------------SELECT----------------------[0m
    Resources\cmdmenusel f8f0 "   Set Default things" "   Set App" "   Set Depot" "   Set Manifest" "   Set Path/Dir" "   Start Download" "   Back"
    
    if %ERRORLEVEL% == 1 (
    cls
    set AppID=359550
    set CustomDir="R6Downloads/%ALL%"
    echo Default values set. ^^!
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

  ::Downloading START
  :Downloading
    MODE 100,40
    dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot %DepotSDK% -manifest %ManifestSDK% -username %username% -remember-password -dir "%DownloadPath%" -validate -max-servers 15 -max-downloads 10
    dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest %ManifestContent% -username %username% -remember-password -dir "%DownloadPath%" -validate -max-servers 15 -max-downloads 10
    echo.
    echo Download complete^^!
    echo It's %DownloadName%
    pause
    cls
    set Downloaded="%DownloadName%"
    goto DownloadCheck
    ::Downloading END
::INSTALL END

::4K TEXTURES START
  ::TextureMenu START
  :TextureMenu
    cls
    Title Rainbow Six Siege 4K Textures Downloader
    MODE 50,10
    echo [93m----------------------NOTES-----------------------[0m
    echo               4K Textures Selector
    echo             Event Textures are added^^! 
    echo [93m----------------------SELECT----------------------[0m
    Resources\cmdmenusel f8f0 "   4K Version" "   4K Event" "   4K Release" "   4k Shey" "   Back"

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
    set Position=4KShey
    goto GoingTo
    )
    if %ERRORLEVEL% == 5 (
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
    MODE 50,26
    echo [93m----------------------NOTES-----------------------[0m
    echo   Health, White Noise, Void Edge, Vanilla, etc...
    echo   Similar to the ones in R6Manifest / 4kRelease.
    echo [93m----------------------SELECT----------------------[0m
    Resources\cmdmenusel f8f0 "   Vanilla" "   Black Ice" "   Dust Line" "   Skull Rain" "   Red Crow" "   Velvet Shell" "   Health" "   Blood Orchid" "   White Noise" "   Chimera" "   Para Bellum" "   Grim Sky" "   Wind Bastion" "   Burnt Horizon" "   Phantom Sight" "   Ember Rise" "   Shifting Tides" "   Void Edge" "   Steel Wave [Mute]" "   Back"

    if %ERRORLEVEL%==1 (
    :Vanilla4k
    set Position=Download4K
    set Name4K=Vanilla 4K
    set Path4K=R6Downloads\Y1S0_Vanilla
    set Manifest4K=8394183851197739981
    goto GoingTo
    )
    if %ERRORLEVEL%==2 (
    :BlackIce4k
    set Position=Download4K
    set Name4K=Black Ice 4K
    set Path4K=R6Downloads\Y1S1_Black_Ice
    set Manifest4K=3756048967966286899
    goto GoingTo
    )
    if %ERRORLEVEL%==3 (
    :DustLine4k
    set Position=Download4K
    set Name4K=Dust Line 4K
    set Path4K=R6Downloads\Y1S2_Dust_Line
    set Manifest4K=1338949402410764888
    goto GoingTo
    )
    if %ERRORLEVEL%==4 (
    :SkullRain4kZero
    set Position=Download4K
    set Name4K=Skull Rain [Zero] 4K
    set Path4K=R6Downloads\Y1S3_SkullRain
    set Manifest4K=3267970968757091405
    goto GoingTo
    )
    if %ERRORLEVEL%==5 (
    :RedCrow4k
    set Position=Download4K
    set Name4K=Red Crow 4K
    set Path4K=R6Downloads\Y1S4_Red_Crow
    set Manifest4K=1825939060444887403
    goto GoingTo
    )
    if %ERRORLEVEL%==6 (
    :VelvetShell4k
    set Position=Download4K
    set Name4K=Velvet Shell 4K
    set Path4K=R6Downloads\Y2S1_Velvet_Shell
    set Manifest4K=3196596628759979362
    goto GoingTo
    )
    if %ERRORLEVEL%==7 (
    :Health4k
    set Position=Download4K
    set Name4K=Health 4K
    set Path4K=R6Downloads\Y2S2_Health
    set Manifest4K=7497579858536910279
    goto GoingTo
    )
    if %ERRORLEVEL%==8 (
    :BloodOrchid4kZero
    set Position=Download4K
    set Name4K=Blood Orchid [Zero] 4K
    set Path4K=R6Downloads\Y2S3_BloodOrchid
    set Manifest4K=6420469519659049757
    goto GoingTo
    )
    if %ERRORLEVEL%==9 (
    :WhiteNoise4kZero
    set Position=Download4K
    set Name4K=White Noise [Zero] 4K
    set Path4K=R6Downloads\Y2S4_WhiteNoise
    set Manifest4K=959656357428794421
    goto GoingTo
    )
    if %ERRORLEVEL%==10 (
    :Chimera4k
    set Position=Download4K
    set Name4K=Chimera / Outback 4K
    set Path4K=R6Downloads\Y3S1_Chimera
    set Manifest4K=1668513364192382097
    goto GoingTo
    )
    if %ERRORLEVEL%==11 (
    :ParaBellum4k
    set Position=Download4K
    set Name4K=Para Bellum 4K
    set Path4K=R6Downloads\Y3S2_Para_Bellum
    set Manifest4K=204186978012641075
    goto GoingTo
    )
    if %ERRORLEVEL%==12 (
    :MadHouse4k
    set Position=Download4K
    set Name4K=Mad House 4K
    set Path4K=R6Downloads\Y3S3_MadHouse
    set Manifest4K=6431001239225997495
    goto GoingTo
    )
    if %ERRORLEVEL%==13 (
    :WindBastion4k
    set Position=Download4K
    set Name4K=Wind Bastion 4K
    set Path4K=R6Downloads\Y3S4_Wind_Bastion
    set Manifest4K=2243348760021617592
    goto GoingTo
    )
    if %ERRORLEVEL%==14 (
    :RainbowIsMagic4k
    set Position=Download4K
    set Name4K==Rainbow Is Magic 4K
    set Path4K=R6Downloads\Y4S1_RainbowIsMagic
    set Manifest4K=3462709886432904855
    goto GoingTo
    )
    if %ERRORLEVEL%==15 (
    :PhantomSight4k
    set Position=Download4K
    set Name4K==Phantom Sight 4K
    set Path4K=R6Downloads\Y4S2_Phantom_Sight
    set Manifest4K=4107080515154236795
    goto GoingTo
    )
    if %ERRORLEVEL%==16 (
    :DoktorsCurse4k
    set Position=Download4K
    set Name4K=Doktors Curse 4K
    set Path4K=R6Downloads\Y4S3_DoktorsCurse
    set Manifest4K=4319184561394137009
    goto GoingTo
    )
    if %ERRORLEVEL%==17 (
    :ShiftingTides4k
    set Position=Download4K
    set Name4K=Shifting Tides / Road To S.I. 4K
    set Path4K=R6Downloads\Y4S4_Shifting_Tides
    set Manifest4K=6048763664997452513
    goto GoingTo

    )
    if %ERRORLEVEL%==18 (
    :GangDestruction4k
    set Position=Download4K
    set Name4K=Gang Destruction 4K
    set Path4K=R6Downloads\Y5S1_GangDestruction
    set Manifest4K=1775661942779524815
    goto GoingTo
    )
    if %ERRORLEVEL%==19 (
    :MUTEProtocol4k
    set Position=Download4K
    set Name4K=MUTE Protocol 4K
    set Path4K=R6Downloads\Y5S2_MUTE
    set Manifest4K=1430519549301269175
    goto GoingTo
    )
    if %ERRORLEVEL% == 20 (
    set Position=TextureMenu
    goto BackTo
    )
    goto 4kVersion
  ::4kVersion END

  ::4kEvent START
  :4kEvent
    cls
    Title Rainbow Six Siege 4K Event Downloader
    MODE 50,16
    echo [93m----------------------NOTES-----------------------[0m
    echo        Outbreak will download Chimera 4K
    echo    Road To S.I. will download Shifting Tides 4K
    echo        Showdown will download Phantom Sight 4K
    echo [93m----------------------SELECT----------------------[0m
    Resources\cmdmenusel f8f0 "   Outbreak" "   Mad House" "   Rainbow is Magic" "   Showdown" "   Doktors Curse" "   Road To S.I. 2020" "   The Grand Larceny / Golden Gun" "   M.U.T.E Protocol (Supported by Omega)" "   Sugar Fright / Telly" "   Back"
    
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
    set Position=Download4K
    set Name4K=Sugar Fright / Telly 4K
    set Path4K=R6Downloads\Y5S3_Sugar_Fright
    set Manifest4K=3569318872166878802
    goto GoingTo
    )
    if %ERRORLEVEL% == 10 (
    set Position=TextureMenu
    goto BackTo
    )
    goto 4kEvent
  ::4kEvent END

  ::4kRelease START
  :4kRelease
    cls
    Title Rainbow Six Siege 4K Release Downloader
    MODE 50,28
    echo [93m----------------------NOTES-----------------------[0m
    echo   Health, White Noise, Void Edge, Vanilla, etc...
    echo   Similar to the ones in R6Manifest / 4kVersion.
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
    set Position=Download4K
    set Name4K=Skull Rain 4K
    set Path4K=R6Downloads\Y1S3_Skull_Rain
    set Manifest4K=5184390432533910806
    goto GoingTo
    )
    if %ERRORLEVEL%==5 (
    goto RedCrow4k
    )
    if %ERRORLEVEL%==6 (
    goto VelvetShell4k
    )
    if %ERRORLEVEL%==7 (
    goto Health4k
    )
    if %ERRORLEVEL%==8 (
    :BloodOrchid4k
    set Position=Download4K
    set Name4K=Blood Orchid 4K
    set Path4K=R6Downloads\Y2S3_Blood_Orchid
    set Manifest4K=3065193946575458487
    goto GoingTo
    )
    if %ERRORLEVEL%==9 (
    :WhiteNoise4k
    set Position=Download4K
    set Name4K=White Noise 4K
    set Path4K=R6Downloads\Y2S4_White_Noise
    set Manifest4K=1118649577165385479
    goto GoingTo
    )
    if %ERRORLEVEL%==10 (
    goto Chimera4k
    )
    if %ERRORLEVEL%==11 (
    goto ParaBellum4k
    )
    if %ERRORLEVEL%==12 (
    :GrimSky4k
    set Position=Download4K
    set Name4K=Grim Sky 4K
    set Path4K=R6Downloads\Y3S3_Grim_Sky
    set Manifest4K=3378966402050009606
    goto GoingTo
    )
    if %ERRORLEVEL%==13 (
    goto WindBastion4k
    )
    if %ERRORLEVEL%==14 (
    :BurntHorizon4k
    set Position=Download4K
    set Name4K=Burnt Horizon 4K
    set Path4K=R6Downloads\Y4S1_Burnt_Horizon
    set Manifest4K=888629411354320742
    goto GoingTo
    )
    if %ERRORLEVEL%==15 (
    goto PhantomSight4k
    )
    if %ERRORLEVEL%==16 (
    :EmberRise4k
    set Position=Download4K
    set Name4K=Ember Rise 4K
    set Path4K=R6Downloads\Y4S3_Ember_Rise
    set Manifest4K=8340682081776225833
    goto GoingTo
    )
    if %ERRORLEVEL%==17 (
    goto ShiftingTides4k
    )
    if %ERRORLEVEL%==18 (
    :VoidEdge4k
    set Position=Download4K
    set Name4K=Void Edge 4K
    set Path4K=R6Downloads\Y5S1_Void_Edge
    set Manifest4K=2194493692563107142
    goto GoingTo
    )
    if %ERRORLEVEL%==19 (
    :SteelWave4k
    set Position=Download4K
    set Name4K=Steel Wave 4K
    set Path4K=R6Downloads\Y5S2_Steel_Wave
    set Manifest4K=3257522596542046976
    goto GoingTo
    )
    if %ERRORLEVEL%==20 (
    :ShadowLegacy4k
    set Position=Download4K
    set Name4K=Shadow Legacy 4K
    set Path4K=R6Downloads\Y5S3_Shadow_Legacy
    set Manifest4K=5051396185388503167
    goto GoingTo
    )
    if %ERRORLEVEL%==21 (
    :NeonDawn4k
    set Position=Download4K
    set Name4K=Neon Dawn 4K
    set Path4K=R6Downloads\Y5S4_Neon_Dawn
    set Manifest4K=7681923351308243133
    goto GoingTo
    )
    if %ERRORLEVEL% == 22 (
    set Position=TextureMenu
    goto BackTo
    )
    goto 4kRelease
  ::4kRelease END

  ::4KShey START
  :4KShey
    cls
    Title Rainbow Six Siege 4K Shey Downloader
    MODE 50,8
    echo [93m-----------------------NOTES----------------------[0m
    echo                4K Shey Downloader
    echo        Only shey searched build^^! Check notes^^!
    echo [93m----------------------SELECT----------------------[0m
    Resources\cmdmenusel f8f0 "   Y2S3_BloodOrchid2" "   Y5S1_VoidEdge" "   Back"

    if %ERRORLEVEL%==1 (
    :BloodOrchidShey4k
    set Position=Download4K
    set Name4K=Blood Orchid [Shey] 4K
    set Path4K=R6Downloads\Y2S3_BloodOrchid2
    set Manifest4K=6420469519659049757
    goto GoingTo
    )
    if %ERRORLEVEL%==2 (
    :VoidEdgeShey4k
    set Position=Download4K
    set Name4K=Void Edge [Shey] 4K
    set Path4K=R6Downloads\Y5S1_VoidEdge
    set Manifest4K=2194493692563107142
    goto GoingTo
    )
    if %ERRORLEVEL% == 3 (
    set Position=TextureMenu
    goto BackTo
    )
    goto 4KShey
  ::4KSheyMenu END


  ::Download4K START
  :Download4K
    MODE 100,40
    dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377239 -manifest %Manifest4K% -username %username% -remember-password -dir "%Path4K%" -validate -max-servers 15 -max-downloads 10
    echo.
    echo Download complete^^!
    echo It's %Name4K%
    pause
    cls
    set Downloaded="%Name4K%"
    goto DownloadCheck
  ::Download4K END
::4K TEXTURES END


::UNINSTALL START
  ::UninstallMenu START
  :UninstallMenu
    cls
    Title Rainbow Six Siege UninstallMenu
    MODE 50,38
    echo [93m-----------------------NOTES----------------------[0m
    echo                  Uninstall Menu
    echo      Please select the correct download folder.
    echo [93m----------------------SELECT----------------------[0m
    Resources\cmdmenusel f8f0 "   Y1S0_Vanilla"    "   Y1S1_Black_Ice"    "   Y1S2_Dust_Line"    "   Y1S3_Skull_Rain"    "   Y1S3_SkullRain"    "   Y1S4_Red_Crow"    "   Y2S1_Velvet_Shell"    "   Y2S2_Health"      "   Y2S3_Blood_Orchid"    "   Y2S3_BloodOrchid"    "   Y2S4_White_Noise"    "   Y2S4_WhiteNoise"    "   Y3S1_Chimera"    "   Y3S2_Para_Bellum"    "   Y3S3_Grim_Sky"    "   Y3S3_MadHouse"    "   Y3S4_Wind_Bastion"    "   Y4S1_Burnt_Horizon"    "   Y4S1_RainbowIsMagic"    "   Y4S2_Phantom_Sight"    "   Y4S3_Ember_Rise"    "   Y4S3_DoktorsCurse"    "   Y4S4_Shifting_Tides"    "   Y5S1_Void_Edge"    "   Y5S1_GangDestruction"    "   Y5S2_Steel_Wave"    "   Y5S2_MUTE"    "   Y5S2_SteelWave"    "   Y5S3_Shadow_Legacy"    "   Y5S3_Sugar_Fright" "   Sugar_Fright" "   Y5S4_Neon_Dawn"   "   Back"

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
    set DeleteDir="R6Downloads\Y2S3_Blood_Orchid"
    goto SelectToCheck
    )
    if %ERRORLEVEL%==10 (
    set DeleteDir="R6Downloads\Y2S3_BloodOrchid"
    goto SelectToCheck
    )
    if %ERRORLEVEL%==11 (
    set DeleteDir="R6Downloads\Y2S4_White_Noise"
    goto SelectToCheck
    )
    if %ERRORLEVEL%==12 (
    set DeleteDir="R6Downloads\Y2S4_WhiteNoise"
    goto SelectToCheck
    )
    if %ERRORLEVEL%==13 (
    set DeleteDir="R6Downloads\Y3S1_Chimera"
    goto SelectToCheck
    )
    if %ERRORLEVEL%==14 (
    set DeleteDir="R6Downloads\Y3S2_Para_Bellum"
    goto SelectToCheck
    )
    if %ERRORLEVEL%==15 (
    set DeleteDir="R6Downloads\Y3S3_Grim_Sky"
    goto SelectToCheck
    )
    if %ERRORLEVEL%==16 (
    set DeleteDir="R6Downloads\Y3S3_MadHouse"
    goto SelectToCheck
    )
    if %ERRORLEVEL%==17 (
    set DeleteDir="R6Downloads\Y3S4_Wind_Bastion"
    goto SelectToCheck
    )
    if %ERRORLEVEL%==18 (
    set DeleteDir="R6Downloads\Y4S1_Burnt_Horizon"
    goto SelectToCheck
    )
    if %ERRORLEVEL%==19 (
    set DeleteDir="R6Downloads\Y4S1_RainbowIsMagic"
    goto SelectToCheck
    )
    if %ERRORLEVEL%==20 (
    set DeleteDir="R6Downloads\Y4S2_Phantom_Sight"
    goto SelectToCheck
    )
    if %ERRORLEVEL%==21 (
    set DeleteDir="R6Downloads\Y4S3_Ember_Rise"
    goto SelectToCheck
    )
    if %ERRORLEVEL%==22 (
    set DeleteDir="R6Downloads\Y4S3_DoktorsCurse"
    goto SelectToCheck
    )
    if %ERRORLEVEL%==23 (
    set DeleteDir="R6Downloads\Y4S4_Shifting_Tides"
    goto SelectToCheck
    )
    if %ERRORLEVEL%==24 (
    set DeleteDir="R6Downloads\Y5S1_Void_Edge"
    goto SelectToCheck
    )
    if %ERRORLEVEL%==25 (
    set DeleteDir="R6Downloads\Y5S1_GangDestruction"
    goto SelectToCheck
    )
    if %ERRORLEVEL%==26 (
    set DeleteDir="R6Downloads\Y5S2_Steel_Wave"
    goto SelectToCheck
    )
    if %ERRORLEVEL%==27 (
    set DeleteDir="R6Downloads\Y5S2_MUTE"
    goto SelectToCheck
    )
    if %ERRORLEVEL%==28 (
    set DeleteDir="R6Downloads\Y5S2_SteelWave"
    goto SelectToCheck
    )
    if %ERRORLEVEL%==29 (
    set DeleteDir="R6Downloads\Y5S3_Shadow_Legacy"
    goto SelectToCheck
    )
    if %ERRORLEVEL%==30 (
    set DeleteDir="R6Downloads\Y5S3_Sugar_Fright"
    goto SelectToCheck
    )
    if %ERRORLEVEL%==31 (
    set DeleteDir="R6Downloads\Sugar_Fright"
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
    MODE 60,10
    cls
    rd /s /q %DeleteDir% 2>nul || echo Error^^!
    if errorlevel 2 (
      echo Make sure you^'ve selected the correct download folder.
      pause
      goto Failed
      )
    if errorlevel 0 (
      echo Waiting to remove the folder...
      timeout /t 4 >nul 
      echo Folder deleted^^!
      set DeleteDir=
      pause
      goto DeleteDone
    )
  ::DeleteFolder END
::UNINSTALL END


::FULL STARTGAME START
  ::StartGame START
  :StartGame
    cls
    Title Rainbow Six Siege Game Starter
    MODE 50,38
    echo [93m-----------------------NOTES----------------------[0m
    echo                   Game Launcher
    echo    Please select the correct download folder.
    echo [93m----------------------SELECT----------------------[0m
    Resources\cmdmenusel f8f0 "   Y1S0_Vanilla"    "   Y1S1_Black_Ice"    "   Y1S2_Dust_Line"    "   Y1S3_Skull_Rain"    "   Y1S3_SkullRain"    "   Y1S4_Red_Crow"    "   Y2S1_Velvet_Shell"    "   Y2S2_Health"     "   Y2S3_Blood_Orchid"    "   Y2S3_BloodOrchid"    "   Y2S4_White_Noise"    "   Y2S4_WhiteNoise"    "   Y3S1_Chimera"    "   Y3S2_Para_Bellum"    "   Y3S3_Grim_Sky"    "   Y3S3_MadHouse"    "   Y3S4_Wind_Bastion"    "   Y4S1_Burnt_Horizon"    "   Y4S1_RainbowIsMagic"    "   Y4S2_Phantom_Sight"    "   Y4S3_Ember_Rise"    "   Y4S3_DoktorsCurse"    "   Y4S4_Shifting_Tides"    "   Y5S1_Void_Edge"    "   Y5S1_GangDestruction"    "   Y5S2_Steel_Wave"    "   Y5S2_MUTE"    "   Y5S2_SteelWave"    "   Y5S3_Shadow_Legacy"    "   Y5S3_Sugar_Fright" "   Sugar_Fright"   "   Y5S4_Neon_Dawn"   "   Back"

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
    set StartDir=R6Downloads\Y2S3_Blood_Orchid
    goto SelectToCheck
    )
    if %ERRORLEVEL%==10 (
    set StartDir=R6Downloads\Y2S3_BloodOrchid
    goto SelectToCheck
    )
    if %ERRORLEVEL%==11 (
    set StartDir=R6Downloads\Y2S4_White_Noise
    goto SelectToCheck
    )
    if %ERRORLEVEL%==12 (
    set StartDir=R6Downloads\Y2S4_WhiteNoise
    goto SelectToCheck
    )
    if %ERRORLEVEL%==13 (
    set StartDir=R6Downloads\Y3S1_Chimera
    goto SelectToCheck
    )
    if %ERRORLEVEL%==14 (
    set StartDir=R6Downloads\Y3S2_Para_Bellum
    goto SelectToCheck
    )
    if %ERRORLEVEL%==15 (
    set StartDir=R6Downloads\Y3S3_Grim_Sky
    goto SelectToCheck
    )
    if %ERRORLEVEL%==16 (
    set StartDir=R6Downloads\Y3S3_MadHouse
    goto SelectToCheck
    )
    if %ERRORLEVEL%==17 (
    set StartDir=R6Downloads\Y3S4_Wind_Bastion
    goto SelectToCheck
    )
    if %ERRORLEVEL%==18 (
    set StartDir=R6Downloads\Y4S1_Burnt_Horizon
    goto SelectToCheck
    )
    if %ERRORLEVEL%==19 (
    set StartDir=R6Downloads\Y4S1_RainbowIsMagic
    goto SelectToCheck
    )
    if %ERRORLEVEL%==20 (
    set StartDir=R6Downloads\Y4S2_Phantom_Sight
    goto SelectToCheck
    )
    if %ERRORLEVEL%==21 (
    set StartDir=R6Downloads\Y4S3_Ember_Rise
    goto SelectToCheck
    )
    if %ERRORLEVEL%==22 (
    set StartDir=R6Downloads\Y4S3_DoktorsCurse
    goto SelectToCheck
    )
    if %ERRORLEVEL%==23 (
    set StartDir=R6Downloads\Y4S4_Shifting_Tides
    goto SelectToCheck
    )
    if %ERRORLEVEL%==24 (
    set StartDir=R6Downloads\Y5S1_Void_Edge
    goto SelectToCheck
    )
    if %ERRORLEVEL%==25 (
    set StartDir=R6Downloads\Y5S1_GangDestruction
    goto SelectToCheck
    )
    if %ERRORLEVEL%==26 (
    set StartDir=R6Downloads\Y5S2_Steel_Wave
    goto SelectToCheck
    )
    if %ERRORLEVEL%==27 (
    set StartDir=R6Downloads\Y5S2_MUTE
    goto SelectToCheck
    )
    if %ERRORLEVEL%==28 (
    set StartDir=R6Downloads\Y5S2_SteelWave
    goto SelectToCheck
    )
    if %ERRORLEVEL%==29 (
    set StartDir=R6Downloads\Y5S3_Shadow_Legacy
    goto SelectToCheck
    )
    if %ERRORLEVEL%==30 (
    set StartDir=R6Downloads\Y5S3_Sugar_Fright
    goto SelectToCheck
    )
    if %ERRORLEVEL%==31 (
    set StartDir=R6Downloads\Sugar_Fright
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
      )
      goto nothaveR6G

    :nothaveR6G
    if exist "%StartDir%\RainbowSix.exe" (
      set startexe=%StartDir%\RainbowSix.exe
      set Position=GameStarter
      set LOGINFO=RainbowSix.exe Founded
      set LogNumber=1
      goto logtolog
      )
      goto StartGame
  ::BE Disable/ RSG Skip END

  ::StartChoose START
  :StartChoose
    cls
    MODE 50,10
    echo [93m-----------------------NOTES----------------------[0m
    echo                  DirectX or Vulkan?
    echo            DirectX is the default renderer.
    echo      Use DirectX if you don't know what this is.
    echo         Some tools will only support DirectX.
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
    MODE 60,10
    echo Starting : %startexe%
    start %startexe% /belaunch
    pause
    set StartDir=
    set Position=GameMenu
    set LOGINFO=%startexe% Started
    set LogNumber=1
    goto logtolog
  ::GameStarter END
::FULL STARTGAME END


::LANG START
  ::ExtraMenu START
  :ExtraMenu
    cls
    Title Rainbow Six Siege Extra Menu
    MODE 50,10
    echo [93m-----------------------NOTES----------------------[0m
    echo                 Extra Language Menu
    echo              Extra Languages are added^^!
    echo [93m-----------------------SELECT---------------------[0m
    Resources\cmdmenusel f8f0 "    Extra Version" "    Extra Event" "    Extra Release" "    Extra Shey" "    Back"

    if %ERRORLEVEL%==1 (
    set Position=ExtraVersion
    goto GoingTo
    )
    if %ERRORLEVEL%==2 (
    set Position=ExtraEvent
    goto GoingTo
    )
    if %ERRORLEVEL%==3 (
    set Position=ExtraRelease
    goto GoingTo
    )
    if %ERRORLEVEL%==4 (
    set Position=SheyLang
    goto GoingTo
    )
    if %ERRORLEVEL% == 5 (
      if %LastSelector% == MainMenu (
        set Position=MainMenu
        goto BackTo
      ) else (
        set Position=InstallMenu
        goto BackTo
      )
    )
    goto ExtraMenu
  ::ExtraMenu END

  ::ExtraVersion START
  :ExtraVersion
    cls
    Title Rainbow Six Siege Extra Version
    MODE 50,27
    echo [93m-----------------------NOTES----------------------[0m
    echo             Extra Version Language Menu
    echo       Manifests from Zer0Bytes' Manifest tool.
    echo [93m----------------------SELECT----------------------[0m
    Resources\cmdmenusel f8f0 "   Vanilla" "   Black Ice" "   Dust Line" "   Skull Rain" "   Red Crow" "   Velvet Shell" "   Health" "   Blood Orchid" "   White Noise" "   Chimera" "   Para Bellum" "   Grim Sky" "   Wind Bastion" "   Burnt Horizon" "   Phantom Sight" "   Ember Rise" "   Shifting Tides" "   Void Edge" "   Steel Wave [Mute]" "   Steel Wave [Omega/Mute]" "   Sugar Fright / Telly [R6Global]" "   Back"

    if %ERRORLEVEL%==1 (
    goto VanillaLang
    )
    if %ERRORLEVEL%==2 (
    goto BlackIceLang
    )
    if %ERRORLEVEL%==3 (
    goto DustLineLang
    )
    if %ERRORLEVEL%==4 (
    :SkullRainZero
    goto NoLang
    )
    if %ERRORLEVEL%==5 (
    goto RedCrowLang
    )
    if %ERRORLEVEL%==6 (
    goto VelvetShellLang
    )
    if %ERRORLEVEL%==7 (
    :HealthLang
    set Position=DownloadLang
    set ExtraName=Health
    set ExtraPath=R6Downloads\Y2S2_Health
    set FrenchManifest=6096643115970852289
    set ItalianManifest=8822593964618949966
    set GermanManifest=7995072742170754868
    set SpanishManifest=3745420316643316529
    set BrasilianManifest=9177769359376990903
    set PolishManifest=
    set DutchManifest=
    set CzechManifest=
    set KoreanManifest=
    set TChineseManifest=
    set SChineseManifest=
    set JapaneseManifest=8573459241975382853
    set RussianManifest=
    goto GoingTo
    )
    if %ERRORLEVEL%==8 (
    :BloodOrchidZeroLang
    set Position=DownloadLang
    set ExtraName=Blood Orchid [Zer0]
    set ExtraPath=R6Downloads\Y2S3_BloodOrchid
    set FrenchManifest=838721240709370593
    set ItalianManifest=517536193576958217
    set GermanManifest=633861069103225490
    set SpanishManifest=5021367039292610416
    set BrasilianManifest=8777677445681226676
    set PolishManifest=
    set DutchManifest=
    set CzechManifest=
    set KoreanManifest=
    set TChineseManifest=
    set SChineseManifest=
    set JapaneseManifest=1264611426492480643
    set RussianManifest=
    goto GoingTo
    )
    if %ERRORLEVEL%==9 (
    :WhiteNoiseZeroLang
    set Position=DownloadLang
    set ExtraName=White Noise [Zer0]
    set ExtraPath=R6Downloads\Y2S4_WhiteNoise
    set FrenchManifest=2308260537166778249
    set ItalianManifest=3617045189518866236
    set GermanManifest=135229608888957003
    set SpanishManifest=1059330510186835259
    set BrasilianManifest=1542751081173628894
    set PolishManifest=
    set DutchManifest=
    set CzechManifest=
    set KoreanManifest=
    set TChineseManifest=
    set SChineseManifest=
    set JapaneseManifest=4082361510758614272
    set RussianManifest=
    goto GoingTo
    )
    if %ERRORLEVEL%==10 (
    goto ChimeraLang
    )
    if %ERRORLEVEL%==11 (
    goto ParaBellumLang
    )
    if %ERRORLEVEL%==12 (
    :MadHouseLang
    set Position=DownloadLang
    set ExtraName=Mad House
    set ExtraPath=R6Downloads\Y3S3_MadHouse
    set FrenchManifest=2691692271374235298
    set ItalianManifest=8974449918057622636
    set GermanManifest=1633663749570094592
    set SpanishManifest=3038736562055087492
    set BrasilianManifest=5405729512726659651
    set PolishManifest=
    set DutchManifest=
    set CzechManifest=
    set KoreanManifest=
    set TChineseManifest=
    set SChineseManifest=
    set JapaneseManifest=7218304239314966517
    set RussianManifest=9201863984356390492
    goto GoingTo
    )
    if %ERRORLEVEL%==13 (
    goto WindBastionLang
    )
    if %ERRORLEVEL%==14 (
    :RainbowIsMagicLang
    goto NoLang
    )
    if %ERRORLEVEL%==15 (
    goto PhantomSightLang
    )
    if %ERRORLEVEL%==16 (
    :DoktorsCurseLang
    set Position=DownloadLang
    set ExtraName=Doktors Curse
    set ExtraPath=R6Downloads\Y4S3_DoktorsCurse
    set FrenchManifest=
    set ItalianManifest=
    set GermanManifest=
    set SpanishManifest=3299372491475509511
    set BrasilianManifest=
    set PolishManifest=
    set DutchManifest=
    set CzechManifest=
    set KoreanManifest=
    set TChineseManifest=
    set SChineseManifest=
    set JapaneseManifest=
    set RussianManifest=
    goto GoingTo
    )
    if %ERRORLEVEL%==17 (
    goto ShiftingTidesLang
    )
    if %ERRORLEVEL%==18 (
    :GangDestructionLang
    goto NoLang
    )
    if %ERRORLEVEL%==19 (
    :MUTEProtocolLang
    set Position=DownloadLang
    set ExtraName=MUTE Protocol
    set ExtraPath=R6Downloads\Y5S2_MUTE
    set FrenchManifest=
    set ItalianManifest=6930464470779050499
    set GermanManifest=3439024125519410144
    set SpanishManifest=5706819750425064069
    set BrasilianManifest=3586507048095856048
    set PolishManifest=
    set DutchManifest=
    set CzechManifest=
    set KoreanManifest=
    set TChineseManifest=
    set SChineseManifest=
    set JapaneseManifest=6080135122250419494
    set RussianManifest=29489895101354465
    goto GoingTo
    )
    if %ERRORLEVEL%==20 (
    :OmegaSteelWaveLang
    goto NoLang
    )
    if %ERRORLEVEL%==21 (
    :Sugar_FrightLang
    set Position=DownloadLang
    set ExtraName=Sugar Fright / Telly [R6Global]
    set ExtraPath=R6Downloads\Sugar_Fright
    set FrenchManifest=462120955143931177
    set ItalianManifest=8128095277804169071
    set GermanManifest=6910153120452858878
    set SpanishManifest=595794504538570572
    set BrasilianManifest=2801742354810447781
    set PolishManifest=
    set DutchManifest=
    set CzechManifest=
    set KoreanManifest=
    set TChineseManifest=
    set SChineseManifest=
    set JapaneseManifest=1916070313897860188
    set RussianManifest=1005723170932831735
    goto GoingTo
    )
    if %ERRORLEVEL% == 22 (
    set Position=ExtraMenu
    goto BackTo
    )
    goto ExtraVersion
  ::ExtraVersion END

  ::ExtraEvent START
  :ExtraEvent
    cls
    Title Rainbow Six Siege Extra Event
    MODE 50,20
    echo [93m-----------------------NOTES----------------------[0m
    echo              Extra Event Language Menu
    echo          Outbreak will download Chimera.
    echo      Road To S.I. will download Shifting Tides.
    echo          Showdown will download Phantom Sight.
    echo [93m-----------------------SELECT---------------------[0m
    Resources\cmdmenusel f8f0 "   Outbreak" "   Mad House" "   Rainbow is Magic" "   Showdown" "   Doctors Curse" "   Road To S.I. 2020" "   Gang Destruction / Golden Gun" "   M.U.T.E Protocol (Not support Omega)" "   M.U.T.E Protocol (Supported Omega)" "   Sugar Fright / Telly" "   Sugar Fright / Telly [R6Global]" "   Back"
     
    if %ERRORLEVEL%==1 (
    goto ChimeraLang
    )
    if %ERRORLEVEL%==2 (
    goto MadHouseLang
    )
    if %ERRORLEVEL%==3 (
    goto RainbowIsMagicang
    )
    if %ERRORLEVEL%==4 (
    goto PhantomSightLang
    )
    if %ERRORLEVEL%==5 (
    goto DoktorsCurseLang
    )
    if %ERRORLEVEL%==6 (
    goto ShiftingTidesLang
    )
    if %ERRORLEVEL%==7 (
    goto GangDestructionLang
    )
    if %ERRORLEVEL%==8 (
    goto MUTEProtocolLang
    )
    if %ERRORLEVEL%==9 (
    goto OmegaSteelWaveLang
    )
    if %ERRORLEVEL%==10 (
    :SugarFrightLang
    set Position=DownloadLang
    set ExtraName=Sugar Fright / Telly
    set ExtraPath=R6Downloads\Y5S3_Sugar_Fright
    set FrenchManifest=2497671185450045247
    set ItalianManifest=1016302273030784247
    set GermanManifest=2219450000740333965
    set SpanishManifest=6129893474695042229
    set BrasilianManifest=7009669290553062347
    set PolishManifest=
    set DutchManifest=
    set CzechManifest=
    set KoreanManifest=
    set TChineseManifest=
    set SChineseManifest=
    set JapaneseManifest=7140373705378561321
    set RussianManifest=1758819456862451579
    goto GoingTo
    )
    if %ERRORLEVEL%==11 (
    goto Sugar_FrightLang
    )
    if %ERRORLEVEL%==12 (
    set Position=ExtraMenu
    goto BackTo
    )
    goto ExtraEvent
  ::ExtraEvent END

  ::ExtraRelease START
  :ExtraRelease
    cls
    Title Rainbow Six Siege Extra Release
    MODE 50,28
    echo [93m-----------------------NOTES----------------------[0m
    echo              Extra Release Language Menu
    echo       Only new, released version of game build.
    echo [93m-----------------------SELECT---------------------[0m
    Resources\cmdmenusel f8f0 "  Vanilla" "  Black Ice" "  Dust Line" "  Skull Rain" "  Red Crow" "  Velvet Shell" "  Health" "  Blood Orchid" "  White Noise" "  Chimera" "  Para Bellum" "  Grim Sky" "  Wind Bastion" "  Burnt Horizon" "  Phantom Sight" "  Ember Rise" "  Shifting Tides" "  Void Edge" "  Steel Wave" "  Shadow Legacy" "  Neon Dawn"  "  Back"
    
    if %ERRORLEVEL%==1 (
    :VanillaLang
    set Position=DownloadLang
    set ExtraName=Vanilla
    set ExtraPath=R6Downloads\Y1S0_Vanilla
    set FrenchManifest=940838089858119714
    set ItalianManifest=7179158265062294015
    set GermanManifest=3953006809848583127
    set SpanishManifest=6248979332984503061
    set BrasilianManifest=4246528818872796970
    set PolishManifest=3650448467998593870
    set DutchManifest=434053950562761763
    set CzechManifest=961787742874674106
    set KoreanManifest=4666462401429503167
    set TChineseManifest=8123484057310613369
    set SChineseManifest=7408437752633543455
    set JapaneseManifest=3426628477659109421
    set RussianManifest=4326401341058506434
    goto GoingTo
    )
    if %ERRORLEVEL%==2 (
    :BlackIceLang
    set Position=DownloadLang
    set ExtraName=Black Ice
    set ExtraPath=R6Downloads\Y1S1_Black_Ice
    set FrenchManifest=3933270230638281254
    set ItalianManifest=5760263381471720373
    set GermanManifest=7470955591961528063
    set SpanishManifest=6534545487175120142
    set BrasilianManifest=5712713603408405370
    set PolishManifest=611380037218554981
    set DutchManifest=2252756710796870124
    set CzechManifest=9083464997167398804
    set KoreanManifest=1679233699688952842
    set TChineseManifest=6415534268030477043
    set SChineseManifest=695733873875406938
    set JapaneseManifest=7819798899236214261
    set RussianManifest=7163789544030656935
    goto GoingTo
    )
    if %ERRORLEVEL%==3 (
    :DustLineLang
    set Position=DownloadLang
    set ExtraName=Dust Line
    set ExtraPath=R6Downloads\Y1S2_Dust_Line
    set FrenchManifest=8417670786870682154
    set ItalianManifest=2551476087873566284
    set GermanManifest=781358903497748263
    set SpanishManifest=8080893511664284255
    set BrasilianManifest=7093312220135270425
    set PolishManifest=3858352830712224800
    set DutchManifest=792523120148938529
    set CzechManifest=5042288075851140032
    set KoreanManifest=3857270863114730703
    set TChineseManifest=1924001092871695610
    set SChineseManifest=336078500685842996
    set JapaneseManifest=7164006373234658729
    set RussianManifest=4405345682991436059
    goto GoingTo
    )
    if %ERRORLEVEL%==4 (
    :SkullRainLang
    set Position=DownloadLang
    set ExtraName=Skull Rain
    set ExtraPath=R6Downloads\Y1S3_Skull_Rain
    set FrenchManifest=5132022816747475711
    set ItalianManifest=1819965373025810009
    set GermanManifest=1926652807113950777
    set SpanishManifest=3102063947541599011
    set BrasilianManifest=1002387473375422601
    set PolishManifest=2324023684915670753
    set DutchManifest=6519643449965700176
    set CzechManifest=2274850673348857246
    set KoreanManifest=3010562235525323962
    set TChineseManifest=4953478873615251033
    set SChineseManifest=6056122284734366189
    set JapaneseManifest=4940468394032132183
    set RussianManifest=792795160700208918
    goto GoingTo
    )
    if %ERRORLEVEL%==5 (
    :RedCrowLang
    set Position=DownloadLang
    set ExtraName=Red Crow
    set ExtraPath=R6Downloads\Y1S4_Red_Crow
    set FrenchManifest=6096643115970852289
    set ItalianManifest=8822593964618949966
    set GermanManifest=7995072742170754868
    set SpanishManifest=3745420316643316529
    set BrasilianManifest=9177769359376990903
    set PolishManifest=
    set DutchManifest=
    set CzechManifest=
    set KoreanManifest=
    set TChineseManifest=
    set SChineseManifest=
    set JapaneseManifest=8573459241975382853
    set RussianManifest=
    goto GoingTo
    )
    if %ERRORLEVEL%==6 (
    :VelvetShellLang
    set Position=DownloadLang
    set ExtraName=Velvet Shell
    set ExtraPath=R6Downloads\Y2S1_Velvet_Shell
    set FrenchManifest=5858637819174796390
    set ItalianManifest=1442016899353884599
    set GermanManifest=7391813408396935946
    set SpanishManifest=4034802727985013756
    set BrasilianManifest=8373797984073491957
    set PolishManifest=
    set DutchManifest=
    set CzechManifest=
    set KoreanManifest=
    set TChineseManifest=
    set SChineseManifest=
    set JapaneseManifest=4595160401957962156
    set RussianManifest=
    goto GoingTo
    )
    if %ERRORLEVEL%==7 (
    goto HealthLang
    )
    if %ERRORLEVEL%==8 (
    :BloodOrchidLang
    set Position=DownloadLang
    set ExtraName=Blood Orchid
    set ExtraPath=R6Downloads\Y2S4_Blood_Orhid
    set FrenchManifest=790907662127860380
    set ItalianManifest=3928776659583035772
    set GermanManifest=7173152983008794231
    set SpanishManifest=7768315116657553428
    set BrasilianManifest=4018202152273389175
    set PolishManifest=
    set DutchManifest=
    set CzechManifest=
    set KoreanManifest=
    set TChineseManifest=
    set SChineseManifest=
    set JapaneseManifest=1573647791032056620
    set RussianManifest=
    goto GoingTo
    )
    if %ERRORLEVEL%==9 (
    :WhiteNoiseLang
    set Position=DownloadLang
    set ExtraName=White Noise
    set ExtraPath=R6Downloads\Y2S4_White_Noise
    set FrenchManifest=2934184792636281942
    set ItalianManifest=6120111820088733265
    set GermanManifest=1122657510721658234
    set SpanishManifest=7877024295509467816
    set BrasilianManifest=7662200840621314199
    set PolishManifest=
    set DutchManifest=
    set CzechManifest=
    set KoreanManifest=
    set TChineseManifest=
    set SChineseManifest=
    set JapaneseManifest=4323914207757706720
    set RussianManifest=
    goto GoingTo
    )
    if %ERRORLEVEL%==10 (
    :ChimeraLang
    set Position=DownloadLang
    set ExtraName=Chimera
    set ExtraPath=R6Downloads\Y3S1_Chimera
    set FrenchManifest=6830763708591031513
    set ItalianManifest=8951270584274959688
    set GermanManifest=365667853833643908
    set SpanishManifest=723936785330189072
    set BrasilianManifest=4967060442376701942
    set PolishManifest=
    set DutchManifest=
    set CzechManifest=
    set KoreanManifest=
    set TChineseManifest=
    set SChineseManifest=
    set JapaneseManifest=8184994692095456862
    set RussianManifest=5994322749665877802
    goto GoingTo
    )
    if %ERRORLEVEL%==11 (
    :ParaBellumLang
    set Position=DownloadLang
    set ExtraName=Para Bellum
    set ExtraPath=R6Downloads\Y3S2_Para_Bellum
    set FrenchManifest=2228609364372112585
    set ItalianManifest=3765579578277178198
    set GermanManifest=436165049364805671
    set SpanishManifest=3396331896624899011
    set BrasilianManifest=7222426493426609376
    set PolishManifest=
    set DutchManifest=
    set CzechManifest=
    set KoreanManifest=
    set TChineseManifest=
    set SChineseManifest=
    set JapaneseManifest=5702757960843346114
    set RussianManifest=1607809513640548526
    goto GoingTo
    )
    if %ERRORLEVEL%==12 (
    :GrimSkyLang
    set Position=DownloadLang
    set ExtraName=Grim Sky
    set ExtraPath=R6Downloads\Y3S3_Grim_Sky
    set FrenchManifest=3063945558350557421
    set ItalianManifest=8817435015508321947
    set GermanManifest=6254711869946987864
    set SpanishManifest=2769168610408745300
    set BrasilianManifest=1079437953122108725
    set PolishManifest=
    set DutchManifest=
    set CzechManifest=
    set KoreanManifest=
    set TChineseManifest=
    set SChineseManifest=
    set JapaneseManifest=971478325336602905
    set RussianManifest=3013637849914826120
    goto GoingTo
    )
    if %ERRORLEVEL%==13 (
    :WindBastionLang
    set Position=DownloadLang
    set ExtraName=Wind Bastion
    set ExtraPath=R6Downloads\Y3S4_Wind_Bastion
    set FrenchManifest=700171152841929114
    set ItalianManifest=6317337128494587862
    set GermanManifest=6357970357791494519
    set SpanishManifest=1310832078295252288
    set BrasilianManifest=6212948834557799675
    set PolishManifest=
    set DutchManifest=
    set CzechManifest=
    set KoreanManifest=
    set TChineseManifest=
    set SChineseManifest=
    set JapaneseManifest=8026527283762710847
    set RussianManifest=8306800552570152557
    goto GoingTo
    )
    if %ERRORLEVEL%==14 (
    :BurntHorizonLang
    set Position=DownloadLang
    set ExtraName=Burnt Horizon
    set ExtraPath=R6Downloads\Y4S1_Burnt_Horizon
    set FrenchManifest=2489165098014835664
    set ItalianManifest=5912470135426316642
    set GermanManifest=6166102473910342218
    set SpanishManifest=8980928302668128431
    set BrasilianManifest=5742909617569886590
    set PolishManifest=
    set DutchManifest=
    set CzechManifest=
    set KoreanManifest=
    set TChineseManifest=
    set SChineseManifest=
    set JapaneseManifest=6205462284383635854
    set RussianManifest=5305534200661405563
    goto GoingTo
    )
    if %ERRORLEVEL%==15 (
    :PhantomSightLang
    set Position=DownloadLang
    set ExtraName=Phantom Sight
    set ExtraPath=R6Downloads\Y4S2_Phantom_Sight
    set FrenchManifest=8209966773310799535
    set ItalianManifest=5551310338808720316
    set GermanManifest=2945239480726569964
    set SpanishManifest=3119251800260595817
    set BrasilianManifest=2060894578496472402
    set PolishManifest=
    set DutchManifest=
    set CzechManifest=
    set KoreanManifest=
    set TChineseManifest=
    set SChineseManifest=
    set JapaneseManifest=735237222551525964
    set RussianManifest=8063779007427415388
    goto GoingTo
    )
    if %ERRORLEVEL%==16 (
    :EmberRiseLang
    set Position=DownloadLang
    set ExtraName=Ember Rise
    set ExtraPath=R6Downloads\Y4S3_Ember_Rise
    set FrenchManifest=9167311800727871226
    set ItalianManifest=9032788833180559255
    set GermanManifest=5892684040914151033
    set SpanishManifest=4178602548762056641
    set BrasilianManifest=8187109316671389619
    set PolishManifest=
    set DutchManifest=
    set CzechManifest=
    set KoreanManifest=
    set TChineseManifest=
    set SChineseManifest=
    set JapaneseManifest=8453132699861289149
    set RussianManifest=4195459193643803058
    goto GoingTo
    )
    if %ERRORLEVEL%==17 (
    :ShiftingTidesLang
    set Position=DownloadLang
    set ExtraName=Shifting Tides
    set ExtraPath=R6Downloads\Y4S4Shifting_Tides
    set FrenchManifest=982226827055842157
    set ItalianManifest=7669952636769439421
    set GermanManifest=1771833119782386213
    set SpanishManifest=5607986007728468442
    set BrasilianManifest=3980031497374187833
    set PolishManifest=
    set DutchManifest=
    set CzechManifest=
    set KoreanManifest=
    set TChineseManifest=
    set SChineseManifest=
    set JapaneseManifest=4121849146546499241
    set RussianManifest=2337212093593824035
    goto GoingTo
    )
    if %ERRORLEVEL%==18 (
    :VoidEdgeLang
    set Position=DownloadLang
    set ExtraName=Void Edge
    set ExtraPath=R6Downloads\Y5S1_Void_Edge
    set FrenchManifest=6351511531186309516
    set ItalianManifest=2083562978649529043
    set GermanManifest=4220186838055347645
    set SpanishManifest=8280780297583800068
    set BrasilianManifest=1408940456585952484
    set PolishManifest=
    set DutchManifest=
    set CzechManifest=
    set KoreanManifest=
    set TChineseManifest=
    set SChineseManifest=
    set JapaneseManifest=6728091120574045367
    set RussianManifest=3817096039931934373
    goto GoingTo
    )
    if %ERRORLEVEL%==19 (
    :SteelWaveLang
    set Position=DownloadLang
    set ExtraName=Steel Wave
    set ExtraPath=R6Downloads\Y5S2_Steel_Wave
    set FrenchManifest=379201990182673961
    set ItalianManifest=7015749936618767871
    set GermanManifest=9103781936104145156
    set SpanishManifest=3323378213398656976
    set BrasilianManifest=3124010063296699270
    set PolishManifest=
    set DutchManifest=
    set CzechManifest=
    set KoreanManifest=
    set TChineseManifest=
    set SChineseManifest=
    set JapaneseManifest=5460615762069731497
    set RussianManifest=3790966697198053253
    goto GoingTo
    )
    if %ERRORLEVEL%==20 (
    :ShadowLegacyLang
    set Position=DownloadLang
    set ExtraName=Shadow Legacy
    set ExtraPath=R6Downloads\Y5S3_Shadow_Legacy
    set FrenchManifest=490063692268635993
    set ItalianManifest=8865509294556462405
    set GermanManifest=615915835199657008
    set SpanishManifest=2485600059396261361
    set BrasilianManifest=6424468667015085021
    set PolishManifest=
    set DutchManifest=
    set CzechManifest=
    set KoreanManifest=
    set TChineseManifest=
    set SChineseManifest=
    set JapaneseManifest=5904431813628700863
    set RussianManifest=5914186776656034602
    goto GoingTo
    )
    if %ERRORLEVEL%==21 (
    :NeonDawnLang
    set Position=DownloadLang
    set ExtraName=Neon Dawn
    set ExtraPath=R6Downloads\Y5S4_Neon_Dawn
    set FrenchManifest=6330535362940694984
    set ItalianManifest=5619411246287036654
    set GermanManifest=4632151886610949289
    set SpanishManifest=2656856004069997335
    set BrasilianManifest=1759088489247336476
    set PolishManifest=
    set DutchManifest=
    set CzechManifest=
    set KoreanManifest=
    set TChineseManifest=
    set SChineseManifest=
    set JapaneseManifest=7065992309208248805
    set RussianManifest=3097797074643326862
    goto GoingTo
    )
    if %ERRORLEVEL% == 22 (
    set Position=ExtraMenu
    goto BackTo
    )
    goto Extra
  ::ExtraRelease END

  ::SheyLang START
  :SheyLang
    cls
    Title Rainbow Six Siege Shey Downloader
    MODE 50,8
    echo [93m-----------------------NOTES----------------------[0m
    echo                   Shey Downloader
    echo        Only shey searched build^^! Check notes^^!
    echo [93m----------------------SELECT----------------------[0m
    Resources\cmdmenusel f8f0 "   Y2S3_BloodOrchid2" "   Y5S1_VoidEdge" "   Back"

    if %ERRORLEVEL%==1 (
    :BloodOrchidSheyLang
    set Position=DownloadLang
    set ExtraName=Blood Orchid [Shey]
    set ExtraPath=R6Downloads\Y2S3_BloodOrchid2
    set FrenchManifest=790907662127860380
    set ItalianManifest=3928776659583035772
    set GermanManifest=7173152983008794231
    set SpanishManifest=7768315116657553428
    set BrasilianManifest=4018202152273389175
    set PolishManifest=
    set DutchManifest=
    set CzechManifest=
    set KoreanManifest=
    set TChineseManifest=
    set SChineseManifest=
    set JapaneseManifest=1573647791032056620
    set RussianManifest=
    goto GoingTo
    )
    if %ERRORLEVEL%==2 (
    :VoidEdgeSheyLang
    set Position=DownloadLang
    set ExtraName=Void Edge [Shey]
    set ExtraPath=R6Downloads\Y5S1_VoidEdge
    set FrenchManifest=6351511531186309516
    set ItalianManifest=2083562978649529043
    set GermanManifest=4220186838055347645
    set SpanishManifest=8280780297583800068
    set BrasilianManifest=1408940456585952484
    set PolishManifest=
    set DutchManifest=
    set CzechManifest=
    set KoreanManifest=
    set TChineseManifest=
    set SChineseManifest=
    set JapaneseManifest=6728091120574045367
    set RussianManifest=3817096039931934373
    goto GoingTo
    )
    if %ERRORLEVEL% == 3 (
    set Position=ExtraMenu
    goto BackTo
    )
    goto SheyLang
  ::SheyLang END


  ::DownloadLang START
  :DownloadLang
    cls
    Title Rainbow Six Siege %ExtraName% Lang Downloader
    MODE 50,20
    echo [93m-----------------------NOTES----------------------[0m
    echo           %ExtraName% Language Downloader
    echo      Some Languages may not have a manifest file.
    echo [93m-----------------------SELECT---------------------[0m
    Resources\cmdmenusel f8f0 "    French Lang" "    Italian Lang" "    German Lang" "    Spanish - Spain Lang" "    Portuguese - Brazil Lang" "    Polish Lang" "    Dutch Lang" "    Czech Lang" "    Korean Lang" "    Traditional Chinese Lang" "    Simplified Chinese Lang" "    Japanese Lang" "    Russian Lang" "    Back"

    if %ERRORLEVEL%==1 (
      if [%FrenchManifest%]==[] (
        goto NoLang
      )
    :=French
    MODE 100,40
    dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359553 -manifest %FrenchManifest% -username %username% -remember-password -dir "%ExtraPath%" -validate -max-servers 15 -max-downloads 10
    echo.
    echo Download complete!
    echo It's French Lang on %ExtraName%
    pause
    cls
    set Downloaded="French Lang on %ExtraName%"
    goto DownloadCheck
    )
    if %ERRORLEVEL%==2 (
      if [%ItalianManifest%]==[] (
        goto NoLang
      )
    :=Italian
    MODE 100,40
    dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359554 -manifest %ItalianManifest% -username %username% -remember-password -dir "%ExtraPath%" -validate -max-servers 15 -max-downloads 10
    echo.
    echo Download complete!
    echo It's Italian Lang on %ExtraName%
    pause
    cls
    set Downloaded="Italian Lang on %ExtraName%"
    goto DownloadCheck
    )
    if %ERRORLEVEL%==3 (
      if [%GermanManifest%]==[] (
        goto NoLang
      )
    :=German
    MODE 100,40
    dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359555 -manifest %GermanManifest% -username %username% -remember-password -dir "%ExtraPath%" -validate -max-servers 15 -max-downloads 10
    echo.
    echo Download complete!
    echo It's German Lang on %ExtraName%
    pause
    cls
    set Downloaded="German Lang on %ExtraName%"
    goto DownloadCheck
    )
    if %ERRORLEVEL%==4 (
      if [%SpanishManifest%]==[] (
        goto NoLang
      )
    :=Spanish
    MODE 100,40
    dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359556 -manifest %SpanishManifest% -username %username% -remember-password -dir "%ExtraPath%" -validate -max-servers 15 -max-downloads 10
    echo.
    echo Download complete!
    echo It's Spanish Lang on %ExtraName%
    pause
    cls
    set Downloaded="Spanish Lang on %ExtraName%"
    goto DownloadCheck
    )
    if %ERRORLEVEL%==5 (
      if [%BrasilianManifest%]==[] (
        goto NoLang
      )
    :=Brasilian
    MODE 100,40
    dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359557 -manifest %BrasilianManifest% -username %username% -remember-password -dir "%ExtraPath%" -validate -max-servers 15 -max-downloads 10
    echo.
    echo Download complete!
    echo It's Brasilian Lang on %ExtraName%
    pause
    cls
    set Downloaded="Brasilian Lang on %ExtraName%"
    goto DownloadCheck
    )
    if %ERRORLEVEL%==6 (
      if [%PolishManifest%]==[] (
        goto NoLang
      )
    :=Polish
    MODE 100,40
    dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359558 -manifest %PolishManifest% -username %username% -remember-password -dir "%ExtraPath%" -validate -max-servers 15 -max-downloads 10
    echo.
    echo Download complete!
    echo It's Polish Lang on %ExtraName%
    pause
    cls
    set Downloaded="Polish Lang on %ExtraName%"
    goto DownloadCheck
    )
    if %ERRORLEVEL%==7 (
      if [%DutchManifest%]==[] (
        goto NoLang
      )
    :=Dutch
    MODE 100,40
    dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377230 -manifest %DutchManifest% -username %username% -remember-password -dir "%ExtraPath%" -validate -max-servers 15 -max-downloads 10
    echo.
    echo Download complete!
    echo It's Dutch Lang on %ExtraName%
    pause
    cls
    set Downloaded="Dutch Lang on %ExtraName%"
    goto DownloadCheck
    )
    if %ERRORLEVEL%==8 (
      if [%CzechManifest%]==[] (
        goto NoLang
      )
    :=Czech
    MODE 100,40
    dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377231 -manifest %CzechManifest% -username %username% -remember-password -dir "%ExtraPath%" -validate -max-servers 15 -max-downloads 10
    echo.
    echo Download complete!
    echo It's Czech Lang on %ExtraName%
    pause
    cls
    set Downloaded="Czech Lang on %ExtraName%"
    goto DownloadCheck
    )
    if %ERRORLEVEL%==9 (
      if [%KoreanManifest%]==[] (
        goto NoLang
      )
    :=Korean
    MODE 100,40
    dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377232 -manifest %KoreanManifest% -username %username% -remember-password -dir "%ExtraPath%" -validate -max-servers 15 -max-downloads 10
    echo.
    echo Download complete!
    echo It's Korean Lang on %ExtraName%
    pause
    cls
    set Downloaded="Korean Lang on %ExtraName%"
    goto DownloadCheck
    )
    if %ERRORLEVEL%==10 (
      if [%TChineseManifest%]==[] (
        goto NoLang
      )
    :=TChinese
    MODE 100,40
    dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377233 -manifest %TChineseManifest% -username %username% -remember-password -dir "%ExtraPath%" -validate -max-servers 15 -max-downloads 10
    echo.
    echo Download complete!
    echo It's TChinese Lang on %ExtraName%
    pause
    cls
    set Downloaded="TChinese Lang on %ExtraName%"
    goto DownloadCheck
    )
    if %ERRORLEVEL%==11 (
      if [%SChineseManifest%]==[] (
        goto NoLang
      )
      :=SChinese
      MODE 100,40
      dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377234 -manifest %SChineseManifest% -username %username% -remember-password -dir "%ExtraPath%" -validate -max-servers 15 -max-downloads 10
      echo.
      echo Download complete!
      echo It's SChinese Lang on %ExtraName%
      pause
      cls
      set Downloaded="SChinese Lang on %ExtraName%"
      goto DownloadCheck
    )
    if %ERRORLEVEL%==12 (
      if [%JapaneseManifest%]==[] (
        goto NoLang
      )
    :=Japanese
    MODE 100,40
    dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377235 -manifest %JapaneseManifest% -username %username% -remember-password -dir "%ExtraPath%" -validate -max-servers 15 -max-downloads 10
    echo.
    echo Download complete!
    echo It's Japanese Lang on %ExtraName%
    pause
    cls
    set Downloaded="Japanese Lang on %ExtraName%"
    goto DownloadCheck
    )
    if %ERRORLEVEL%==13 (
      if [%RussianManifest%]==[] (
        goto NoLang
      )
    :=Russian
    MODE 100,40
    dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377236 -manifest %RussianManifest% -username %username% -remember-password -dir "%ExtraPath%" -validate -max-servers 15 -max-downloads 10
    echo.
    echo Download complete!
    echo It's Russian Lang on %ExtraName%
    pause
    cls
    set Downloaded="Russian Lang on %ExtraName%"
    goto DownloadCheck
    )
    if %ERRORLEVEL%==14 (
    set Position=ExtraMenu
    goto BackTo
    )
    goto DowmloadLang
  ::DowmloadLang END

  ::NoLang START
  :NoLang
    cls
    Title Rainbow Six Siege No Language File
    MODE 50,8
    echo [93m-----------------------NOTES----------------------[0m
    echo          [31mNo Language for this operation[0m
    echo         Sorry, but there are no manifests for 
    echo            this language/this operation.
    echo [93m-----------------------SELECT---------------------[0m
    Resources\cmdmenusel f8f0 "   Back"

    if %ERRORLEVEL%==1 (
    set Position=ExtraMenu
    goto BackTo
    )
    goto NoLang
  ::NoLang END
::LANG END


::dxvcredistdownloader START
  :dxvcredistdownloader
    cls
    Title DirectX and VC Redist Downloader
    MODE 41,11
    echo [93m------------------NOTES------------------[0m
    echo     DirectX and VC Redist Downloader
    echo [93m------------------SELECT-----------------[0m
    Resources\cmdmenusel f8f0 "   DirectX" "   VC 2010 Redist" "   VC 2012 Redist" "   VC 2015 Redist"  "   VC 2017 Redist" "   Back"

    if %ERRORLEVEL% == 1 (
    MODE 100,40
    dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 228990 -manifest 1829726630299308803 -username %username% -remember-password -dir "R6Downloads\DirectX" -validate -max-servers 15 -max-downloads 10
    echo.
    echo Download complete^^!
    echo It's DirectX^^!
    pause
    cls
    set Downloaded="DirectX"
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
    set Downloaded="VC 2010 Redist"
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
    set Downloaded="VC 2012 Redist"
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
    set Downloaded="VC 2015 Redist"
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
    set Downloaded="VC 2017 Redist"
    goto DownloadCheck
    )
    if %ERRORLEVEL% == 6 (
    set Position=MainMenu
    goto BackTo
    )
    goto dxvcredistdownloader
::dxvcredistdownloader END


::ZeroFolderRenamer START
  :ZeroFolderRenamer
    set Position=MainMenu
    cls
    Title Zero Folder Renamer
    MODE 50,20
    echo Make sure to now download it twice^^!
    pause
    echo Waiting to fully rename the folders.
    ren "R6Downloads\Y1S1_BlackIce" "Y1S1_Black_Ice" 2>nul
    ren "R6Downloads\Y1S2_DustLine" "Y1S2_Dust_Line" 2>nul
    ren "R6Downloads\Y1S4_RedCrow" "Y1S4_Red_Crow" 2>nul
    ren "R6Downloads\Y2S1_VelvetShell" "Y2S1_Velvet_Shell" 2>nul
    ren "R6Downloads\Y2S2_Health_FixingAndRepairingTheGame" "Y2S2_Health" 2>nul
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


::CRACK THING START
  :CrackMenu
    cls
    Title Crack Menu
    MODE 50,20
    echo [93m-----------------------NOTES----------------------[0m
    echo       It change all files when you downloaded^^!
    echo    Sorry, but you only can replace all GameName
    echo              Do it on manually :^)
    echo [93m-----------------------SELECT---------------------[0m
    Resources\cmdmenusel f8f0 "   Name Change" "   GameName Change" "   Exit"

    if %ERRORLEVEL% == 1 (
    set Position=SetName
    goto GoingTo
    )
    if %ERRORLEVEL% == 2 (
    set Position=SetGame
    goto GoingTo
    )
    if %ERRORLEVEL% == 3 (
    set Position=MainMenu
    goto BackTo
    )
    goto CrackMenu

  ::SETGAME
  :SetGame
    cls
    Title Crack Menu GameSet 
    MODE 50,10
    set InputFile=Resources\Plazas\PLAZA_BO\CODEX_Default.ini
    set OutputFile=Resources\Plazas\PLAZA_BO\CODEX.ini
    set InputFile2=Resources\Plazas\PLAZA_NEW\CODEX_Default.ini
    set OutputFile2=Resources\Plazas\PLAZA_NEW\CODEX.ini
    set InputFile3=Resources\Plazas\LumaPlay\LumaPlayFiles\LumaPlay_Default.ini
    set OutputFile3=Resources\Plazas\LumaPlay\LumaPlayFiles\LumaPlay.ini
    set "_strFind=GameName=CHANGEGAMENAME"
    set /p _strInsert="Enter the GameName: "
    goto ReplacesAll


  ::SETNAME
  :SetName
    cls
    Title Crack Menu NameSet 
    MODE 50,10
    set InputFile=Resources\Plazas\PLAZA_BO\CODEX_Default.ini
    set OutputFile=Resources\Plazas\PLAZA_BO\CODEX.ini
    set InputFile2=Resources\Plazas\PLAZA_NEW\CODEX_Default.ini
    set OutputFile2=Resources\Plazas\PLAZA_NEW\CODEX.ini
    set InputFile3=Resources\Plazas\LumaPlay\LumaPlayFiles\LumaPlay_Default.ini
    set OutputFile3=Resources\Plazas\LumaPlay\LumaPlayFiles\LumaPlay.ini
    set "_strFind=UserName=CHANGEUSERNAME"
    set /p _strInsert="Enter your UserName: "
    goto ReplacesAll

  :ReplacesAll
    >"%OutputFile%" (
      for /f "usebackq delims=" %%A in ("%InputFile%") do (
        if "%%A" equ "%_strFind%" (echo UserName=%_strInsert%) else (echo %%A)
      )
    )
    >"%OutputFile2%" (
      for /f "usebackq delims=" %%A in ("%InputFile2%") do (
        if "%%A" equ "%_strFind%" (echo UserName=%_strInsert%) else (echo %%A)
      )
    )
    >"%OutputFile3%" (
      for /f "usebackq delims=" %%A in ("%InputFile3%") do (
        if "%%A" equ "%_strFind%" (echo UserName=%_strInsert%) else (echo %%A)
      )
    )
    goto FullDownloadCheck


  ::FULLCHECK
  :FullDownloadCheck
    ::Plaza_BO
    if exist "R6Downloads\Y1S0_Vanilla" (
      Robocopy Resources\Plazas\PLAZA_BO R6Downloads\Y1S0_Vanilla >nul
    )
    if exist "R6Downloads\Y1S1_Black_Ice" (
      Robocopy Resources\Plazas\PLAZA_BO R6Downloads\Y1S1_Black_Ice >nul
    ) 
    if exist "R6Downloads\Y1S2_Dust_Line" (
      Robocopy Resources\Plazas\PLAZA_BO R6Downloads\Y1S2_Dust_Line >nul
    ) 
    if exist "R6Downloads\Y1S3_Skull_Rain" (
      Robocopy Resources\Plazas\PLAZA_BO R6Downloads\Y1S3_Skull_Rain >nul
    )
    if exist "R6Downloads\Y1S3_SkullRain" (
      Robocopy Resources\Plazas\PLAZA_BO R6Downloads\Y1S3_SkullRain >nul
    )
    if exist "R6Downloads\Y1S4_Red_Crow" (
      Robocopy Resources\Plazas\PLAZA_BO R6Downloads\Y1S4_Red_Crow >nul
    )
    if exist "R6Downloads\Y2S1_Velvet_Shell" (
      Robocopy Resources\Plazas\PLAZA_BO R6Downloads\Y2S1_Velvet_Shell >nul
    )
    if exist "R6Downloads\Y2S2_Health" (
      Robocopy Resources\Plazas\PLAZA_BO R6Downloads\Y2S2_Health >nul
    )  
    if exist "R6Downloads\Y2S3_Blood_Orchid" (
      Robocopy Resources\Plazas\PLAZA_BO R6Downloads\Y2S3_Blood_Orchid >nul
    )
    if exist "R6Downloads\Y2S3_BloodOrchid" (
      Robocopy Resources\Plazas\PLAZA_BO R6Downloads\Y2S3_BloodOrchid >nul
    )
    if exist "R6Downloads\Y2S3_BloodOrchid2" (
      Robocopy Resources\Plazas\PLAZA_BO R6Downloads\Y2S3_BloodOrchid2 >nul
    )
    ::Plaza_NEW
    if exist "R6Downloads\Y2S4_White_Noise" (
      Robocopy Resources\Plazas\PLAZA_NEW R6Downloads\Y2S4_White_Noise >nul
    ) 
    if exist "R6Downloads\Y2S4_WhiteNoise" (
      Robocopy Resources\Plazas\PLAZA_NEW R6Downloads\Y2S4_WhiteNoise >nul
    )
    if exist "R6Downloads\Y3S1_Chimera" (
      Robocopy Resources\Plazas\PLAZA_NEW R6Downloads\Y3S1_Chimera >nul
    )
    if exist "R6Downloads\Y3S2_Para_Bellum" (
      Robocopy Resources\Plazas\PLAZA_NEW R6Downloads\Y3S2_Para_Bellum >nul
    )
    if exist "R6Downloads\Y3S3_Grim_Sky" (
      Robocopy Resources\Plazas\PLAZA_NEW R6Downloads\Y3S3_Grim_Sky >nul
    )
    if exist "R6Downloads\Y3S3_MadHouse" (
      Robocopy Resources\Plazas\PLAZA_NEW R6Downloads\Y3S3_MadHouse >nul
    )
    if exist "R6Downloads\Y3S4_Wind_Bastion" (
      Robocopy Resources\Plazas\PLAZA_NEW R6Downloads\Y3S4_Wind_Bastion >nul
    )
    if exist "R6Downloads\Y4S1_Burnt_Horizon" (
      Robocopy Resources\Plazas\PLAZA_NEW R6Downloads\Y4S1_Burnt_Horizon >nul
    )
    if exist "R6Downloads\Y4S1_RainbowIsMagic" (
      Robocopy Resources\Plazas\PLAZA_NEW R6Downloads\Y4S1_RainbowIsMagic >nul
    )
    if exist "R6Downloads\Y4S2_Phantom_Sight" (
      Robocopy Resources\Plazas\PLAZA_NEW R6Downloads\Y4S2_Phantom_Sight >nul
    )
    if exist "R6Downloads\Y4S3_Ember_Rise" (
      Robocopy Resources\Plazas\PLAZA_NEW R6Downloads\Y4S3_Ember_Rise >nul
    )
    if exist "R6Downloads\Y4S3_DoktorsCurse" (
      Robocopy Resources\Plazas\PLAZA_NEW R6Downloads\Y4S3_DoktorsCurse >nul
    ) 
    if exist "R6Downloads\Y4S4_Shifting_Tides" (
      Robocopy Resources\Plazas\PLAZA_NEW R6Downloads\Y4S4_Shifting_Tides >nul
    )
    if exist "R6Downloads\Y5S1_Void_Edge" (
      Robocopy Resources\Plazas\PLAZA_NEW R6Downloads\Y5S1_Void_Edge >nul
    )
    if exist "R6Downloads\Y5S1_GangDestruction" (
      Robocopy Resources\Plazas\PLAZA_NEW R6Downloads\Y5S1_GangDestruction >nul
    )
    if exist "R6Downloads\Y5S1_VoidEdge" (
      Robocopy Resources\Plazas\PLAZA_NEW R6Downloads\Y5S1_VoidEdge >nul
    )
    if exist "R6Downloads\Y5S2_Steel_Wave" (
      Robocopy Resources\Plazas\PLAZA_NEW R6Downloads\Y5S2_Steel_Wave >nul
    )
    if exist "R6Downloads\Y5S2_MUTE" (
      Robocopy Resources\Plazas\PLAZA_NEW R6Downloads\Y5S2_MUTE >nul
    )
    if exist "R6Downloads\Y5S2_SteelWave" (
      Robocopy Resources\Plazas\PLAZA_NEW R6Downloads\Y5S2_SteelWave >nul
    )
    ::Lumaplay
    if exist "R6Downloads\Y5S3_Shadow_Legacy" (
      Robocopy Resources\Plazas\Lumaplay R6Downloads\Y5S3_Shadow_Legacy >nul
    )
    if exist "R6Downloads\Y5S3_Sugar_Fright" (
      Robocopy Resources\Plazas\Lumaplay R6Downloads\Y5S3_Sugar_Fright >nul
    )
    if exist "R6Downloads\Sugar_Fright" (
      Robocopy Resources\Plazas\Lumaplay R6Downloads\Sugar_Fright >nul
    )
    echo %TIME% ^| INFO ^| All Crack Replaced>>log.log
    goto CrackMenu
::CRACK THING END


::CREDIT START
::© 2020 SlejmUr
  :Credit
    cls
    Title CREDIT
    MODE 78,20
    curl -L  "https://raw.githubusercontent.com/SlejmUr/R6-AIOTool-Batch/master/TXTS/lang/"%lang%"/credit.txt"
    echo.
    pause
    cls
    goto MainMenu
::CREDIT END


::Update START
  :Update
    cls
    Title Update
    MODE 75,20
    curl -L  "https://raw.githubusercontent.com/SlejmUr/R6-AIOTool-Batch/master/TXTS/lang/"%lang%"/update.txt"
    echo.
    pause
    goto MainMenu
::Update END


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
    echo [-] BattleEye is Not running.
    echo ------------------------------------
    pause
    set LOGINFO=BattleEye is Not running.
    set LogNumber=1
    goto logtolog
    :FOUND
    echo ------------------------------------
    echo [+] BattleEye is running.
    echo ------------------------------------
    pause
    set LOGINFO=BattleEye is running
    set LogNumber=2
    goto logtolog
  ::BattlEyeChecker END

::LOG THINGS START
  :logstart
    echo %TIME% ^| INFO ^| Started %AllInOneVersion%>>log.log
    goto github

  :LogCheck
    if exist "log.log" (
    goto SizeCheck
    ) else (
    echo.>>log.log
    goto logstart
    )
    goto LogCheck

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
  goto SizeCheck

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
    goto LogZipping

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
    goto SelectToCheck


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
    set "LOGINFO=%Selected% Downloaded"
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
    set LOGINFO=%Selected% Selected to Delete
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
