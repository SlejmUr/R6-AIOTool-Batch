@echo off
::For I can run it

:ExtraMenu
  cls
  Title Rainbow Six Siege Extra Menu
  MODE 50,25
  echo ExtraMenu Loaded>>log.log
  set LastSelector=Extra
  echo [93m-----------------------NOTES----------------------[0m
  echo                Extra Language Menu
  echo               Placeholder
  echo [93m-----------------------SELECT---------------------[0m
  Resources\cmdmenusel f8f0 "    Extra Version" "    Extra Release" "    Extra Event" "    Back"

  if %ERRORLEVEL%==1 (
  echo Extra Version>>log.log
  cls
  goto Extra
  )
  if %ERRORLEVEL%==2 (
  echo Extra Release>>log.log
  cls
  goto Extra
  )
  if %ERRORLEVEL%==3 (
  echo Extra Event>>log.log
  cls
  goto ExtraEvent
  )
  if %ERRORLEVEL% == 4 (
  cls
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
  goto ExtraMenu


:ExtraEvent
  cls
  Title Rainbow Six Siege Extra Menu
  MODE 50,25
  echo ExtraEvent Loaded>>log.log
  echo [93m-----------------------NOTES----------------------[0m
  echo             Extra Event Language Menu
  echo               Placeholder
  echo [93m-----------------------SELECT---------------------[0m
  Resources\cmdmenusel f8f0 "   Outback" "   Mad House" "   Rainbow is Magic" "   Showdown" "   Doctors Curse" "   Road To S.I. 2020" "   Gang Destruction / Golden Gun" "   M.U.T.E Protocol (Supported Omega)" "   Sugar Fright / Telly" "   Back"
  
  if %ERRORLEVEL%==1 (
  echo Outback Extra Language Chosen>>log.log
  cls
  goto ExtraEvent
  )
  if %ERRORLEVEL%==2 (
  echo Mad House Extra Language Chosen>>log.log
  cls
  goto ExtraEvent
  )
  if %ERRORLEVEL%==3 (
  echo Rainbow is Magic Extra Language Chosen>>log.log
  cls
  goto ExtraEvent
  )
  if %ERRORLEVEL%==4 (
  echo Showdown Extra Language Chosen>>log.log
  cls
  goto ExtraEvent
  )
  if %ERRORLEVEL%==5 (
  echo Doctors Curse Extra Language Chosen>>log.log
  cls
  goto ExtraEvent
  )
  if %ERRORLEVEL%==6 (
  echo Road To S.I. 2020 Extra Language Chosen>>log.log
  cls
  goto ExtraEvent
  )
  if %ERRORLEVEL%==7 (
  echo Gang Destruction Extra Language Chosen>>log.log
  cls
  goto ExtraEvent
  )
  if %ERRORLEVEL%==8 (
  echo M.U.T.E Protocol Extra Language Chosen>>log.log
  cls
  goto ExtraEvent
  )
  if %ERRORLEVEL%==9 (
  echo Sugar Fright Extra Language Chosen>>log.log
  cls
  goto ExtraEvent
  )
  if %ERRORLEVEL%==10 (
  echo Back - %TIME%>>log.log
  cls
  goto ExtraMenu
  )
  goto ExtraEvent


::Extra START
:Extra
  cls
  Title Rainbow Six Siege Extra Selector
  MODE 50,30
  echo Extra Loaded>>log.log
  set LastSelector=Extra
  echo [93m-----------------------NOTES----------------------[0m
  echo             Extra Event Language Menu
  echo               Placeholder - /Red Crow/
  echo [93m-----------------------SELECT---------------------[0m
  Resources\cmdmenusel f8f0 "  Vanilla" "  Black Ice" "  Dust Line" "  Skull Rain" "  Red Crow" "  Velvet Shell" "  Health" "  Blood Orchid" "  White Noise" "  Chimera" "  Para Bellum" "  Grim Sky" "  Wind Bastion" "  Burnt Horizon" "  Phantom Sight" "  Ember Rise" "  Shifting Tides" "  Void Edge" "  Steel Wave" "  Shadow Legacy" "  Neon Dawn"  "  Back"
  
  if %ERRORLEVEL%==1 (
  echo Vanilla>>log.log
  cls
  goto VanillaLang
  )
  if %ERRORLEVEL%==2 (
  echo Black Ice>>log.log
  cls
  goto BlackIceLang
  )
  if %ERRORLEVEL%==3 (
  echo Dust Line>>log.log
  cls
  goto DustLineLang
  )
  if %ERRORLEVEL%==4 (
  echo Skull Rain>>log.log
  cls
  goto SkullRainLang
  )
  if %ERRORLEVEL%==5 (
  echo Red Crow>>log.log
  cls
  goto RedCrowLang
  )
  if %ERRORLEVEL% == 22 (
  echo Back - %TIME%>>log.log
  cls
  goto ExtraMenu
  )
  goto Extra
::Extra END


::Vanilla START
:VanillaLang
  cls
  Title Rainbow Six Siege Vanilla Lang Downloader
  MODE 50,38
  echo [93m-----------------------NOTES----------------------[0m
  echo          Vanilla Language Downloader
  echo               Placeholder
  echo [93m-----------------------SELECT---------------------[0m
  Resources\cmdmenusel f8f0 "    French Lang" "    Italian Lang" "    German Lang" "    Spanish - Spain Lang" "    Portuguese - Brazil Lang" "    Polish Lang" "    Dutch Lang" "    Czech Lang" "    Korean Lang" "    Traditional Chinese Lang" "    Simplified Chinese Lang" "    Japanese Lang" "    Russian Lang" "    Back"

  if %ERRORLEVEL%==1 (
  :VanillaFrench
  MODE 100,40
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359553 -manifest 940838089858119714 -username %username% -remember-password -dir "R6Downloads\Y1S0_Vanilla" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's French Lang on Vanilla
  goto MainMenu
  )
  if %ERRORLEVEL%==2 (
  :VanillaItalian
  MODE 100,40
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359554 -manifest 7179158265062294015 -username %username% -remember-password -dir "R6Downloads\Y1S0_Vanilla" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Italian Lang on Vanilla
  goto MainMenu
  )
  if %ERRORLEVEL%==3 (
  :VanillaGerman
  MODE 100,40
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359555 -manifest 3953006809848583127 -username %username% -remember-password -dir "R6Downloads\Y1S0_Vanilla" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's German Lang on Vanilla
  goto MainMenu
  )
  if %ERRORLEVEL%==4 (
  :VanillaSpanish
  MODE 100,40
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359556 -manifest 6248979332984503061 -username %username% -remember-password -dir "R6Downloads\Y1S0_Vanilla" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Spanish Lang on Vanilla
  goto MainMenu
  )
  if %ERRORLEVEL%==5 (
  :VanillaBrasilian
  MODE 100,40
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359557 -manifest 4246528818872796970 -username %username% -remember-password -dir "R6Downloads\Y1S0_Vanilla" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Brasilian Lang on Vanilla
  goto MainMenu
  )
  if %ERRORLEVEL%==6 (
  :VanillaPolish
  MODE 100,40
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359558 -manifest 3650448467998593870 -username %username% -remember-password -dir "R6Downloads\Y1S0_Vanilla" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Polish Lang on Vanilla
  goto MainMenu
  )
  if %ERRORLEVEL%==7 (
  :VanillaDutch
  MODE 100,40
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377230 -manifest 434053950562761763 -username %username% -remember-password -dir "R6Downloads\Y1S0_Vanilla" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Dutch Lang on Vanilla
  goto MainMenu
  )
  if %ERRORLEVEL%==8 (
  :VanillaCzech
  MODE 100,40
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377231 -manifest 961787742874674106 -username %username% -remember-password -dir "R6Downloads\Y1S0_Vanilla" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Czech Lang on Vanilla
  goto MainMenu
  )
  if %ERRORLEVEL%==9 (
  :VanillaKorean
  MODE 100,40
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377232 -manifest 4666462401429503167 -username %username% -remember-password -dir "R6Downloads\Y1S0_Vanilla" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Korean Lang on Vanilla
  goto MainMenu
  )
  if %ERRORLEVEL%==10 (
  :VanillaTChinese
  MODE 100,40
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377233 -manifest 8123484057310613369 -username %username% -remember-password -dir "R6Downloads\Y1S0_Vanilla" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's TChinese Lang on Vanilla
  goto MainMenu
  )
  if %ERRORLEVEL%==11 (
  :VanillaSChinese
  MODE 100,40
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377234 -manifest 7408437752633543455 -username %username% -remember-password -dir "R6Downloads\Y1S0_Vanilla" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's SChinese Lang on Vanilla
  goto MainMenu
  )
  if %ERRORLEVEL%==12 (
  :VanillaJapanese
  MODE 100,40
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377235 -manifest 3426628477659109421 -username %username% -remember-password -dir "R6Downloads\Y1S0_Vanilla" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Japanese Lang on Vanilla
  goto MainMenu
  )
  if %ERRORLEVEL%==13 (
  :VanillaRussian
  MODE 100,40
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377236 -manifest 4326401341058506434 -username %username% -remember-password -dir "R6Downloads\Y1S0_Vanilla" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Russian Lang on Vanilla
  goto MainMenu
  )
  if %ERRORLEVEL%==14 (
  echo Back - %TIME%>>log.log
  cls
  goto ExtraMenu
  )
  goto VanillaLang
  
