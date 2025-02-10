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

echo "...setting password for $1 to ${password}"
# Set the passwords for the user passed into the script
echo "${password}
${password}" | sudo passwd $1

