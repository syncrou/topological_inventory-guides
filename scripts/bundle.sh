#!/bin/bash --login
#
# Script for mass bundle topology inventory plugins
# Usage: bundle-tp-inv.sh [install|update]
#
# NOTE: Edit your variables below!
source config.sh
source init-common.sh

cd $root_dir

operation=$1

if [[ "$operation" == "install" || "$operation" == "update" ]]; then
	for name in ${repositories[@]} 
	do
		echo "$name -------------------------------------------------------"
	
		cd $name
		if [ "$operation" == "update" ]; then
			bundle update
		elif [ "$operation" == "install" ]; then
			bundle install
		fi
		cd ..
	done
else
	# Print help
	echo "Usage: bundle-tp-inv.sh [install|update]"
fi
