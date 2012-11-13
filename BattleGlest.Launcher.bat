@echo off
title BattleGlest
:checkUpdates
rem set /p thisversion=<version.txt
rem set /p thisbuild=<subversion.txt
rem echo "BattleGlest v.%thisversion%-%thisbuild%"
rem title BattleGlest v.%thisversion%-%thisbuild%
rem echo http://www.muwum-lexicons.de/bg/version.php?v=%thisversion%-%thisbuild% >url.txt
rem del version.php
rem wget -o nul -i url.txt -O version.php

rem set /p dlfile=<version.php
rem del version.php
rem del url.txt
rem if "%dlfile%" == "true" goto startGame
rem wget -o nul http://www.muwum-lexicons.de/bg/%dlfile%
rem 7z x %dlfile% -aoa

rem goto checkUpdates
:startGame
echo "Version is up to date"
megaglest --load-mod=$APPLICATIONPATH/mods/battleglest
exit