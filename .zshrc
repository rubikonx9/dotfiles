#!/usr/bin/zsh

export GITHUB_DIR="${HOME}/github/"

# Theme settings - ${ZSH}/custom/themes/bullet-train.zsh-theme
export ZSH_THEME="bullet-train"

export BULLETTRAIN_STATUS_EXIT_SHOW=true
export BULLETTRAIN_PROMPT_ORDER=(
  time
  status
  context
  dir
  screen
  git
  cmd_exec_time
)

# Base16 color scheme
BASE16_DIR="${GITHUB_DIR}/base16-shell/"
[ -n "${PS1}" ] && [ -s "${BASE16_DIR}/profile_helper.sh" ] && eval "$("${BASE16_DIR}/profile_helper.sh")"

# zsh plugins
plugins=(
  npm
  sudo
  colored-man-pages
  colorize
  globalias
)

# Path to your oh-my-zsh installation
export ZSH=${HOME}/.oh-my-zsh

# Startup
source ${ZSH}/oh-my-zsh.sh
source ${ZSH}/custom/manjaro-settings.zsh

# Plugins
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Other settings
export HISTSIZE=1000000
export SAVEHIST=1000000

# Aliases

alias -g ls='ls --color=auto'
alias -g ll='ls -lah'
alias -g df='df -h'
alias -g du='du -h'
alias -g grep='grep --color=auto'
alias -g fname='find -name'
alias -g less='less --tabs=1,5'

alias -g ð='git'
alias -g ðs='ð status'
alias -g ðss='ðs -s'
alias -g ðdd='ð diff'
alias -g ðd='ð diff2'
alias -g ðdn='ð diffnames'
alias -g ða='ð add'
alias -g ðc='ð commit'
alias -g ðcc='ðc -m'
alias -g ðb='ð branch'
alias -g ð↑='ð push'
alias -g ð↑↑='ð↑ -u origin $(git branch | grep -e "^*" | cut -d" " -f 2)'
alias -g ð↓='ð pull'
alias -g ðx='ð checkout'
alias -g ðr='ð reset'
alias -g ðrr='ð reset --hard'

alias -g ≈='| grep'
alias -g ≠='| grep -v'
alias -g ≈≈='find . -type f | xargs grep 2>/dev/null -e'

alias -g :1='| cut -d":" -f1'
alias -g :2='| cut -d":" -f2'
alias -g :3='| cut -d":" -f3'
alias -g :4='| cut -d":" -f4'
alias -g :5='| cut -d":" -f5'
alias -g :6='| cut -d":" -f6'
alias -g :7='| cut -d":" -f7'
alias -g :8='| cut -d":" -f8'
alias -g :9='| cut -d":" -f9'

# Functions
SSH_ENV="${HOME}/.ssh/environment"

function start_ssh_agent {
    echo "Initialising new SSH agent..."

    /usr/bin/ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"

    echo "succeeded"

    chmod 600 "${SSH_ENV}"

    source "${SSH_ENV}" > /dev/null

    /usr/bin/ssh-add
}

function start_ssh_agent_if_needed {
    if [ -f "${SSH_ENV}" ]; then
        source "${SSH_ENV}" > /dev/null

        ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
            start_ssh_agent
        }
    else
        start_ssh_agent
    fi
}

# Init

start_ssh_agent_if_needed

# Per-machine settings

if [ -f "${HOME}/.zshrc-more" ]; then
    source "${HOME}/.zshrc-more"
fi
