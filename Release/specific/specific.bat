@echo off
setlocal enableextensions enabledelayedexpansion
set homepath=%cd%

Title idk
MODE 100,40
echo Please create the files.txt of specific file,and paste the name (and extensions). same that my files.txt
set /p username="Enter Steam Username:"
set /p depotID="Enter depotID:"
set /p manifestID="Enter manifestID:"

dotnet Requirements\DepotDownloader\DepotDownloader.dll -app 359550 -depot %depotID% -manifest %manifestID% -username %username% -remember-password -filelist files.txt -validate -max-servers 15 -max-downloads 10 
