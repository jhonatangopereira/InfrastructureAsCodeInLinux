#!/bin/bash

DEFAULT_PASSWORD="123456"

echo "Creating system users..."

for user in guest10 guest11 guest12; do
	useradd $user -c "Guest user" -s /bin/bash -m -p $(openssl passwd $DEFAULT_PASSWORD)
	passwd $user -e
	echo "Created user guest$i!"
done

echo "Done! All users have been created."

