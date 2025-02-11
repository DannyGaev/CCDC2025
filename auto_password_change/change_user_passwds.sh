#! /usr/bin/bash

# Step through all users on the system
getent passwd | while IFS=: read -r name password uid gid gecos home shell; do
	# If the user's uid is greater than 1000, change their password
	if [[ "$uid" -ge 1000 || "$name" == "root" ]]; then
		./gen_and_update.sh $name
	fi
done
