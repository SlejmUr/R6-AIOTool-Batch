@echo off
chcp 65001
setlocal enableextensions enabledelayedexpansion
set homepath=%cd%


MODE 78,20
echo ------------------------------------------------------------------------------
echo                              Downloading AllInOne Tools...
echo ------------------------------------------------------------------------------
curl -L  "https://github.com/SlejmUr/OldR6S/raw/master/Release/V1.1/R6AllInOne.bat" --output AllInOneTools.bat
move AllInOneTools.bat ..
cls
