#!/usr/bin/env bash

DIR="$HOME/.config/rofi/network"

function getColor {
	color_name=$1
	echo $(xrdb -query | grep *."$color_name:"| awk '{printf "%s", $NF}')
}

ALPHA="#00000000"
BG=`getColor rofi-bg`
FG=`getColor foreground`
SELECT=`getColor rofi-select-normal`
ACCENT=`getColor accent`
ACTIVE=`getColor rofi-select-active`

# overwrite colors file
cat > $DIR/colors.rasi <<- EOF
	/* colors */

	* {
	  al:  $ALPHA;
	  bg:  $BG;
	  se:  $SELECT;
	  at:  $ACTIVE;
	  fg:  $FG;
	  ac:  $ACCENT;
	}
EOF


networkmanager_dmenu
