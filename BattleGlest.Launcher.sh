#!/bin/sh

if [ "$TERM"'x' = 'xtermx' ]; then xterm -T 'BattleGlest' -n 'BattleGlest'; fi
thisversion="`cat version.txt`"
thisbuild="`cat subversion.txt`"
# :checkUpdates
while true
do
  echo 'BattleGlest v.'"$thisversion"'-'"$thisbuild"
  if [ "$TERM"'x' = 'xtermx' ]; then xterm -T 'BattleGlest v.'"$thisversion"'-'"$thisbuild" -n 'BattleGlest v.'"$thisversion"'-'"$thisbuild"; fi

  echo 'http://www.muwum-lexicons.de/bg/version.php?v='"$thisversion"'-'"$thisbuild" >url.txt
  rm -f version.php
  wget -o /dev/null -i url.txt -O version.php

  dlfile="`cat version.php`"
  rm -f version.php
  rm -f url.txt
  if [ "$dlfile"'x' = 'truex' ]
  then 
    # :startGame
    echo 'Version is up to date'
    ./megaglest --load-mod=\$APPLICATIONPATH/mods/battleglest
    exit
  else
    wget -o /dev/null 'http://www.muwum-lexicons.de/bg/'"$dlfile"
    7z x "$dlfile" -aoa
  fi

# goto checkUpdates
done