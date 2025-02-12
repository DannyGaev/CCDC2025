#! /usr/bin/bash

# Check if the script is being run as root
if [ "$EUID" -ne 0 ]; then
  echo "This script must be run as root."
  exit 1
fi

# Step through all users on the system
getent passwd | while IFS=: read -r name password uid gid gecos home shell; do
	# If the user's uid is greater than 1000 (or are root) and they are not promon, change their password
	if [[ ( "$uid" -ge 1000 || "$name" == "root" ) && ( "$name" != "promon" && "$name" != "nobody" ) ]]; then
		./gen_and_update.sh $name
	fi
done
