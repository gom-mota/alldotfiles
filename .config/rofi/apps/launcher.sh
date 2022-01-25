#!/usr/bin/env bash

theme="style"
dir="$HOME/.config/rofi/apps"

function getColor {
	color_name=$1
	echo $(xrdb -query | grep *."$color_name:"| awk '{printf "%s", $NF}')
}

ALPHA="#00000000"
BG=`getColor rofi-bg`
FG=`getColor foreground`
SELECT=`getColor rofi-select-normal`
ACCENT=`getColor rofi-select-normal`

# overwrite colors file
cat > $dir/colors.rasi <<- EOF
	/* colors */

	* {
	  al:  $ALPHA;
	  bg:  $BG;
	  se:  $SELECT;
	  fg:  $FG;
	  ac:  $ACCENT;
	}
EOF


rofi -no-lazy-grab -show drun -modi drun -theme $dir/"$theme"
