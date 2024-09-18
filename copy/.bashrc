source ~/colors.sh
source ~/.bash_git
source ~/bash_prompt.sh
source ~/add-ssh-from-env.sh
source ~/add-git-info-from-env.sh

PATH="${HOME}/.bin:${PATH}"

WELCOME_INFO="
██     ██ ███████ ██       ██████  ██████  ███    ███ ███████
██     ██ ██      ██      ██      ██    ██ ████  ████ ██     
██  █  ██ █████   ██      ██      ██    ██ ██ ████ ██ █████  
██ ███ ██ ██      ██      ██      ██    ██ ██  ██  ██ ██     
 ███ ███  ███████ ███████  ██████  ██████  ██      ██ ███████

to the container
${COLOR_YELLOW}
Git
-------------------------------------------------
Username:    $GIT_USER
Email:       $GIT_EMAIL
${COLOR_LIGHT_CYAN}
SSH
-------------------------------------------------
Key name:    ${SSH_KEYNAME}
Host:        ${SSH_HOSTNAME}
Public key:  ${SSH_PUBLIC}
${COLOR_NC}
to see this info again, printf \"\$WELCOME_INFO\"
"

printf "$WELCOME_INFO"
