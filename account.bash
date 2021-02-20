#!/bin/bash

# load the account saved in the general into the ACCOUNT variable
load_account(){
	ACCOUNT="$(get_value_from_file "current player" "general.txt")"
}

# manage accounts
#	variables are dependant on action
manage_account(){
	if [ $# -lt 3 ]; then
		echo "Expected at least 3 aguments for $2 got $#"
		return
	fi
	if [ "$2" == "new" ]; then
		new_account "$3"
	elif [ "$2" == "switch" ]; then
		switch_account "$3"
	elif [ "$2" == "stats" ]; then
		account_stats "$3"
	else
		echo "No action for $2."
	fi
}

# create a new account given a name. If the name already exists aboard
#	1. the name of the account
new_account(){
	if [ -d "${BIN}$1" ]; then
		echo "Account $1 already exists. Cannot create account."
		return
	fi
	if mkdir -p "${BIN}$1" ; then
		touch "${BIN}$1/inventory.txt"
		echo -e "fishing = 0\nwoodcuting = 0\nmineing = 0" >> "${BIN}$1/levels.txt"
		echo -e "last time stamp = $(date +%s)\nlast task = \nlocation task = " >> "${BIN}$1/general.txt"
		echo "Succesfully created account $1"
	else
		echo "Account creation failed. No writing permission?"
	fi
}

# Switch to an account given a name. If no account exists aboard
#	1. the name of the account
switch_account(){
	if [ -d "${BIN}$1" ]; then
		set_value_in_file "current player" "${ACCOUNT}" "$1" "general.txt"
		echo "switched to account $1."
	else
		echo "No player named $1."
	fi
}

# Stats for an account 
account_stats(){
	echo "Still working on it :)"
}
