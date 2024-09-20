source .devcontainer/home/bash/colors.sh

# temp dir
rm -rf .devcontainer/temp
mkdir .devcontainer/temp

# .env file
echo "Setting up environment variables"
GIT_USER="$(git config --global user.name)"
GIT_EMAIL="$(git config --global user.email)"
NL=$'\n'
envString="GIT_USER=$GIT_USER${NL}GIT_EMAIL=$GIT_EMAIL${NL}"
envPath=".devcontainer/temp/.env"
echo -e "Writing variables to ${COLOR_LIGHT_PURPLE}$envPath${COLOR_NC}"
echo -e "${COLOR_LIGHT_GREEN}Wrote variables to ${COLOR_LIGHT_PURPLE}$envPath${COLOR_NC}"
echo -e "${COLOR_LIGHT_CYAN}$envString${COLOR_NC}"
rm -f $envPath
touch $envPath
echo "$envString" > "$envPath"
