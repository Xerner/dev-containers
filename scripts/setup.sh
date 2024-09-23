source .devcontainer/home/bash/colors.sh

# temp dir
rm -rf .devcontainer/temp
mkdir .devcontainer/temp

#region .env file

NL=$'\n'
echo "Setting up environment variables"

# git credentials
GIT_USER="$(git config --global user.name)"
GIT_EMAIL="$(git config --global user.email)"

# .env contents
envString="GIT_USER=$GIT_USER${NL}GIT_EMAIL=$GIT_EMAIL${NL}"
# writing env file to temp directory
echo -e "Writing variables to ${COLOR_LIGHT_PURPLE}$envPath${COLOR_NC}"
envPath=".devcontainer/temp/.env"
rm -f $envPath
touch $envPath
echo "$envString" > "$envPath"
echo -e "${COLOR_LIGHT_GREEN}Wrote variables to ${COLOR_LIGHT_PURPLE}$envPath${COLOR_NC}"
echo -e "${COLOR_LIGHT_CYAN}$envString${COLOR_NC}"

#endregion
