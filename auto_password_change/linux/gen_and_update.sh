#! /usr/bin/bash

# Input: name of user whose password is being changed

# Big help from, and thank you to, https://stackoverflow.com/a/48837435 & https://stackoverflow.com/a/1195035
counter=0
characters="abcdefghijklmnopqrstuvwxyz0123456789#$^&*!@"
password=""
while [ $counter -lt 16 ]
do
	character="${characters:$(( $RANDOM % ${#characters} )):1}"
	password="${password}${character}"
	counter=$(( $counter + 1 ))
done

# Set the passwords for the user passed into the script
echo "${password}
${password}" | sudo passwd $1 &>/dev/null
if [ $? -eq 0 ]; then
	echo "$1"$'\t'"${password}"
else
	echo "Failed to update password for $1"
fi
