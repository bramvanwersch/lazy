#!/bin/bash

# SIMULATION FUCNTIONS never go above 32767 with wheights

#simulation globals
lvl_array=""
xp_array=""
wheigth_array=""

exp_gained=0
simulation_result=""


# Simulate a fish catch attempt
#	1. the area to fish in
#	2. number of seconds to simulate 
fish_lake_array=(can shrimp boot "wet mystery log" "golden shrimp" logness)
fish_lake_min_lvl=0

fish_river_array=(algea "silver bowl" trout salmon sturgeon eel)
fish_river_min_lvl=10

fish_sea_array=(lobster bottle cod octopus septopus swordfish "sea turtle")
fish_sea_min_lvl=35

fish_ocean_array=(shell "yelly fish" tuna shark "manta ray" whale)
fish_ocean_min_lvl=30

fish_deapsea_array=(toothfish viperfish anglerfish megladon treasure)
fish_deapsea_min_lvl=75

fish_locations=(lake river sea ocean deapsea)
fish(){
	local base_speed
	if [ "$1" == "help" ]; then
		echo "Fishing is a skill for collecting fish (who knew). The following locations are available:"
		all_location_help "fish"
		return
	elif [ "$1" == "lake" ]; then
		lvl_array=(0 0 3 10 20 90)
		xp_array=(1 5 1 1 15 5000)
		wheigth_array=(8000 20000 30000 32000 32500 32501)
		simulation_result=(0 0 0 0 0 0)
		base_speed=120
	elif [ "$1" == "river" ]; then
		lvl_array=(10 10 20 30 35 50)
		xp_array=(5 500 20 30 32 40)
		wheigth_array=(100 101 251 351 451 501)
		simulation_result=(0 0 0 0 0 0)
		base_speed=200
	elif [ "$1" == "sea" ]; then
		lvl_array=(35 35 45 50 60 65 65)
		xp_array=(35 15 40 50 777 70 70)
		wheigth_array=(100 200 400 450 453 503 528)
		simulation_result=(0 0 0 0 0 0 0)
		base_speed=350
	elif [ "$1" == "ocean" ]; then
		lvl_array=(45 50 60 70 80 85)
		xp_array=(10 55 65 80 100 120)
		wheigth_array=(20 40 50 55 60 62)
		simulation_result=(0 0 0 0 0 0)
		base_speed=420
	elif [ "$1" == "deapsea" ]; then
		lvl_array=(75 80 85 90 99)
		xp_array=(90 120 150 180 300)
		wheigth_array=(100 200 300 400 405)
		simulation_result=(0 0 0 0 0)
		base_speed=500
	else
		echo "There is no location $1 to fish at."
		all_location_help "fish"
		return
	fi
	
	if [ "$2" == "help" ]; then
		specific_location_help "fish" "$1"
	else
		# reduce speed based on lvl
		run_action_simulation "fishing" "$2" "$base_speed"
	fi
}

# Simulate a woodcut attempt
#	1. the area to woodcut in
#	2. number of seconds to simulate 
woodcut_forest_array=("small branch" "bark" "birdsnest" "birch log" "oak log" "ash log" "maple log" "maple sap")
woodcut_forest_min_lvl=0

woodcut_darkforest_array=("willow log" "flexible branch" "swamp goo" "bone" "black cherry tree" "rotten cherry" "cherry" "elm log")
woodcut_darkforest_min_lvl=15

woodcut_woodyhils_array=("pine log" "aspen log" "petrified wood" "large branch" "evergreen log" "resin" "rockwood log")
woodcut_woodyhils_min_lvl=40

woodcut_magicforest_array=("blue log" "red log" "magic log" "ever floating leave" "magic bark" "glow log")
woodcut_magicforest_min_lvl=70

woodcut_locations=(forest darkforest woodyhils magicforest)
woodcut(){
	local base_speed
	if [ "$1" == "help" ]; then
		echo "Woodcutting is a skill where you chop and collect wood (WAUW). The following locations are available:"
		all_location_help "woodcut"
		return
	elif [ "$1" == "forest" ]; then
		lvl_array=(0 0 0 5 10 18 25 25)
		xp_array=(1 5 7 5 10 15 20 10)
		wheigth_array=(20 30 31 51 61 66 70 72)
		simulation_result=(0 0 0 0 0 0 0 0)
		base_speed=120
	elif [ "$1" == "darkforest" ]; then
		lvl_array=(15 15 25 25 35 35 36 45)
		xp_array=(20 8 30 30 45 1 50 60)
		wheigth_array=(20 40 45 46 60 65 66 70)
		simulation_result=(0 0 0 0 0 0 0 0)
		base_speed=300
	elif [ "$1" == "woodyhils" ]; then
		lvl_array=(40 50 60 60 65 75 80)
		xp_array=(35 50 200 25 70 100 120)
		wheigth_array=(10 20 21 31 51 55 60)
		simulation_result=(0 0 0 0 0 0 0)
		base_speed=400
	elif [ "$1" == "magicforest" ]; then
		lvl_array=(70 70 80 85 90 99)
		xp_array=(100 100 120 180 250 400)
		wheigth_array=(20 40 50 51 60 70)
		simulation_result=(0 0 0 0 0 0)
		base_speed=420
	else
		echo "There is no location $1 to woodcut at."
		all_location_help "woodcut"
		return
	fi
	
	if [ "$2" == "help" ]; then
		specific_location_help "woodcut" "$1"
	else
		# reduce speed based on lvl
		run_action_simulation "woodcuting" "$2" "$base_speed"
	fi
}

# Simulate a woodcut attempt
#	1. the area to woodcut in
#	2. number of seconds to simulate 
mine_rockyplains_array=(copper pebble iron "clump of dirt" "simple geode" "jade" limestone)
mine_rockyplains_min_lvl=0

mine_hills_array=(coal rock "greater geode" marble bluerian emerald "rock moss" "dense coal")
mine_hilss_min_lvl=15

mine_quarry_array=("pine log" "aspen log" "petrified wood" "large branch" "evergreen log" "resin" "rockwood log")
mine_quarry_min_lvl=40

mine_mountains_array=("blue log" "red log" "magic log" "ever floating leave" "magic bark" "glow log")
mine_mountains_min_lvl=70

mine_caves_array=("blue log" "red log" "magic log" "ever floating leave" "magic bark" "glow log")
mine_caves_min_lvl=70

mine_locations=(rockyplains hills quarry mountains caves )
mine(){
	local base_speed
	if [ "$1" == "help" ]; then
		echo "Mining is a skill where you get them rocks. The following locations are available:"
		all_location_help "mine"
		return
	elif [ "$1" == "rockyplains" ]; then
		lvl_array=(0 0 5 5 10 15 20)
		xp_array=(5 1 7 2 15 30 15)
		wheigth_array=(20 40 50 60 65 66 75)
		simulation_result=(0 0 0 0 0 0 0)
		base_speed=200
	elif [ "$1" == "hills" ]; then
		lvl_array=(15 15 20 25 30 35 35 40)
		xp_array=(18 5 25 25 35 50 40 50)
		wheigth_array=(10 30 35 45 50 51 55 60)
		simulation_result=(0 0 0 0 0 0 0 0)
		base_speed=350
	elif [ "$1" == "quarry" ]; then
		lvl_array=(40 50 60 60 65 75 80)
		xp_array=(35 50 200 25 70 100 120)
		wheigth_array=(10 20 21 31 51 55 60)
		simulation_result=(0 0 0 0 0 0 0)
		base_speed=400
	elif [ "$1" == "mountains" ]; then
		lvl_array=(70 70 80 85 90 99)
		xp_array=(100 100 120 180 250 400)
		wheigth_array=(20 40 50 51 60 70)
		simulation_result=(0 0 0 0 0 0)
		base_speed=420
	elif [ "$1" == "caves" ]; then
		lvl_array=(70 70 80 85 90 99)
		xp_array=(100 100 120 180 250 400)
		wheigth_array=(20 40 50 51 60 70)
		simulation_result=(0 0 0 0 0 0)
		base_speed=420
	else
		echo "There is no location $1 to mine at."
		all_location_help "mine"
		return
	fi
	
	if [ "$2" == "help" ]; then
		specific_location_help "mine" "$1"
	else
		# reduce speed based on lvl
		run_action_simulation "mineing" "$2" "$base_speed"
	fi
}

# print a help message for all locations of an action
#	1. the action
all_location_help(){
	local locations_array_name="${1}_locations"
	local loc_array="$locations_array_name[@]"
	local loc_array=("${!loc_array}")
	for loc in "${loc_array[@]}"; do
		local min_location_name="${1}_${loc}_min_lvl"
		local min_lvl="${!min_location_name}"
		echo " -${loc} from lvl $min_lvl"
	done
	echo "For detailed information of a location type 'lazy ${1} location_name help'"
}

#print a help for a specific location
#	1. the action of the location
#	2. the location
specific_location_help(){
	local array_name="${1}_${2}_array"
	local array="$array_name[@]"
	local array=("${!array}")
	
	local total_wheigth="${wheigth_array[${#wheigth_array[@]} - 1]}"
	local prev_wheigth=0
	local cur_wheigth=0
	local perc_chance=0
	
	echo "Resources gatherable at $2:"
	local index=0
	for resource in "${array[@]}"; do
		let cur_wheigth="${wheigth_array[index]}-${prev_wheigth}"
		prev_wheigth="${wheigth_array[index]}"
		perc_chance="$(echo "scale=4; (${cur_wheigth} / ${total_wheigth}) * 100" | bc)"
		echo " - ${resource}: (${perc_chance}% chance) gatherable from level ${lvl_array[index]} giving ${xp_array[index]}xp"
		((index++))
	done
}

# Run the simulation for a certain action. This function relies on the action setting some globals first.
#	1. the skill name of the action
#	2. repetition of the action
#	3. base likelyhood to sucesfully perform an action
# results are stored in exp_gained and simulation_result
run_action_simulation(){
	local starting_exp="$(get_value_from_file "$1" "${ACCOUNT}/levels.txt")"
	local level="$(exp_to_lvl $(($starting_exp+$exp_gained)))"
	local base_speed=$(($3+0))
	local speed=$(($base_speed - $level * 2))

	local seconds=$(($2+0))

	while [ $seconds -gt 0 ]
	do
		local catch_roll=$((1 + RANDOM % $speed))
		if  [ "$catch_roll" -eq 1 ]; then
			local level="$(exp_to_lvl $(($starting_exp+$exp_gained)))"
			speed=$(($base_speed - $level))
			if [ $speed -lt 10 ]; then
				speed=10
			fi
			max_index="$(get_max_arry_index "$level" "${lvl_array[@]}")"
			
			wheighted_index="$(wheighted_roll "${wheigth_array[$max_index]}" "${wheigth_array[@]}")"
			local random_number=$((1 + RANDOM % $(("${wheigth_array[$max_index]}"))))
			((simulation_result[wheighted_index]++))
			exp_gained=$((exp_gained+xp_array[wheighted_index]))
		fi
		((seconds--))
	done
}
