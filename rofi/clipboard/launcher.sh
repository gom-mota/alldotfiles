#!/usr/bin/env bash

DIR="$HOME/.config/rofi/clipboard"

function getColor {
	color_name=$1
	echo $(xrdb -query | grep *."$color_name:"| awk '{printf "%s", $NF}')
}

ALPHA="#00000000"
BG=`getColor rofi-bg`
FG=`getColor foreground`
SELECT=`getColor rofi-select-normal`
ACCENT=`getColor accent`

# overwrite colors file
cat > $DIR/colors.rasi <<- EOF
	/* colors */

	* {
	  al:  $ALPHA;
	  bg:  $BG;
	  se:  $SELECT;
	  fg:  $FG;
	  ac:  $ACCENT;
	}
EOF


CM_LAUNCHER=rofi clipmenu -no-lazy-grab -show drun -modi run,drun,window -theme ~/.config/rofi/clipboard/"style"
