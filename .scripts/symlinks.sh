#!/usr/bin/env bash

# variables

music="/sdcard/Music/"
download="/sdcard/Download/"
documents="/sdcard/Documents/"
pictures="/sdcard/Pictures/"




# set for logs and error exit
set -x
set -u

# change directory to home
cd $HOME

# check if /sdcard exists
if [ -d "/sdcard" ]; then
  echo "/sdcard is found on the system"
else
  echo "/sdcard doesnt exist or Termux doesnt have Storage Permissions"
  exit 0
fi


# makes directories if it doesnt exist
mkdir -p "$download"
mkdir -p "$pictures"
mkdir -p "$documents"
mkdir -p "$music"


# makes symlinks in home folder
ln -s "$download" $HOME
ln -s "$pictures" $HOME
ln -s "$documents" $HOME
ln -s "$music" $HOME

echo "symlinks successfully created"

sleep 5

clear
















