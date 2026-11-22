#!/bin/sh
# HELP: ContinueBox TVBox online preview
# GRID: ContinueBox
. /opt/muos/script/var/func.sh
SETUP_APP "continuebox" ""
app_dir="/run/muos/storage/application/ContinueBox"
cd "$app_dir" || exit 1
exec ./continuebox /mnt/mmc/continuebox-tvbox.txt
