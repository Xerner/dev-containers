SSH_FOLDER_SOURCE=~/.ssh
pwd
ls -al .devcontainer/home
echo
ls -al .devcontainer/home/.ssh
echo
SSH_FOLDER_DESTINATION=.devcontainer/home/.ssh
mkdir $SSH_FOLDER_DESTINATION
cp -rf $SSH_FOLDER_SOURCE/* $SSH_FOLDER_DESTINATION
echo -e "${COLOR_LIGHT_GREEN}copied SSH settings from ${COLOR_LIGHT_PURPLE}$SSH_FOLDER_SOURCE${COLOR_LIGHT_GREEN} to ${COLOR_LIGHT_PURPLE}$SSH_FOLDER_DESTINATION${COLOR_NC}"
