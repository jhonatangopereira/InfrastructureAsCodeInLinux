#!/bin/bash

# Default password used to assign password in new users
DEFAULT_PASSWORD="123456"

echo "Creating system users..."

# Creating system users in for loop
for user in guest10 guest11 guest12; do
	useradd $user -c "Guest user" -s /bin/bash -m -p $(openssl passwd $DEFAULT_PASSWORD)
	passwd $user -e
	echo "Created user guest$i!"
done

echo "Done! All users have been created."

