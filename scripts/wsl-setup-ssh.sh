#!/bin/bash

if [[ ! -e /mnt/c ]]; then
  echo "no C drive was detected at /mnt/c/. this shell is not in WSL. this script is only intended to run in WSL. exiting"
  exit 1
fi

WSL_USER=$(whoami)
CONTAINER_USER="root"
USAGE="usage: wsl-setup-ssh.sh [--wsl-user STRING]

WARNING: runs sudo

Copies the windows ~/.ssh folder to wsl at ~/.ssh and sets the chown of each file to '$CONTAINER_USER'. 
File permissions probably need to be checked manually

  -u, --wsl-user        STRING    Defaults to $WSL_USER. The user to use when copying the .ssh folder
  -cu, --container-user STRING    Defaults to $CONTAINER_USER. The user to set key permissions to
  -h, --help                      Show this help
"
POSITIONAL_ARGS=()
while [[ $# -gt 0 ]]; do
  case $1 in
    -u|--wsl-user)
      WSL_USER=$2
      shift # past argument
      shift # past value
      ;;
    -h|--help)
      printf "$USAGE"
      exit 0
      ;;
    -*|--*)
      echo "Unknown option $1"
      exit 1
      ;;
    *)
      POSITIONAL_ARGS+=("$1") # save positional arg
      shift # past argument
      ;;
  esac
done
set -- "${POSITIONAL_ARGS[@]}" # restore positional parameters

if [[ -z $WSL_USER ]]; then
  echo -e "invalid arguments\n\wsl user: ${WSL_USER}\n\n$USAGE"
  exit 1
fi

cp -r /mnt/c/users/$WSL_USER/.ssh ~/.ssh
sudo find ~/.ssh -maxdepth 1 -type f -exec chown root {} \;
sudo chown ~/.ssh root
find ~/.ssh -maxdepth 1 -type f -exec chmod 600 {} \;
find ~/.ssh/known_hosts -type f -exec chmod 644 {} \;
find ~/.ssh/*.pub -type       f -exec chmod 644 {} \;
chmod ~/.ssh 0700
