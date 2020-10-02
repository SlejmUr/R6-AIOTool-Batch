@echo off
setlocal enableextensions enabledelayedexpansion
set homepath=%cd%

MODE 78,20
echo ------------------------------------------------------------------------------
echo                              Downloading AllInOne Tools...
echo ------------------------------------------------------------------------------
curl -L  "https://github.com/SlejmUr/R6-AIOTool/raw/master/Release/V1.2/AllInOneTools.bat" --output AllInOneTools.bat
move AllInOneTools.bat ..
cls
exit
