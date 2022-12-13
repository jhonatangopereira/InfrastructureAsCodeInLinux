#!/bin/bash

echo "Script initialized."

# Adding groups.
groupadd GRP_ADM
groupadd GRP_VEN
groupadd GRP_SEC

# Arrays to store users to each group.
users_adm=("lis" "tamires" "paulina")
users_ven=("louie" "alcione" "sophia")
users_sec=("dante" "mayara" "jhonatan")

# Default password constant.
DEFAULT_PASSWORD="123"

# Creating users and distributing in their respective groups.
for username in ${users_adm[@]}; do
	useradd $username -s /bin/bash -G GRP_ADM -p $(openssl passwd $DEFAULT_PASSWORD)
	passwd $username -e
	echo "User $username created."
done

for username in ${users_ven[@]}; do
	useradd $username -s /bin/bash -G GRP_VEN -p $(openssl passwd $DEFAULT_PASSWORD)
	passwd $username -e
	echo "User $username created."
done

for username in ${users_sec[@]}; do
	useradd $username -s /bin/bash -G GRP_SEC -p $(openssl passwd $DEFAULT_PASSWORD)
	passwd $username -e
	echo "User $username created."
done

# Creating folders and giving permissions to each group.
mkdir /public/ --mode=777
mkdir /adm/ --mode=770
mkdir /ven/ --mode=770
mkdir /sec/ --mode=770

chown root:GRP_ADM /adm/
chown root:GRP_VEN /ven/
chown root:GRP_SEC /sec/

echo "All users, groups and directories have been created!"
