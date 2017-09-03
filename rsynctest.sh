#!/bin/bash

read -p 'Username: ' uservar
#Asking for the shortname to turn it into a variable

read -e -p "Path to Source:" SOURCE_DIR
#Where should the users new home folder to be located?

read -e -p "Path to Destination Folder:" Destination_DIR
#Where is the users backed up data?

if echo "$SOURCE_DIR" | grep -q "$uservar"; then
  echo "$uservar" "&" "$SOURCE_DIR";
else
  echo "Username doesn't match";
fi

sudo rsync -EHPtrv --include 'Library/Fonts' --include 'Library/Calendars' --include 'Library/Group\ Containers' --include 'Library/Safari' --exclude 'Library/*' $target $destination

uid=$(id -u $uservar)

echo $uid

diskutil resetUserPermissions / 'id -u \$uid'
