#!/bin/bash

#FILE MANINPULATIONS

# get a value from a file and save into file_value
#	1. value name
#	2. name of file
get_value_from_file(){
	local file_value
	if ! grep -q "^$1" "${BIN}$2"; then
		file_value=""
	else
		local sed_line="s/^${1} = //"
		file_value="$(grep "^$1 = " ${BIN}"$2" | sed "$sed_line")"
	fi
	echo "$file_value"
}

# set a value in a file
#	1. value name
#	2. original_value
#	3. new_value
#	4. name of file
set_value_in_file(){
	local sed_line="s/^${1} = ${2}/${1} = ${3}/"
	sed -i "$sed_line" "${BIN}$4"
}

# add a value to the end of a file
#	1. the value
# 	2. name of file
add_value_in_file(){
	echo "$1" >> "${BIN}$2"
}

# add an item with a quantity to the inventory file
#	1. the item name
#	2. the item quantity (can be negative)
add_item_in_inventory(){
	local item="$(get_value_from_file "$1" "${ACCOUNT}/inventory.txt")"
	if [ -z "$item" ]; then
		local entry="$1 = $2"
		add_value_in_file "$entry" "${ACCOUNT}/inventory.txt"
	else
		set_value_in_file "$1" "$item" $(($(("$item"+0))+$(("$2"+0)))) "${ACCOUNT}/inventory.txt"
	fi
}


#UTILITY

# convert seconds into days hours minutes seconds --> https://stackoverflow.com/questions/12199631/convert-seconds-to-hours-minutes-seconds
#	1. time in seconds

function get_elapsed_time() {
    num=$1
    min=0
    hour=0
    day=0
    if((num>59));then
        ((sec=num%60))
        ((num=num/60))
        if((num>59));then
            ((min=num%60))
            ((num=num/60))
            if((num>23));then
                ((hour=num%24))
                ((day=num/24))
            else
                ((hour=num))
            fi
        else
            ((min=num))
        fi
    else
        ((sec=num))
    fi
    echo "${day}d ${hour}h ${min}m ${sec}s"
}
