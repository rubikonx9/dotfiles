#!/usr/bin/zsh
# Basic zsh and oh-my-zsh config

export ZSH=${HOME}/.oh-my-zsh

export ZSH_THEME="agnoster"
export HYPHEN_INSENSITIVE="true"
export DISABLE_AUTO_UPDATE="true"

export plugins=(git sudo)

export LC_ALL=en_GB.UTF-8

source ${ZSH}/oh-my-zsh.sh

# Aliases

alias -g ls='ls --color=always'
alias -g ll='ls -lah'
alias -g l1='ls -1'
alias -g l='l1'
alias -g df='df -h'
alias -g du='du -h'
alias -g grep='grep --color=always'
alias -g subl='subl3'
alias -g pacman='yaourt'
alias -g fname='find -name'
alias -g cpan='sudo cpan'
alias -g less='less --tabs=1,5'

alias -g π='yaourt'
alias -g π↑↑='π -Syua'
alias -g π↑='π -S'
alias -g π§='π -Ss'
alias -g π↓='π -Rsn'

alias -g ¬='sudo'

alias -g ð='git'
alias -g ðs='ð status'
alias -g ðss='ðs -s'
alias -g ðdd='ð diff'
alias -g ðd='ð diff2'
alias -g ðdn='ð diffnames'
alias -g ðdm='ðd master --'
alias -g ða='ð add'
alias -g ðaa='ð add .'
alias -g ðc='ð commit'
alias -g ðcc='ðc -m'
alias -g ðl='ð lg'
alias -g ðb='ð branch'
alias -g ð↑='ð push'
alias -g ð↑↑='ð↑ -u origin $(git branch | grep -e "^*" | cut -d" " -f 2)'
alias -g ð↓='ð pull'
alias -g ðx='ð checkout'
alias -g ðxx='ðx master'
alias -g ðr='ð reset'
alias -g ðrr='ð reset --hard'
alias -g ðm='ð merge'
alias -g ðmm='ðm master'

alias -g ↑='2>&1'
alias -g ↓='2>/dev/null'
alias -g ↓↓='1>/dev/null 2>&1'
alias -g ≈='| grep'
alias -g ≠='| grep -v'
alias -g …='| less'
alias -g ®='**/*'
alias -g ≈≈='grep ® ↓ -e'
alias -g ©='| perl -pe "s/\e\[?.*?[\@-~]//g"'
alias -g þ='| xargs'
alias -g þ1='| xargs -n1'
alias -g §='© þ subl'
alias -g →='| cat'
alias -g µ='| sort -u'
alias -g :1='| cut -d":" -f1'
alias -g :2='| cut -d":" -f2'
alias -g :3='| cut -d":" -f3'
alias -g :4='| cut -d":" -f4'
alias -g :5='| cut -d":" -f5'
alias -g :6='| cut -d":" -f6'
alias -g :7='| cut -d":" -f7'
alias -g :8='| cut -d":" -f8'
alias -g :9='| cut -d":" -f9'

# Colored man pages
function man() {
    env LESS_TERMCAP_mb=$'\E[01;31m' \
        LESS_TERMCAP_md=$'\E[01;38;5;74m' \
        LESS_TERMCAP_me=$'\E[0m' \
        LESS_TERMCAP_se=$'\E[0m' \
        LESS_TERMCAP_so=$'\E[38;5;246m' \
        LESS_TERMCAP_ue=$'\E[0m' \
        LESS_TERMCAP_us=$'\E[04;38;5;146m' \
            man "$@"
}

# Add custom completion scripts
fpath=(~/.zsh/completion $fpath)

# Compsys initialization
autoload -U compinit
compinit

# Show completion menu when number of options is at least 2
zstyle ':completion:*' menu select=2

# Sets LS_COLORS
eval $(dircolors -b)
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# Move-by-word witl ctrl + [← / →]
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

