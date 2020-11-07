
::Extra START
:Extra
  cls
  Title Rainbow Six Siege Extra Selector
  MODE 50,25
  echo Extra Loaded>>log.log
  set LastSelector=Extra
  echo [93m-----------------------NOTES----------------------[0m
  echo                Extra Language Selector
  echo               EVENT LANG CURRENTLY NOT SUPPORTED
  echo [93m-----------------------SELECT---------------------[0m
  Resources\cmdmenusel f8f0 "  French Language" "  Italian Language" "  German Language" "  Spanish - Spain Language" "  Portuguese - Brazil Language" "  Polish Language" "  Dutch Language" "  Czech Language" "  Korean Language" "  Traditional Chinese Language" "  Simplified Chinese Language" "  Japanese Language" "  Russian Language" "  Back"

  if %ERRORLEVEL%==1 (
  echo French Choosed>>log.log
  cls
  goto French
  )
  if %ERRORLEVEL%==2 (
  echo Italian Choosed>>log.log
  cls
  goto Italian
  )
  if %ERRORLEVEL%==3 (
  echo German Choosed>>log.log
  cls
  goto German
  )
  if %ERRORLEVEL%==4 (
  echo French Choosed>>log.log
  cls
  goto Spanish
  )
  if %ERRORLEVEL%==5 (
  echo Brasilian Choosed>>log.log
  cls
  goto Brasilian
  )
  if %ERRORLEVEL%==6 (
  echo Polish Choosed>>log.log
  cls
  goto Polish
  )
  if %ERRORLEVEL%==7 (
  echo Dutch Choosed>>log.log
  cls
  goto Dutch
  )
  if %ERRORLEVEL%==8 (
  echo Czech Choosed>>log.log
  cls
  goto Czech
  )
  if %ERRORLEVEL%==9 (
  echo Korean Choosed>>log.log
  cls
  goto Korean
  )
  if %ERRORLEVEL%==10 (
  echo TChinese Choosed>>log.log
  cls
  goto TChinese
  )
  if %ERRORLEVEL%==11 (
  echo SChinese Choosed>>log.log
  cls
  goto SChinese
  )
  if %ERRORLEVEL%==12 (
  echo Japanese Choosed>>log.log
  cls
  goto Japanese
  )
  if %ERRORLEVEL%==13 (
  echo Russian Choosed>>log.log
  cls
  goto Russian
  )
  if %ERRORLEVEL%==14 (
  echo Back - %TIME%>>log.log
  cls
  goto InstallMenu
  )
  goto Extra
::Extra END


::LANG START
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
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359553 -manifest 940838089858119714 -username %username% -remember-password -dir "R6Downloads\Y1S0_Vanilla" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's French Lang on Vanilla
  goto MainMenu
  )
  if %version%==2 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359553 -manifest 3933270230638281254 -username %username% -remember-password -dir "R6Downloads\Y1S1_Black_Ice" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's French Lang on Black Ice 
  goto MainMenu
  )
  if %version%==3 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359553 -manifest 8417670786870682154 -username %username% -remember-password -dir "R6Downloads\Y1S2_Dust_Line" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's French Lang on Dust Line
  goto MainMenu
  )
  if %version%==4 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359553 -manifest 5132022816747475711 -username %username% -remember-password -dir "R6Downloads\Y1S3_Skull_Rain" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's French Lang on Skull Rain
  goto MainMenu
  )
  if %version%==41 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359553 -manifest 5132022816747475711 -username %username% -remember-password -dir "R6Downloads\Y1S3_SkullRain" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's French Lang on Skull Rain (Zer0)
  goto MainMenu
  )
  if %version%==5 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359553 -manifest 6096643115970852289 -username %username% -remember-password -dir "R6Downloads\Y1S4_Red_Crow" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's French Lang on Red Crow
  goto MainMenu
  )
  if %version%==6 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359553 -manifest 5858637819174796390 -username %username% -remember-password -dir "R6Downloads\Y2S1_Velvet_Shell" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's French Lang on Velvet Shell
  goto MainMenu
  )
  if %version%==7 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359553 -manifest 5499656844751782586 -username %username% -remember-password -dir "R6Downloads\Y2S2_Health" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's French Lang on Health
  goto MainMenu
  )
  if %version%==71 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359553 -manifest 5499656844751782586 -username %username% -remember-password -dir "R6Downloads\Y2S2_Health_2" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's French Lang on Health (Zer0)
  goto MainMenu
  )
  if %version%==8 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359553 -manifest 790907662127860380 -username %username% -remember-password -dir "R6Downloads\Y2S3_Blood_Orchid" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's French Lang on Blood Orchid
  goto MainMenu
  )
  if %version%==81 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359553 -manifest 790907662127860380 -username %username% -remember-password -dir "R6Downloads\Y2S3_BloodOrchid" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's French Lang on Blood Orchid (Zer0)
  goto MainMenu
  )
  if %version%==9 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359553 -manifest 2934184792636281942 -username %username% -remember-password -dir "R6Downloads\Y2S4_White_Noises" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's French Lang on White Noise
  goto MainMenu
  )
  if %version%==91 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359553 -manifest 2934184792636281942 -username %username% -remember-password -dir "R6Downloads\Y2S4_WhiteNoise" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's French Lang on White Noise (Zer0)
  goto MainMenu
  )
  if %version%==10 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359553 -manifest 6830763708591031513 -username %username% -remember-password -dir "R6Downloads\Y3S1_Chimera" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's French Lang on Chimera
  goto MainMenu
  )
  if %version%==11 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359553 -manifest 2228609364372112585 -username %username% -remember-password -dir "R6Downloads\Y3S2_Para_Bellum" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's French Lang on Para Bellum
  goto MainMenu
  )
  if %version%==12 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359553 -manifest 3063945558350557421 -username %username% -remember-password -dir "R6Downloads\Y3S3_Grim_Sky" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's French Lang on Grim Sky
  goto MainMenu
  )
  if %version%==121 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359553 -manifest 3063945558350557421 -username %username% -remember-password -dir "R6Downloads\Y3S3_GrimSky" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's French Lang on Grim Sky (Zer0)
  goto MainMenu
  )
  if %version%==13 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359553 -manifest 700171152841929114 -username %username% -remember-password -dir "R6Downloads\Y3S4_Wind_Bastion" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's French Lang on Wind Bastion
  goto MainMenu
  )
  if %version%==14 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359553 -manifest 2489165098014835664 -username %username% -remember-password -dir "R6Downloads\Y4S1_Burnt_Horizon" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's French Lang on Burnt Horizon
  goto MainMenu
  )
  if %version%==141 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359553 -manifest 2489165098014835664 -username %username% -remember-password -dir "R6Downloads\Y4S1_BurntHorizon" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's French Lang on Burnt Horizon (Zer0)
  goto MainMenu
  )
  if %version%==15 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359553 -manifest 8209966773310799535 -username %username% -remember-password -dir "R6Downloads\Y4S2_Phantom_Sight" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's French Lang on Phantom Sight 
  goto MainMenu
  )
  if %version%==16 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359553 -manifest 9167311800727871226 -username %username% -remember-password -dir "R6Downloads\Y4S3_Ember_Rise" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's French Lang on Ember Rise 
  goto MainMenu
  )
  if %version%==161 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359553 -manifest 9167311800727871226 -username %username% -remember-password -dir "R6Downloads\Y4S3_EmberRise" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's French Lang on Ember Rise (Zer0)
  goto MainMenu
  )
  if %version%==17 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359553 -manifest 982226827055842157 -username %username% -remember-password -dir "R6Downloads\Y4S4_Shifting_Tides" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's French Lang on Shifting Tides 
  goto MainMenu
  )
  if %version%==18 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359553 -manifest 6351511531186309516 -username %username% -remember-password -dir "R6Downloads\Y5S1_Void_Edge" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's French Lang on Void Edge 
  goto MainMenu
  )
  if %version%==181 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359553 -manifest 6351511531186309516 -username %username% -remember-password -dir "R6Downloads\Y5S1_VoidEdge" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's French Lang on Void Edge (Zer0)
  goto MainMenu
  )
  if %version%==19 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359553 -manifest 379201990182673961 -username %username% -remember-password -dir "R6Downloads\Y5S2_Steel_Wave" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's French Lang on Steel Wave 
  goto MainMenu
  )
  if %version%==191 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359553 -manifest 379201990182673961 -username %username% -remember-password -dir "R6Downloads\Y5S2_SteelWave" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's French Lang on Steel Wave (Zer0)
  goto MainMenu
  )
  if %version%==20 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359553 -manifest 490063692268635993 -username %username% -remember-password -dir "R6Downloads\Y5S3_Shadow_Legacy" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's French Lang on Shadow Legacy
  goto MainMenu
  )
  if %version%==21 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359553 -manifest %manifest% -username %username% -remember-password -dir "R6Downloads\Placeholder" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's French Lang on Placeholder
  goto MainMenu
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
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359554 -manifest 7179158265062294015 -username %username% -remember-password -dir "R6Downloads\Y1S0_Vanilla" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Italian Lang on Vanilla
  goto MainMenu
  )
  if %version%==2 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359554 -manifest 5760263381471720373 -username %username% -remember-password -dir "R6Downloads\Y1S1_Black_Ice" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Italian Lang on Black Ice 
  goto MainMenu
  )
  if %version%==3 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359554 -manifest 2551476087873566284 -username %username% -remember-password -dir "R6Downloads\Y1S2_Dust_Line" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Italian Lang on Dust Line
  goto MainMenu
  )
  if %version%==4 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359554 -manifest 1819965373025810009 -username %username% -remember-password -dir "R6Downloads\Y1S3_Skull_Rain" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Italian Lang on Skull Rain
  goto MainMenu
  )
  if %version%==41 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359554 -manifest 1819965373025810009 -username %username% -remember-password -dir "R6Downloads\Y1S3_SkullRain" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Italian Lang on Skull Rain (Zer0)
  goto MainMenu
  )
  if %version%==5 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359554 -manifest 8822593964618949966 -username %username% -remember-password -dir "R6Downloads\Y1S4_Red_Crow" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Italian Lang on Red Crow
  goto MainMenu
  )
  if %version%==6 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359554 -manifest 1442016899353884599 -username %username% -remember-password -dir "R6Downloads\Y2S1_Velvet_Shell" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Italian Lang on Velvet Shell
  goto MainMenu
  )
  if %version%==7 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359554 -manifest 4814130789498386116 -username %username% -remember-password -dir "R6Downloads\Y2S2_Health" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Italian Lang on Health
  goto MainMenu
  )
  if %version%==71 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359554 -manifest 4814130789498386116 -username %username% -remember-password -dir "R6Downloads\Y2S2_Health_2" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Italian Lang on Health (Zer0)
  goto MainMenu
  )
  if %version%==8 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359554 -manifest 3928776659583035772 -username %username% -remember-password -dir "R6Downloads\Y2S3_Blood_Orchid" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Italian Lang on Blood Orchid
  goto MainMenu
  )
  if %version%==81 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359554 -manifest 3928776659583035772 -username %username% -remember-password -dir "R6Downloads\Y2S3_BloodOrchid" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Italian Lang on Blood Orchid (Zer0)
  goto MainMenu
  )
  if %version%==9 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359554 -manifest 6120111820088733265 -username %username% -remember-password -dir "R6Downloads\Y2S4_White_Noises" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Italian Lang on White Noise
  goto MainMenu
  )
  if %version%==91 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359554 -manifest 6120111820088733265 -username %username% -remember-password -dir "R6Downloads\Y2S4_WhiteNoise" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Italian Lang on White Noise (Zer0)
  goto MainMenu
  )
  if %version%==10 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359554 -manifest 8951270584274959688 -username %username% -remember-password -dir "R6Downloads\Y3S1_Chimera" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Italian Lang on Chimera
  goto MainMenu
  )
  if %version%==11 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359554 -manifest 3765579578277178198 -username %username% -remember-password -dir "R6Downloads\Y3S2_Para_Bellum" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Italian Lang on Para Bellum
  goto MainMenu
  )
  if %version%==12 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359554 -manifest 8817435015508321947 -username %username% -remember-password -dir "R6Downloads\Y3S3_Grim_Sky" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Italian Lang on Grim Sky
  goto MainMenu
  )
  if %version%==121 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359554 -manifest 8817435015508321947 -username %username% -remember-password -dir "R6Downloads\Y3S3_GrimSky" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Italian Lang on Grim Sky (Zer0)
  goto MainMenu
  )
  if %version%==13 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359554 -manifest 6317337128494587862 -username %username% -remember-password -dir "R6Downloads\Y3S4_Wind_Bastion" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Italian Lang on Wind Bastion
  goto MainMenu
  )
  if %version%==14 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359554 -manifest 5912470135426316642 -username %username% -remember-password -dir "R6Downloads\Y4S1_Burnt_Horizon" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Italian Lang on Burnt Horizon
  goto MainMenu
  )
  if %version%==141 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359554 -manifest 5912470135426316642 -username %username% -remember-password -dir "R6Downloads\Y4S1_BurntHorizon" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Italian Lang on Burnt Horizon (Zer0)
  goto MainMenu
  )
  if %version%==15 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359554 -manifest 5551310338808720316 -username %username% -remember-password -dir "R6Downloads\Y4S2_Phantom_Sight" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Italian Lang on Phantom Sight 
  goto MainMenu
  )
  if %version%==16 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359554 -manifest 9032788833180559255 -username %username% -remember-password -dir "R6Downloads\Y4S3_Ember_Rise" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Italian Lang on Ember Rise 
  goto MainMenu
  )
  if %version%==161 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359554 -manifest 9032788833180559255 -username %username% -remember-password -dir "R6Downloads\Y4S3_EmberRise" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Italian Lang on Ember Rise (Zer0)
  goto MainMenu
  )
  if %version%==17 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359554 -manifest 7669952636769439421 -username %username% -remember-password -dir "R6Downloads\Y4S4_Shifting_Tides" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Italian Lang on Shifting Tides 
  goto MainMenu
  )
  if %version%==18 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359554 -manifest 2083562978649529043 -username %username% -remember-password -dir "R6Downloads\Y5S1_Void_Edge" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Italian Lang on Void Edge 
  goto MainMenu
  )
  if %version%==181 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359554 -manifest 2083562978649529043 -username %username% -remember-password -dir "R6Downloads\Y5S1_VoidEdge" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Italian Lang on Void Edge (Zer0)
  goto MainMenu
  )
  if %version%==19 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359554 -manifest 7015749936618767871 -username %username% -remember-password -dir "R6Downloads\Y5S2_Steel_Wave" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Italian Lang on Steel Wave 
  goto MainMenu
  )
  if %version%==191 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359554 -manifest 7015749936618767871 -username %username% -remember-password -dir "R6Downloads\Y5S2_SteelWave" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Italian Lang on Steel Wave (Zer0)
  goto MainMenu
  )
  if %version%==20 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359554 -manifest 8865509294556462405 -username %username% -remember-password -dir "R6Downloads\Y5S3_Shadow_Legacy" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Italian Lang on Shadow Legacy
  goto MainMenu
  )
  if %version%==21 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359554 -manifest %manifest% -username %username% -remember-password -dir "R6Downloads\Placeholder" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Italian Lang on Placeholder
  goto MainMenu
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
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359555 -manifest 3953006809848583127 -username %username% -remember-password -dir "R6Downloads\Y1S0_Vanilla" -validate -max-servers 15 -max-downloads 10
	pause
	cls
	echo Download complete!
	echo It's German Lang on Vanilla
	goto MainMenu
	)
  if %version%==2 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359555 -manifest 7470955591961528063 -username %username% -remember-password -dir "R6Downloads\Y1S1_Black_Ice" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's German Lang on Black Ice 
  goto MainMenu
  )
  if %version%==3 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359555 -manifest 781358903497748263 -username %username% -remember-password -dir "R6Downloads\Y1S2_Dust_Line" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's German Lang on Dust Line
  goto MainMenu
  )
  if %version%==4 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359555 -manifest 1926652807113950777 -username %username% -remember-password -dir "R6Downloads\Y1S3_Skull_Rain" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's German Lang on Skull Rain
  goto MainMenu
  )
  if %version%==41 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359555 -manifest 1926652807113950777 -username %username% -remember-password -dir "R6Downloads\Y1S3_SkullRain" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's German Lang on Skull Rain (Zer0)
  goto MainMenu
  )
  if %version%==5 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359555 -manifest 7995072742170754868 -username %username% -remember-password -dir "R6Downloads\Y1S4_Red_Crow" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's German Lang on Red Crow
  goto MainMenu
  )
  if %version%==6 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359555 -manifest 7391813408396935946 -username %username% -remember-password -dir "R6Downloads\Y2S1_Velvet_Shell" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's German Lang on Velvet Shell
  goto MainMenu
  )
  if %version%==7 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359555 -manifest 4850286352511597480 -username %username% -remember-password -dir "R6Downloads\Y2S2_Health" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's German Lang on Health
  goto MainMenu
  )
  if %version%==71 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359555 -manifest 4850286352511597480 -username %username% -remember-password -dir "R6Downloads\Y2S2_Health_2" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's German Lang on Health (Zer0)
  goto MainMenu
  )
  if %version%==8 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359555 -manifest 7173152983008794231 -username %username% -remember-password -dir "R6Downloads\Y2S3_Blood_Orchid" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's German Lang on Blood Orchid
  goto MainMenu
  )
  if %version%==81 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359555 -manifest 7173152983008794231 -username %username% -remember-password -dir "R6Downloads\Y2S3_BloodOrchid" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's German Lang on Blood Orchid (Zer0)
  goto MainMenu
  )
  if %version%==9 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359555 -manifest 1122657510721658234 -username %username% -remember-password -dir "R6Downloads\Y2S4_White_Noises" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's German Lang on White Noise
  goto MainMenu
  )
  if %version%==91 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359555 -manifest 1122657510721658234 -username %username% -remember-password -dir "R6Downloads\Y2S4_WhiteNoise" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's German Lang on White Noise (Zer0)
  goto MainMenu
  )
  if %version%==10 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359555 -manifest 365667853833643908 -username %username% -remember-password -dir "R6Downloads\Y3S1_Chimera" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's German Lang on Chimera
  goto MainMenu
  )
  if %version%==11 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359555 -manifest 436165049364805671 -username %username% -remember-password -dir "R6Downloads\Y3S2_Para_Bellum" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's German Lang on Para Bellum
  goto MainMenu
  )
  if %version%==12 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359555 -manifest 6254711869946987864 -username %username% -remember-password -dir "R6Downloads\Y3S3_Grim_Sky" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's German Lang on Grim Sky
  goto MainMenu
  )
  if %version%==121 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359555 -manifest 6254711869946987864 -username %username% -remember-password -dir "R6Downloads\Y3S3_GrimSky" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's German Lang on Grim Sky (Zer0)
  goto MainMenu
  )
  if %version%==13 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359555 -manifest 6357970357791494519 -username %username% -remember-password -dir "R6Downloads\Y3S4_Wind_Bastion" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's German Lang on Wind Bastion
  goto MainMenu
  )
  if %version%==14 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359555 -manifest 6166102473910342218 -username %username% -remember-password -dir "R6Downloads\Y4S1_Burnt_Horizon" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's German Lang on Burnt Horizon
  goto MainMenu
  )
  if %version%==141 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359555 -manifest 6166102473910342218 -username %username% -remember-password -dir "R6Downloads\Y4S1_BurntHorizon" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's German Lang on Burnt Horizon (Zer0)
  goto MainMenu
  )
  if %version%==15 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359555 -manifest 2945239480726569964 -username %username% -remember-password -dir "R6Downloads\Y4S2_Phantom_Sight" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's German Lang on Phantom Sight 
  goto MainMenu
  )
  if %version%==16 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359555 -manifest 5892684040914151033 -username %username% -remember-password -dir "R6Downloads\Y4S3_Ember_Rise" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's German Lang on Ember Rise 
  goto MainMenu
  )
  if %version%==161 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359555 -manifest 5892684040914151033 -username %username% -remember-password -dir "R6Downloads\Y4S3_EmberRise" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's German Lang on Ember Rise (Zer0)
  goto MainMenu
  )
  if %version%==17 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359555 -manifest 1771833119782386213 -username %username% -remember-password -dir "R6Downloads\Y4S4_Shifting_Tides" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's German Lang on Shifting Tides 
  goto MainMenu
  )
  if %version%==18 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359555 -manifest 4220186838055347645 -username %username% -remember-password -dir "R6Downloads\Y5S1_Void_Edge" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's German Lang on Void Edge 
  goto MainMenu
  )
  if %version%==181 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359555 -manifest 4220186838055347645 -username %username% -remember-password -dir "R6Downloads\Y5S1_VoidEdge" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's German Lang on Void Edge (Zer0)
  goto MainMenu
  )
  if %version%==19 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359555 -manifest 9103781936104145156 -username %username% -remember-password -dir "R6Downloads\Y5S2_Steel_Wave" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's German Lang on Steel Wave 
  goto MainMenu
  )
  if %version%==191 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359555 -manifest 9103781936104145156 -username %username% -remember-password -dir "R6Downloads\Y5S2_SteelWave" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's German Lang on Steel Wave (Zer0)
  goto MainMenu
  )
  if %version%==20 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359555 -manifest 615915835199657008 -username %username% -remember-password -dir "R6Downloads\Y5S3_Shadow_Legacy" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's German Lang on Shadow Legacy
  goto MainMenu
  )
  if %version%==21 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359555 -manifest %manifest% -username %username% -remember-password -dir "R6Downloads\Placeholder" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's German Lang on Placeholder
  goto MainMenu
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
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359556 -manifest 6248979332984503061 -username %username% -remember-password -dir "R6Downloads\Y1S0_Vanilla" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Spanish Lang on Vanilla
  goto MainMenu
  )
  if %version%==2 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359556 -manifest 6534545487175120142 -username %username% -remember-password -dir "R6Downloads\Y1S1_Black_Ice" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Spanish Lang on Black Ice 
  goto MainMenu
  )
  if %version%==3 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359556 -manifest 8080893511664284255 -username %username% -remember-password -dir "R6Downloads\Y1S2_Dust_Line" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Spanish Lang on Dust Line
  goto MainMenu
  )
  if %version%==4 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359556 -manifest 3102063947541599011 -username %username% -remember-password -dir "R6Downloads\Y1S3_Skull_Rain" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Spanish Lang on Skull Rain
  goto MainMenu
  )
  if %version%==41 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359556 -manifest 3102063947541599011 -username %username% -remember-password -dir "R6Downloads\Y1S3_SkullRain" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Spanish Lang on Skull Rain (Zer0)
  goto MainMenu
  )
  if %version%==5 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359556 -manifest 3745420316643316529 -username %username% -remember-password -dir "R6Downloads\Y1S4_Red_Crow" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Spanish Lang on Red Crow
  goto MainMenu
  )
  if %version%==6 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359556 -manifest 4034802727985013756 -username %username% -remember-password -dir "R6Downloads\Y2S1_Velvet_Shell" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Spanish Lang on Velvet Shell
  goto MainMenu
  )
  if %version%==7 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359556 -manifest 7743695641492470240 -username %username% -remember-password -dir "R6Downloads\Y2S2_Health" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Spanish Lang on Health
  goto MainMenu
  )
  if %version%==71 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359556 -manifest 7743695641492470240 -username %username% -remember-password -dir "R6Downloads\Y2S2_Health_2" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Spanish Lang on Health (Zer0)
  goto MainMenu
  )
  if %version%==8 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359556 -manifest 7768315116657553428 -username %username% -remember-password -dir "R6Downloads\Y2S3_Blood_Orchid" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Spanish Lang on Blood Orchid
  goto MainMenu
  )
  if %version%==81 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359556 -manifest 7768315116657553428 -username %username% -remember-password -dir "R6Downloads\Y2S3_BloodOrchid" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Spanish Lang on Blood Orchid (Zer0)
  goto MainMenu
  )
  if %version%==9 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359556 -manifest 7877024295509467816 -username %username% -remember-password -dir "R6Downloads\Y2S4_White_Noises" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Spanish Lang on White Noise
  goto MainMenu
  )
  if %version%==91 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359556 -manifest 7877024295509467816 -username %username% -remember-password -dir "R6Downloads\Y2S4_WhiteNoise" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Spanish Lang on White Noise (Zer0)
  goto MainMenu
  )
  if %version%==10 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359556 -manifest 723936785330189072 -username %username% -remember-password -dir "R6Downloads\Y3S1_Chimera" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Spanish Lang on Chimera
  goto MainMenu
  )
  if %version%==11 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359556 -manifest 3396331896624899011 -username %username% -remember-password -dir "R6Downloads\Y3S2_Para_Bellum" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Spanish Lang on Para Bellum
  goto MainMenu
  )
  if %version%==12 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359556 -manifest 2769168610408745300 -username %username% -remember-password -dir "R6Downloads\Y3S3_Grim_Sky" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Spanish Lang on Grim Sky
  goto MainMenu
  )
  if %version%==121 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359556 -manifest 2769168610408745300 -username %username% -remember-password -dir "R6Downloads\Y3S3_GrimSky" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Spanish Lang on Grim Sky (Zer0)
  goto MainMenu
  )
  if %version%==13 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359556 -manifest 1310832078295252288 -username %username% -remember-password -dir "R6Downloads\Y3S4_Wind_Bastion" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Spanish Lang on Wind Bastion
  goto MainMenu
  )
  if %version%==14 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359556 -manifest 8980928302668128431 -username %username% -remember-password -dir "R6Downloads\Y4S1_Burnt_Horizon" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Spanish Lang on Burnt Horizon
  goto MainMenu
  )
  if %version%==141 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359556 -manifest 8980928302668128431 -username %username% -remember-password -dir "R6Downloads\Y4S1_BurntHorizon" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Spanish Lang on Burnt Horizon (Zer0)
  goto MainMenu
  )
  if %version%==15 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359556 -manifest 3119251800260595817 -username %username% -remember-password -dir "R6Downloads\Y4S2_Phantom_Sight" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Spanish Lang on Phantom Sight 
  goto MainMenu
  )
  if %version%==16 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359556 -manifest 4178602548762056641 -username %username% -remember-password -dir "R6Downloads\Y4S3_Ember_Rise" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Spanish Lang on Ember Rise 
  goto MainMenu
  )
  if %version%==161 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359556 -manifest 3299372491475509511 -username %username% -remember-password -dir "R6Downloads\Y4S3_EmberRise" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Spanish Lang on Ember Rise (Zer0)
  goto MainMenu
  )
  if %version%==17 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359556 -manifest 5607986007728468442 -username %username% -remember-password -dir "R6Downloads\Y4S4_Shifting_Tides" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Spanish Lang on Shifting Tides 
  goto MainMenu
  )
  if %version%==18 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359556 -manifest 8280780297583800068 -username %username% -remember-password -dir "R6Downloads\Y5S1_Void_Edge" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Spanish Lang on Void Edge 
  goto MainMenu
  )
  if %version%==181 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359556 -manifest 8280780297583800068 -username %username% -remember-password -dir "R6Downloads\Y5S1_VoidEdge" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Spanish Lang on Void Edge (Zer0)
  goto MainMenu
  )
  if %version%==19 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359556 -manifest 3323378213398656976 -username %username% -remember-password -dir "R6Downloads\Y5S2_Steel_Wave" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Spanish Lang on Steel Wave 
  goto MainMenu
  )
  if %version%==191 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359556 -manifest 3323378213398656976 -username %username% -remember-password -dir "R6Downloads\Y5S2_SteelWave" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Spanish Lang on Steel Wave (Zer0)
  goto MainMenu
  )
  if %version%==20 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359556 -manifest 2485600059396261361 -username %username% -remember-password -dir "R6Downloads\Y5S3_Shadow_Legacy" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Spanish Lang on Shadow Legacy
  goto MainMenu
  )
  if %version%==21 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359556 -manifest %manifest% -username %username% -remember-password -dir "R6Downloads\Placeholder" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Spanish Lang on Placeholder
  goto MainMenu
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
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359557 -manifest 4246528818872796970 -username %username% -remember-password -dir "R6Downloads\Y1S0_Vanilla" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Brasilian Lang on Vanilla
  goto MainMenu
  )
  if %version%==2 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359557 -manifest 5712713603408405370 -username %username% -remember-password -dir "R6Downloads\Y1S1_Black_Ice" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Brasilian Lang on Black Ice 
  goto MainMenu
  )
  if %version%==3 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359557 -manifest 7093312220135270425 -username %username% -remember-password -dir "R6Downloads\Y1S2_Dust_Line" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Brasilian Lang on Dust Line
  goto MainMenu
  )
  if %version%==4 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359557 -manifest 1002387473375422601 -username %username% -remember-password -dir "R6Downloads\Y1S3_Skull_Rain" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Brasilian Lang on Skull Rain
  goto MainMenu
  )
  if %version%==41 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359557 -manifest 1002387473375422601 -username %username% -remember-password -dir "R6Downloads\Y1S3_SkullRain" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Brasilian Lang on Skull Rain (Zer0)
  goto MainMenu
  )
  if %version%==5 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359557 -manifest 9177769359376990903 -username %username% -remember-password -dir "R6Downloads\Y1S4_Red_Crow" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Brasilian Lang on Red Crow
  goto MainMenu
  )
  if %version%==6 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359557 -manifest 8373797984073491957 -username %username% -remember-password -dir "R6Downloads\Y2S1_Velvet_Shell" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Brasilian Lang on Velvet Shell
  goto MainMenu
  )
  if %version%==7 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359557 -manifest 740877577181398044 -username %username% -remember-password -dir "R6Downloads\Y2S2_Health" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Brasilian Lang on Health
  goto MainMenu
  )
  if %version%==71 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359557 -manifest 740877577181398044 -username %username% -remember-password -dir "R6Downloads\Y2S2_Health_2" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Brasilian Lang on Health (Zer0)
  goto MainMenu
  )
  if %version%==8 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359557 -manifest 4018202152273389175 -username %username% -remember-password -dir "R6Downloads\Y2S3_Blood_Orchid" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Brasilian Lang on Blood Orchid
  goto MainMenu
  )
  if %version%==81 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359557 -manifest 4018202152273389175 -username %username% -remember-password -dir "R6Downloads\Y2S3_BloodOrchid" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Brasilian Lang on Blood Orchid (Zer0)
  goto MainMenu
  )
  if %version%==9 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359557 -manifest 7662200840621314199 -username %username% -remember-password -dir "R6Downloads\Y2S4_White_Noises" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Brasilian Lang on White Noise
  goto MainMenu
  )
  if %version%==91 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359557 -manifest 7662200840621314199 -username %username% -remember-password -dir "R6Downloads\Y2S4_WhiteNoise" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Brasilian Lang on White Noise (Zer0)
  goto MainMenu
  )
  if %version%==10 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359557 -manifest 4967060442376701942 -username %username% -remember-password -dir "R6Downloads\Y3S1_Chimera" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Brasilian Lang on Chimera
  goto MainMenu
  )
  if %version%==11 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359557 -manifest 7222426493426609376 -username %username% -remember-password -dir "R6Downloads\Y3S2_Para_Bellum" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Brasilian Lang on Para Bellum
  goto MainMenu
  )
  if %version%==12 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359557 -manifest 1079437953122108725 -username %username% -remember-password -dir "R6Downloads\Y3S3_Grim_Sky" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Brasilian Lang on Grim Sky
  goto MainMenu
  )
  if %version%==121 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359557 -manifest 1079437953122108725 -username %username% -remember-password -dir "R6Downloads\Y3S3_GrimSky" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Brasilian Lang on Grim Sky (Zer0)
  goto MainMenu
  )
  if %version%==13 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359557 -manifest 6212948834557799675 -username %username% -remember-password -dir "R6Downloads\Y3S4_Wind_Bastion" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Brasilian Lang on Wind Bastion
  goto MainMenu
  )
  if %version%==14 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359557 -manifest 5742909617569886590 -username %username% -remember-password -dir "R6Downloads\Y4S1_Burnt_Horizon" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Brasilian Lang on Burnt Horizon
  goto MainMenu
  )
  if %version%==141 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359557 -manifest 5742909617569886590 -username %username% -remember-password -dir "R6Downloads\Y4S1_BurntHorizon" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Brasilian Lang on Burnt Horizon (Zer0)
  goto MainMenu
  )
  if %version%==15 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359557 -manifest 2060894578496472402 -username %username% -remember-password -dir "R6Downloads\Y4S2_Phantom_Sight" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Brasilian Lang on Phantom Sight 
  goto MainMenu
  )
  if %version%==16 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359557 -manifest 8187109316671389619 -username %username% -remember-password -dir "R6Downloads\Y4S3_Ember_Rise" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Brasilian Lang on Ember Rise 
  goto MainMenu
  )
  if %version%==161 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359557 -manifest 8187109316671389619 -username %username% -remember-password -dir "R6Downloads\Y4S3_EmberRise" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Brasilian Lang on Ember Rise (Zer0)
  goto MainMenu
  )
  if %version%==17 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359557 -manifest 3980031497374187833 -username %username% -remember-password -dir "R6Downloads\Y4S4_Shifting_Tides" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Brasilian Lang on Shifting Tides 
  goto MainMenu
  )
  if %version%==18 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359557 -manifest 1408940456585952484 -username %username% -remember-password -dir "R6Downloads\Y5S1_Void_Edge" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Brasilian Lang on Void Edge 
  goto MainMenu
  )
  if %version%==181 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359557 -manifest 1408940456585952484 -username %username% -remember-password -dir "R6Downloads\Y5S1_VoidEdge" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Brasilian Lang on Void Edge (Zer0)
  goto MainMenu
  )
  if %version%==19 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359557 -manifest 3124010063296699270 -username %username% -remember-password -dir "R6Downloads\Y5S2_Steel_Wave" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Brasilian Lang on Steel Wave 
  goto MainMenu
  )
  if %version%==191 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359557 -manifest 3124010063296699270 -username %username% -remember-password -dir "R6Downloads\Y5S2_SteelWave" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Brasilian Lang on Steel Wave (Zer0)
  goto MainMenu
  )
  if %version%==20 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359557 -manifest 6424468667015085021 -username %username% -remember-password -dir "R6Downloads\Y5S3_Shadow_Legacy" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Brasilian Lang on Shadow Legacy
  goto MainMenu
  )
  if %version%==21 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359557 -manifest %manifest% -username %username% -remember-password -dir "R6Downloads\Placeholder" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Brasilian Lang on Placeholder
  goto MainMenu
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
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359558 -manifest 3650448467998593870 -username %username% -remember-password -dir "R6Downloads\Y1S0_Vanilla" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Polish Lang on Vanilla
  goto MainMenu
  )
  if %version%==2 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359558 -manifest 611380037218554981 -username %username% -remember-password -dir "R6Downloads\Y1S1_Black_Ice" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Polish Lang on Black Ice 
  goto MainMenu
  )
  if %version%==3 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359558 -manifest 3858352830712224800 -username %username% -remember-password -dir "R6Downloads\Y1S2_Dust_Line" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Polish Lang on Dust Line
  goto MainMenu
  )
  if %version%==4 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359558 -manifest 2324023684915670753 -username %username% -remember-password -dir "R6Downloads\Y1S3_Skull_Rain" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Polish Lang on Skull Rain
  goto MainMenu
  )
  if %version%==21 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359558 -manifest %manifest% -username %username% -remember-password -dir "R6Downloads\Placeholder" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Polish Lang on Placeholder
  goto MainMenu
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
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377230 -manifest 434053950562761763 -username %username% -remember-password -dir "R6Downloads\Y1S0_Vanilla" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Dutch Lang on Vanilla
  goto MainMenu
  )
  if %version%==2 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377230 -manifest 2252756710796870124 -username %username% -remember-password -dir "R6Downloads\Y1S1_Black_Ice" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Dutch Lang on Black Ice 
  goto MainMenu
  )
  if %version%==3 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377230 -manifest 792523120148938529 -username %username% -remember-password -dir "R6Downloads\Y1S2_Dust_Line" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Dutch Lang on Dust Line
  goto MainMenu
  )
  if %version%==4 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377230 -manifest 6519643449965700176 -username %username% -remember-password -dir "R6Downloads\Y1S3_Skull_Rain" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Dutch Lang on Skull Rain
  goto MainMenu
  )
  if %version%==21 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377230 -manifest %manifest% -username %username% -remember-password -dir "R6Downloads\Placeholder" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Dutch Lang on Placeholder
  goto MainMenu
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
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377231 -manifest 961787742874674106 -username %username% -remember-password -dir "R6Downloads\Y1S0_Vanilla" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Czech Lang on Vanilla
  goto MainMenu
  )
  if %version%==2 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377231 -manifest 9083464997167398804 -username %username% -remember-password -dir "R6Downloads\Y1S1_Black_Ice" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Czech Lang on Black Ice 
  goto MainMenu
  )
  if %version%==3 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377231 -manifest 5042288075851140032 -username %username% -remember-password -dir "R6Downloads\Y1S2_Dust_Line" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Czech Lang on Dust Line
  goto MainMenu
  )
  if %version%==4 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377231 -manifest 2274850673348857246 -username %username% -remember-password -dir "R6Downloads\Y1S3_Skull_Rain" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Czech Lang on Skull Rain
  goto MainMenu
  )
  if %version%==21 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377231 -manifest %manifest% -username %username% -remember-password -dir "R6Downloads\Placeholder" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Czech Lang on Placeholder
  goto MainMenu
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
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377232 -manifest 4666462401429503167 -username %username% -remember-password -dir "R6Downloads\Y1S0_Vanilla" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Korean Lang on Vanilla
  goto MainMenu
  )
  if %version%==2 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377232 -manifest 1679233699688952842 -username %username% -remember-password -dir "R6Downloads\Y1S1_Black_Ice" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Korean Lang on Black Ice 
  goto MainMenu
  )
  if %version%==3 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377232 -manifest 3857270863114730703 -username %username% -remember-password -dir "R6Downloads\Y1S2_Dust_Line" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Korean Lang on Dust Line
  goto MainMenu
  )
  if %version%==4 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377232 -manifest 3010562235525323962 -username %username% -remember-password -dir "R6Downloads\Y1S3_Skull_Rain" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Korean Lang on Skull Rain
  goto MainMenu
  )
  if %version%==21 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377232 -manifest %manifest% -username %username% -remember-password -dir "R6Downloads\Placeholder" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Korean Lang on Placeholder
  goto MainMenu
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
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377233 -manifest 8123484057310613369 -username %username% -remember-password -dir "R6Downloads\Y1S0_Vanilla" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's TChinese Lang on Vanilla
  goto MainMenu
  )
  if %version%==2 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377233 -manifest 6415534268030477043 -username %username% -remember-password -dir "R6Downloads\Y1S1_Black_Ice" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's TChinese Lang on Black Ice 
  goto MainMenu
  )
  if %version%==3 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377233 -manifest 1924001092871695610 -username %username% -remember-password -dir "R6Downloads\Y1S2_Dust_Line" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's TChinese Lang on Dust Line
  goto MainMenu
  )
  if %version%==4 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377233 -manifest 4953478873615251033 -username %username% -remember-password -dir "R6Downloads\Y1S3_Skull_Rain" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's TChinese Lang on Skull Rain
  goto MainMenu
  )
  if %version%==21 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377233 -manifest %manifest% -username %username% -remember-password -dir "R6Downloads\Placeholder" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's TChinese Lang on Placeholder
  goto MainMenu
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
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377234 -manifest 7408437752633543455 -username %username% -remember-password -dir "R6Downloads\Y1S0_Vanilla" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's SChinese Lang on Vanilla
  goto MainMenu
  )
  if %version%==2 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377234 -manifest 695733873875406938 -username %username% -remember-password -dir "R6Downloads\Y1S1_Black_Ice" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's SChinese Lang on Black Ice 
  goto MainMenu
  )
  if %version%==3 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377234 -manifest 336078500685842996 -username %username% -remember-password -dir "R6Downloads\Y1S2_Dust_Line" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's SChinese Lang on Dust Line
  goto MainMenu
  )
  if %version%==4 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377234 -manifest 6056122284734366189 -username %username% -remember-password -dir "R6Downloads\Y1S3_Skull_Rain" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's SChinese Lang on Skull Rain
  goto MainMenu
  )
  if %version%==21 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377234 -manifest %manifest% -username %username% -remember-password -dir "R6Downloads\Placeholder" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's SChinese Lang on Placeholder
  goto MainMenu
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
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377235 -manifest 3426628477659109421 -username %username% -remember-password -dir "R6Downloads\Y1S0_Vanilla" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Japanese Lang on Vanilla
  goto MainMenu
  )
  if %version%==2 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377235 -manifest 7819798899236214261 -username %username% -remember-password -dir "R6Downloads\Y1S1_Black_Ice" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Japanese Lang on Black Ice 
  goto MainMenu
  )
  if %version%==3 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377235 -manifest 7164006373234658729 -username %username% -remember-password -dir "R6Downloads\Y1S2_Dust_Line" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Japanese Lang on Dust Line
  goto MainMenu
  )
  if %version%==4 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377235 -manifest 4940468394032132183 -username %username% -remember-password -dir "R6Downloads\Y1S3_Skull_Rain" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Japanese Lang on Skull Rain
  goto MainMenu
  )
  if %version%==41 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377235 -manifest 4940468394032132183 -username %username% -remember-password -dir "R6Downloads\Y1S3_SkullRain" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Japanese Lang on Skull Rain (Zer0)
  goto MainMenu
  )
  if %version%==5 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377235 -manifest 8573459241975382853 -username %username% -remember-password -dir "R6Downloads\Y1S4_Red_Crow" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Japanese Lang on Red Crow
  goto MainMenu
  )
  if %version%==6 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377235 -manifest 4595160401957962156 -username %username% -remember-password -dir "R6Downloads\Y2S1_Velvet_Shell" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Japanese Lang on Velvet Shell
  goto MainMenu
  )
  if %version%==7 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377235 -manifest 6208821339116662917 -username %username% -remember-password -dir "R6Downloads\Y2S2_Health" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Japanese Lang on Health
  goto MainMenu
  )
  if %version%==71 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377235 -manifest 6208821339116662917 -username %username% -remember-password -dir "R6Downloads\Y2S2_Health_2" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Japanese Lang on Health (Zer0)
  goto MainMenu
  )
  if %version%==8 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377235 -manifest 1573647791032056620 -username %username% -remember-password -dir "R6Downloads\Y2S3_Blood_Orchid" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Japanese Lang on Blood Orchid
  goto MainMenu
  )
  if %version%==81 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377235 -manifest 1573647791032056620 -username %username% -remember-password -dir "R6Downloads\Y2S3_BloodOrchid" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Japanese Lang on Blood Orchid (Zer0)
  goto MainMenu
  )
  if %version%==9 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377235 -manifest 4323914207757706720 -username %username% -remember-password -dir "R6Downloads\Y2S4_White_Noises" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Japanese Lang on White Noise
  goto MainMenu
  )
  if %version%==91 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377235 -manifest 7662200840621314199 -username %username% -remember-password -dir "R6Downloads\Y2S4_WhiteNoise" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Japanese Lang on White Noise (Zer0)
  goto MainMenu
  )
  if %version%==10 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377235 -manifest 8184994692095456862 -username %username% -remember-password -dir "R6Downloads\Y3S1_Chimera" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Japanese Lang on Chimera
  goto MainMenu
  )
  if %version%==11 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377235 -manifest 5702757960843346114 -username %username% -remember-password -dir "R6Downloads\Y3S2_Para_Bellum" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Japanese Lang on Para Bellum
  goto MainMenu
  )
  if %version%==12 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377235 -manifest 971478325336602905 -username %username% -remember-password -dir "R6Downloads\Y3S3_Grim_Sky" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Japanese Lang on Grim Sky
  goto MainMenu
  )
  if %version%==121 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377235 -manifest 971478325336602905 -username %username% -remember-password -dir "R6Downloads\Y3S3_GrimSky" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Japanese Lang on Grim Sky (Zer0)
  goto MainMenu
  )
  if %version%==13 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377235 -manifest 8026527283762710847 -username %username% -remember-password -dir "R6Downloads\Y3S4_Wind_Bastion" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Japanese Lang on Wind Bastion
  goto MainMenu
  )
  if %version%==14 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377235 -manifest 6205462284383635854 -username %username% -remember-password -dir "R6Downloads\Y4S1_Burnt_Horizon" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Japanese Lang on Burnt Horizon
  goto MainMenu
  )
  if %version%==141 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377235 -manifest 6205462284383635854 -username %username% -remember-password -dir "R6Downloads\Y4S1_BurntHorizon" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Japanese Lang on Burnt Horizon (Zer0)
  goto MainMenu
  )
  if %version%==15 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377235 -manifest 735237222551525964 -username %username% -remember-password -dir "R6Downloads\Y4S2_Phantom_Sight" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Japanese Lang on Phantom Sight 
  goto MainMenu
  )
  if %version%==16 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377235 -manifest 8453132699861289149 -username %username% -remember-password -dir "R6Downloads\Y4S3_Ember_Rise" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Japanese Lang on Ember Rise 
  goto MainMenu
  )
  if %version%==161 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377235 -manifest 8453132699861289149 -username %username% -remember-password -dir "R6Downloads\Y4S3_EmberRise" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Japanese Lang on Ember Rise (Zer0)
  goto MainMenu
  )
  if %version%==17 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377235 -manifest 4121849146546499241 -username %username% -remember-password -dir "R6Downloads\Y4S4_Shifting_Tides" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Japanese Lang on Shifting Tides 
  goto MainMenu
  )
  if %version%==18 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377235 -manifest 6728091120574045367 -username %username% -remember-password -dir "R6Downloads\Y5S1_Void_Edge" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Japanese Lang on Void Edge 
  goto MainMenu
  )
  if %version%==181 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377235 -manifest 6728091120574045367 -username %username% -remember-password -dir "R6Downloads\Y5S1_VoidEdge" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Japanese Lang on Void Edge (Zer0)
  goto MainMenu
  )
  if %version%==19 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377235 -manifest 5460615762069731497 -username %username% -remember-password -dir "R6Downloads\Y5S2_Steel_Wave" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Japanese Lang on Steel Wave 
  goto MainMenu
  )
  if %version%==191 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377235 -manifest 5460615762069731497 -username %username% -remember-password -dir "R6Downloads\Y5S2_SteelWave" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Japanese Lang on Steel Wave (Zer0)
  goto MainMenu
  )
  if %version%==20 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377235 -manifest 5904431813628700863 -username %username% -remember-password -dir "R6Downloads\Y5S3_Shadow_Legacy" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Japanese Lang on Shadow Legacy
  goto MainMenu
  )
  if %version%==21 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377235 -manifest %manifest% -username %username% -remember-password -dir "R6Downloads\Placeholder" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Japanese Lang on Placeholder
  goto MainMenu
  )
  goto Extra
::Japanese END

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
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377236 -manifest 4326401341058506434 -username %username% -remember-password -dir "R6Downloads\Y1S0_Vanilla" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Russian Lang on Vanilla
  goto MainMenu
  )
  if %version%==2 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377236 -manifest 7163789544030656935 -username %username% -remember-password -dir "R6Downloads\Y1S1_Black_Ice" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Russian Lang on Black Ice 
  goto MainMenu
  )
  if %version%==3 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377236 -manifest 4405345682991436059 -username %username% -remember-password -dir "R6Downloads\Y1S2_Dust_Line" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Russian Lang on Dust Line
  goto MainMenu
  )
  if %version%==4 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377236 -manifest 792795160700208918 -username %username% -remember-password -dir "R6Downloads\Y1S3_Skull_Rain" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Russian Lang on Skull Rain
  goto MainMenu
  )
  if %version%==41 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377236 -manifest 792795160700208918 -username %username% -remember-password -dir "R6Downloads\Y1S3_SkullRain" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Russian Lang on Skull Rain (Zer0)
  goto MainMenu
  )
  if %version%==10 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377236 -manifest 5994322749665877802 -username %username% -remember-password -dir "R6Downloads\Y3S1_Chimera" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Russian Lang on Chimera
  goto MainMenu
  )
  if %version%==11 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377236 -manifest 1607809513640548526 -username %username% -remember-password -dir "R6Downloads\Y3S2_Para_Bellum" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Russian Lang on Para Bellum
  goto MainMenu
  )
  if %version%==12 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377236 -manifest 3013637849914826120 -username %username% -remember-password -dir "R6Downloads\Y3S3_Grim_Sky" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Russian Lang on Grim Sky
  goto MainMenu
  )
  if %version%==121 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377236 -manifest 3013637849914826120 -username %username% -remember-password -dir "R6Downloads\Y3S3_GrimSky" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Russian Lang on Grim Sky (Zer0)
  goto MainMenu
  )
  if %version%==13 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377236 -manifest 8306800552570152557 -username %username% -remember-password -dir "R6Downloads\Y3S4_Wind_Bastion" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Russian Lang on Wind Bastion
  goto MainMenu
  )
  if %version%==14 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377236 -manifest 5305534200661405563 -username %username% -remember-password -dir "R6Downloads\Y4S1_Burnt_Horizon" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Russian Lang on Burnt Horizon
  goto MainMenu
  )
  if %version%==141 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377236 -manifest 5305534200661405563 -username %username% -remember-password -dir "R6Downloads\Y4S1_BurntHorizon" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Russian Lang on Burnt Horizon (Zer0)
  goto MainMenu
  )
  if %version%==15 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377236 -manifest 8063779007427415388 -username %username% -remember-password -dir "R6Downloads\Y4S2_Phantom_Sight" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Russian Lang on Phantom Sight 
  goto MainMenu
  )
  if %version%==16 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377236 -manifest 4195459193643803058 -username %username% -remember-password -dir "R6Downloads\Y4S3_Ember_Rise" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Russian Lang on Ember Rise 
  goto MainMenu
  )
  if %version%==161 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377236 -manifest 4195459193643803058 -username %username% -remember-password -dir "R6Downloads\Y4S3_EmberRise" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Russian Lang on Ember Rise (Zer0)
  goto MainMenu
  )
  if %version%==17 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377236 -manifest 2337212093593824035 -username %username% -remember-password -dir "R6Downloads\Y4S4_Shifting_Tides" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Russian Lang on Shifting Tides 
  goto MainMenu
  )
  if %version%==18 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377236 -manifest 3817096039931934373 -username %username% -remember-password -dir "R6Downloads\Y5S1_Void_Edge" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Russian Lang on Void Edge 
  goto MainMenu
  )
  if %version%==181 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377236 -manifest 3817096039931934373 -username %username% -remember-password -dir "R6Downloads\Y5S1_VoidEdge" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Russian Lang on Void Edge (Zer0)
  goto MainMenu
  )
  if %version%==19 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377236 -manifest 3790966697198053253 -username %username% -remember-password -dir "R6Downloads\Y5S2_Steel_Wave" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Russian Lang on Steel Wave 
  goto MainMenu
  )
  if %version%==191 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377236 -manifest 3790966697198053253 -username %username% -remember-password -dir "R6Downloads\Y5S2_SteelWave" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Russian Lang on Steel Wave (Zer0)
  goto MainMenu
  )
  if %version%==20 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377236 -manifest 5914186776656034602 -username %username% -remember-password -dir "R6Downloads\Y5S3_Shadow_Legacy" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Russian Lang on Shadow Legacy
  goto MainMenu
  )
  if %version%==21 (
  dotnet Resources\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377236 -manifest %manifest% -username %username% -remember-password -dir "R6Downloads\Placeholder" -validate -max-servers 15 -max-downloads 10
  pause
  cls
  echo Download complete!
  echo It's Russian Lang on Placeholder
  goto MainMenu
  )
  goto Extra
::Russian END
::LANG END
