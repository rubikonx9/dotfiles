#!/usr/sbin/zsh

source "${HOME}"/.environment
source "${HOME}"/.zsh-theme

export plugins=(
    sudo
)

ZSH_CACHE_DIR=$HOME/.cache/oh-my-zsh
if [[ ! -d $ZSH_CACHE_DIR ]]; then
  mkdir $ZSH_CACHE_DIR
fi

source $ZSH/oh-my-zsh.sh

if [[ ! -L '/run/user/1000/wayland-0' ]]; then
	ln -s /mnt/wslg/runtime-dir/wayland-0* /run/user/1000/
fi

source "${HOME}"/.zsh-aliases

# FZF
export FZF_DEFAULT_COMMAND='find . -type f -not -path "*/.git/*" -not -path "*/node_modules/*"'
export FZF_CTRL_R_OPTS="\
    --header='' \
"
export FZF_DEFAULT_OPTS="\
    --multi \
    --border=sharp \
    --height='40%' \
    --info=inline \
    --layout=reverse \
    --padding=1 \
    --preview-window border-sharp \
    --bind='ctrl-e:execute-silent(vim {})'
    --header='CTRL-E to edit' \
"

source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh


function install-rpm {
    rpm_pattern=$1
    host=$2
    service_pattern=$3

    if [[ "${rpm_pattern}" == "" ]]; then
        echo "No RPM selected"
        return
    fi

    if [[ "${host}" == "" ]]; then
        echo "No host selected"
        return
    fi

    services=(sem-gui sem-api nginx)

    for rpm_file in $(ls -1 "${SMAWL}"/rpm/*.rpm); do
        if [[ "${rpm_file}" == *"${rpm_pattern}"* ]]; then
            rpm_file_basename=$(basename ${rpm_file})
            echo "Installing ${rpm_file_basename} on ${host}..."

            echo "-> Copying..."
            scp "${rpm_file}" "root@${host}":/tmp/ >/dev/null 2>&1
            if [[ "$?" != "0" ]]; then echo "✘ Could not copy file"; return; fi

            echo "-> Installing..."
            ssh "root@${host}" -C "rpm -Uhv --force /tmp/${rpm_file_basename}" >/dev/null 2>&1
            if [[ "$?" != "0" ]]; then echo "✘ Could not install the rpm"; return; fi
        fi
    done

    echo "-> Restarting service(s)..."
    for service in "${services[@]}"; do
        if [[ "${service_pattern}" == "" || "${service}" == *"${service_pattern}"* ]]; then
            echo "--> ${service}..."
            ssh "root@${host}" -C "mainframectl restart ${service}" >/dev/null 2>&1
            if [[ "$?" != "0" ]]; then echo "✘ Could not restart service ${service}"; return; fi
        fi
    done

    echo "-> Cleanup..."
    ssh "root@${host}" -C "rm /tmp/${rpm_file_basename}" >/dev/null 2>&1
    if [[ "$?" != "0" ]]; then echo "✘ Could not clean up"; return; fi
}

[ -f /home/tsh/.config/cani/completions/_cani.zsh ] && source /home/tsh/.config/cani/completions/_cani.zsh

export CHPWD_ACTIVE=0

chpwd() {
    if [[ "${CHPWD_ACTIVE}" -eq "1" ]]; then
        return
    fi

    export CHPWD_ACTIVE=1

    CURRENT_DIR=$(pwd)
    ORIG_OLDPWD=${OLDPWD}

    if [[ "${CURRENT_DIR}" == *se/* ]]; then
        while [[ true ]]; do
            TMP_PWD=$(pwd)

            if [[ "${TMP_PWD}" == "/" ]]; then
                break
            fi

            if [[ -f ./profile ]]; then
                source ./profile
                break
            fi

            builtin cd ..
        done

        builtin cd "${CURRENT_DIR}"
    fi

    export OLDPWD=${ORIG_OLDPWD}
    export CHPWD_ACTIVE=0
}

start_auto_firewall() {
    if pgrep -f "run-periodically.sh" >/dev/null 2>&1; then
        # OK!
    else
        ~/auto-firewall/run-periodically.sh >> ~/auto-firewall/log 2>&1 &
        disown
    fi
}

start_auto_firewall


_fzf_complete_pass() {
    _fzf_complete --multi --reverse --prompt="pass> " -- "$@" < <(
        local prefix="${PASSWORD_STORE_DIR:-$HOME/.password-store}";

        find -L "$prefix" -type f -not -name ".gitattributes" -not -name ".gpg-id" -not -path "$prefix/.git/*" 2>/dev/null | sed -E "s|^${prefix}/||g" | sed -E 's/\.gpg$//g'
  )
}

export NODE_PATH=/usr/lib/node_modules/
export OPENAI_API_KEY=$(pass Fujitsu/Dev/AI-Api-Key | head -n1)

source /usr/share/nvm/init-nvm.sh
