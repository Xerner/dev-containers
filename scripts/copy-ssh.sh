TEMP_SSH_FOLDER=".devcontainer/temp/.ssh/"
rm -rf $TEMP_SSH_FOLDER
mkdir $TEMP_SSH_FOLDER
cp ~/.ssh/* $TEMP_SSH_FOLDER
echo -e "${COLOR_LIGHT_GREEN}copied SSH settings to $TEMP_SSH_FOLDER${COLOR_NC}"
