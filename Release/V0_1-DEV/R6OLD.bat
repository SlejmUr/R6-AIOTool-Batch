@echo off
chcp 65001
setlocal enableextensions enabledelayedexpansion
set homepath=%cd%

goto mmload
::7zip start
:move7
move 7z.exe Requirements
goto 7zipcheck

:7zipcheck
MODE 62,50
if exist "Requirements\7z.exe" (
  goto mainmenu
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




:mmload
goto 7zipcheck
:mainmenu
cls
Title R6S Version Depot Downloader #HUN
MODE 100,20
echo -----------------------------------------------------------
echo Rainbow Six Siege Régi Verziók Letöltője
echo Steamen meg KELL lennie az R6:S-en!
echo Hozzáadva az összes Season!
echo -----------------------------------------------------------
echo Mit szeretnél letölteni?
echo 0 = Depot Downloader 
echo 1 = Megnézni melyik Season mennyi helyet foglal
echo 2 = Magát a játékot
echo 3 = Extra nyelvet (Orosz például) - Nem működik még
echo 4 = 4K Textúrát - Nem működik még
echo 5 = FAQ
echo 6 = DirectX + VC Redist Letöltése
echo -----------------------------------------------------------
set /p option="Írd be a választásod:"

if %option%==0 (
cls
goto menudepot
)
if %option%==1 (
cls
goto Seasonsize
)
if %option%==2 (
cls
goto DownloadMenu
)
if %option%==3 (
cls
goto Extra
)
if %option%==4 (
cls
goto 4KTextures
)
if %option%==5 (
cls
goto faq
)
if %option%==6 (
cls
goto dxvcredist
)
goto mainmenu


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
  goto DownloadMenu 
) else (
  goto DepotDownloader
)


:menudepot
goto DepotCheck

:Seasonsize
Title Rainbow Six Siege Version Size
MODE 46,30
echo Jelenleg ennyit teszteltem:
  echo ---------------------------------------
  echo          [Y1S0_Vanilla] 14,2 GB
  echo          [Y1S1_Black_Ice] 16,7 GB
  echo          [Y1S2_Dust_Line] 20,9 GB
  echo          [Y1S3_Skull_Rain] 25.1 GB
  echo          [Y1S4_Red_Crow] 28,5 GB
  echo          [Y2S1_Velvet_Shell] 33,2 GB 
  echo          [Y2S2_Health] 34 GB
  echo          [Y2S3_Blood_Orchid] 34,3 GB
  echo          [Y2S4_White_Noise]
  echo          [Y3S1_Chimera] 58,8 GB
  echo          [Y3S2_Para_Bellum]
  echo          [Y3S3_Grim_Sky]
  echo          [Y4S1_Burnt_Horizon]
  echo          [Y4S2_Phantom_Sight]
  echo          [Y4S3_Ember_Rise]
  echo          [Y4S4_Shifting_Tides]
  echo          [Y5S1_Void_Edge] 74,3 GB
  echo          [Y5S2_Steel_Wave] 81,3 GB
  echo ---------------------------------------
pause
cls
goto mainmenu



:dxvcredist
Title DirectX + VC Redist Downloader
MODE 40,10
echo Melyik akarod letölteni?
echo - 0 : Vissza
echo - 1 : DirectX
echo - 10 : VC 2010 Redist	
echo - 12 : VC 2012 Redist	
echo - 15 : VC 2015 Redist	
echo - 17 : VC 2017 Redist
set /p downdxvc="Melyiket akarod:"
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
MODE 130,32
echo 1.
echo Q: Elindítom errort add ki, mit tegyek?
echo A: Találsz 2db PLAZA nevű mappát,abban lévő fájlokat másold be a régi R6:S-be (Ha az egyik nem megy, próbáld a másikat)
echo 2.
echo Q: Biztonságos ha beírom a jelszóm?
echo A: Igen ,teljes mértékben, meg is nézheted a Depot Downloader source Kódját itt: https://github.com/SteamRE/DepotDownloader
echo 3.
echo Q: Miért nem látod a jelszót amit beírok?
echo A: Mert láthatatlan, a biztoság miatt.
echo 4.
echo Q: Hol tudom megváltoztatni a nevem?
echo A: Codex.ini Fájl 28-adik sorában. Ahol látod ezt: "UsernName=CODEX"
echo 5.
echo Q: Miért Crashelek kezdő képernyőnél?
echo A: Codex.ini Fájl a 20-adik sorában a "GameName=RainbowSixSiege"-et írd át másra
echo 6.
echo Q: Miért kapok "Encountered unexpected error downloading chunk xxxxxxxxxxxx: The operation was canceled." errort?
echo A: Normális, csak hagyd figyelmen kívúl
echo 7.
echo Q: Miért blockol egyes fájlokat az Anti-Virus-om?
echo A: Ez hamis pozitív, tedd whitelist-re a fájlokat
echo (Leggyakrabban a uplay_r1_loader64.dll-t lövik ki)
echo 8.
echo Q: Elakadt a letöltésem X %-nál,mit tegyek?
echo Az utolsó öt fájl nagyobb mint a többi és lehet hogy több időbe fog telni a letöltés,kérjük legyen türelemmel.
echo A legjobb módszer hogy megtudja hogy működik e,az hogy feladatkezelőben meg nézi hogy használja e a hálózatot
echo 9.
echo Ha elakadt a játék a "preparing content"-nél akkor a Codex.ini-ben írd át az offline=1 -et offline=0 -ra
echo Ha az egyes fájlok hibásak, csak töltsd le újra
pause
cls
goto mainmenu



:DownloadMenu
cls
Title Rainbow Six Siege Version Downloader
MODE 50,35
echo Válassz melyiket akarod letölteni:
echo --------------------------------------------------
echo # 0 - Main Menu
echo # 1 - R6 Seasons Size
echo --------------------------------------------------
echo # 2 = Vanilla 1.0 (Y1S0) [First Steam Version]
echo # 3 = Black Ice (Y1S1_release)
echo # 4 = Dust Line (Y1S2_release)
echo # 5 = Skull Rain (Y1S3_release)
echo # 51 = Skull Rain (4.2)
echo # 6 = Red Crow (Y1S4_release)
echo # 7 = Velvet Shell (Y2S1_release)
echo # 8 = Health (Y2S2_release)
echo # 9 = Blood Orchid (Y2S3_release)
echo # 91 = Blood Orchid (2.3.1.1)
echo # 10 = White Noise (Y2S4_release)
echo # 11 = Chimera (Y3S1_release)
echo # 12 = Para Bellum (Y3S2_release)
echo # 13 = Grim Sky (Y3S3_release)
echo # 130 Grim Sky [3.3.0 (Mad House)]
echo # 14 = Wind Bastion (Y3S4_release)
echo # 15 = Burnt Horizon (Y3S1_release)
echo # 150 = Burnt Horizon 4.1.0 (Rainbow is Magic)
echo # 16 = Phantom Sight (Y4S2_release)
echo # 17 = Ember Rise (Y4S3_release)
echo # 18 = Shifting Tides (Y4S4_release)
echo # 19 = Void Edge (Y5S1_release)
echo # 20 = Steel Wave (Y5S2_release)
echo --------------------------------------------------
set /p version="Enter Version:"
if %version%==0 (
cls
goto mainmenu
)
if %version%==1 (
cls
goto Seasonsize
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
dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 5819137024728546741 -username %username% -remember-password -dir "Downloads\Y1S3_4.2_SkullRain" -validate -max-servers 15 -max-downloads 10
dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 5851804596427790505 -username %username% -remember-password -dir "Downloads\Y1S3_4.2_SkullRain" -validate -max-servers 15 -max-downloads 10
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
dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 6708129824495912434 -username %username% -remember-password -dir "Downloads\Y2S3_2.3.1.1_BloodOrchid" -validate -max-servers 15 -max-downloads 10
dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 1613631671988840841 -username %username% -remember-password -dir "Downloads\Y2S3_2.3.1.1_BloodOrchid" -validate -max-servers 15 -max-downloads 10
pause
cls
echo Download complete!
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
::GRIM SKY 3.3.0
if %version%==130 (
dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 3546781236735558235 -username %username% -remember-password -dir "Downloads\Y3S3_3.3.0_Grim_Sky" -validate -max-servers 15 -max-downloads 10
dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 1556527176552332195 -username %username% -remember-password -dir "Downloads\Y3S3_3.3.0_Grim_Sky" -validate -max-servers 15 -max-downloads 10
pause
cls
echo Download complete!
echo It's GRIM SKY 3.3.0
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
::BurntHorizon 4.1.0
if %version%==150 (
dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 8356277316976403078 -username %username% -remember-password -dir "Downloads\Y4S1_4.1.0_BurntHorizon" -validate -max-servers 15 -max-downloads 10
dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 5935578581006804383 -username %username% -remember-password -dir "Downloads\Y4S1_4.1.0_BurntHorizon" -validate -max-servers 15 -max-downloads 10
pause
cls
echo Download complete!
echo It's BurntHorizon 4.1.0
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
::SHIFTING TIDES Released
if %version%==18 (
dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 377237 -manifest 299124516841461614 -username %username% -remember-password -dir "Downloads\Y4S4_Shifting_Tides" -validate -max-servers 15 -max-downloads 10
dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot 359551 -manifest 1842268638395240106 -username %username% -remember-password -dir "Downloads\Y4S4_Shifting_Tides" -validate -max-servers 15 -max-downloads 10
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
goto DownloadMenu


