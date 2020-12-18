@echo off
set username=matecraft1111
goto ExtraMenu

:BackTo
goto %Position%
:GoingTo
goto %Position%
:DownloadCheck
echo %Downloaded% >>log.log

:InstallMenu
  cls 
  exit
  ::just for not get failure

::LANG START

::ExtraMenu START
:ExtraMenu
  cls
  Title Rainbow Six Siege Extra Menu
  MODE 50,25
  echo [93m-----------------------NOTES----------------------[0m
  echo                Extra Language Menu
  echo               Placeholder
  echo [93m-----------------------SELECT---------------------[0m
  Resources\cmdmenusel f8f0 "    Extra Version" "    Extra Release" "    Extra Event" "    Back"

  if %ERRORLEVEL%==1 (
  set Position=ExtraVersion
  goto GoingTo
  )
  if %ERRORLEVEL%==2 (
  set Position=ExtraRelease
  goto GoingTo
  )
  if %ERRORLEVEL%==3 (
  set Position=ExtraEvent
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
  goto ExtraMenu
::ExtraMenu END

::ExtraEvent START
:ExtraEvent
  cls
  Title Rainbow Six Siege Extra Event
  MODE 50,25
  echo [93m-----------------------NOTES----------------------[0m
  echo             Extra Event Language Menu
  echo               Placeholder
  echo [93m-----------------------SELECT---------------------[0m
  Resources\cmdmenusel f8f0 "   Outback" "   Mad House" "   Rainbow is Magic" "   Showdown" "   Doctors Curse" "   Road To S.I. 2020" "   Gang Destruction / Golden Gun" "   M.U.T.E Protocol (Supported Omega)" "   Sugar Fright / Telly" "   Back"
  
  if %ERRORLEVEL%==1 (
  set Position=ExtraEvent
  goto GoingTo
  )
  if %ERRORLEVEL%==10 (
  set Position=ExtraMenu
  goto BackTo
  )
  goto ExtraEvent
::ExtraEvent END


::ExtraRelease START
:ExtraRelease
  cls
  Title Rainbow Six Siege Extra Release
  MODE 50,30
  echo [93m-----------------------NOTES----------------------[0m
  echo             Extra Release Language Menu
  ::echo               Placeholder - /RELEASE NOT MANIFEST/
  echo [93m-----------------------SELECT---------------------[0m
  Resources\cmdmenusel f8f0 "  Vanilla" "  Black Ice" "  Dust Line" "  Skull Rain" "  Red Crow" "  Velvet Shell" "  Health" "  Blood Orchid" "  White Noise" "  Chimera" "  Para Bellum" "  Grim Sky" "  Wind Bastion" "  Burnt Horizon" "  Phantom Sight" "  Ember Rise" "  Shifting Tides" "  Void Edge" "  Steel Wave" "  Shadow Legacy" "  Neon Dawn"  "  Back"
  
  if %ERRORLEVEL%==1 (
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
  set Position=DownloadLang
  set ExtraName=Health
  set ExtraPath=R6Downloads\Y2S2_Health
  set FrenchManifest=5499656844751782586
  set ItalianManifest=4814130789498386116
  set GermanManifest=4850286352511597480
  set SpanishManifest=7743695641492470240
  set BrasilianManifest=740877577181398044
  set PolishManifest=
  set DutchManifest=
  set CzechManifest=
  set KoreanManifest=
  set TChineseManifest=
  set SChineseManifest=
  set JapaneseManifest=6208821339116662917
  set RussianManifest=
  goto GoingTo
  )
  if %ERRORLEVEL%==8 (
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
  if %ERRORLEVEL% == 22 (
  set Position=ExtraMenu
  goto BackTo
  )
  goto Extra
::ExtraRelease END


::DownloadLang START
:DownloadLang
  cls
  Title Rainbow Six Siege %ExtraName% Lang Downloader
  MODE 50,38
  echo [93m-----------------------NOTES----------------------[0m
  echo          %ExtraName% Language Downloader
  echo               Placeholder
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
  set Downloaded=French Lang on %ExtraName%
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
  set Downloaded=Italian Lang on %ExtraName%
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
  set Downloaded=German Lang on %ExtraName%
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
  set Downloaded=Spanish Lang on %ExtraName%
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
  set Downloaded=Brasilian Lang on %ExtraName%
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
  set Downloaded=Polish Lang on %ExtraName%
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
  set Downloaded=Dutch Lang on %ExtraName%
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
  set Downloaded=Czech Lang on %ExtraName%
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
  set Downloaded=Korean Lang on %ExtraName%
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
  set Downloaded=TChinese Lang on %ExtraName%
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
    set Downloaded=SChinese Lang on %ExtraName%
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
  set Downloaded=Japanese Lang on %ExtraName%
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
  set Downloaded=Russian Lang on %ExtraName%
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
  MODE 50,20
  echo [93m-----------------------NOTES----------------------[0m
  echo          [31mNo Language for this operation[0m
  echo      Sorry , but for this operation not contain 
  echo          any language file or depot :(
  echo [93m-----------------------SELECT---------------------[0m
  Resources\cmdmenusel f8f0 "   Back"

  if %ERRORLEVEL%==1 (
  set Position=ExtraMenu
  goto BackTo
  )
  goto NoLang
::NoLang END

::LANG END
