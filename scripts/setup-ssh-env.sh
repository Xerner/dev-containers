source .devcontainer/copy/colors.sh

if [[ -z $1 ]]; then
  SSH_KEYNAME="github"
else
  SSH_KEYNAME=$1
fi
if [[ -z $2 ]]; then
  SSH_HOSTNAME="github.com"
else
  SSH_HOSTNAME=$2
fi

echo "Setting up environment variables for Git and SSH"
GIT_USER="$(git config --global user.name)"
GIT_EMAIL="$(git config --global user.email)"

# update ssh key filename as necessary
SSH_PUBLIC="$(cat ~/.ssh/$SSH_KEYNAME.pub)"
# replace all new line characters with '\n'
# see .bashrc for how its converted back to new lines when inside the container
SSH_PRIVATE="$(sed ':a;N;$!ba;s/\n/\\n/g' ~/.ssh/$SSH_KEYNAME)"
NL=$'\n'
envString="GIT_USER=$GIT_USER${NL}GIT_EMAIL=$GIT_EMAIL${NL}SSH_KEYNAME=$SSH_KEYNAME${NL}SSH_HOSTNAME=$SSH_HOSTNAME${NL}SSH_PUBLIC=$SSH_PUBLIC${NL}SSH_PRIVATE=$SSH_PRIVATE"
envPath=".devcontainer/.env"
echo -e "Writing variables to ${COLOR_LIGHT_PURPLE}$envPath${COLOR_NC}"
echo -e "${COLOR_LIGHT_GREEN}Wrote variables to ${COLOR_LIGHT_PURPLE}$envPath${COLOR_NC}"
echo -e "${COLOR_LIGHT_CYAN}$envString${COLOR_NC}"
rm -f $envPath
touch $envPath
echo "$envString" > "$envPath"