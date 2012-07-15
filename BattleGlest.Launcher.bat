@echo off
title BattleGlest
:checkUpdates
set /p thisversion=<version.txt
set /p thisbuild=<subversion.txt
echo "BattleGlest v.%thisversion%-%thisbuild%"
title BattleGlest v.%thisversion%-%thisbuild%
echo http://www.muwum-lexicons.de/bg/version.php?v=%thisversion%-%thisbuild% >url.txt
del version.php
wget -o nul -i url.txt -O version.php

set /p dlfile=<version.php
del version.php
del url.txt
if "%dlfile%" == "true" goto startGame
wget -o nul http://www.muwum-lexicons.de/bg/%dlfile%
7z x %dlfile% -aoa

goto checkUpdates
:startGame
echo "Version is up to date"
megaglest --load-mod=$APPLICATIONPATH/mods/battleglest
exit