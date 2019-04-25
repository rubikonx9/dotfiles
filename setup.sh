#!/bin/bash

if [ -z "${GITHUB_DIR=}" ]; then
    GITHUB_DIR="${HOME}/github/";
fi

function add_sublime_repo() {
    echo "Adding Sublime Text repository to pacman..."

    if grep "^\[sublime-text\]$" /etc/pacman.conf >/dev/null; then
        echo "Sublime Text repository already present"
    else
        curl -O https://download.sublimetext.com/sublimehq-pub.gpg && sudo pacman-key --add sublimehq-pub.gpg && sudo pacman-key --lsign-key 8A8F901A && rm sublimehq-pub.gpg

        echo -e "\n[sublime-text]\nServer = https://download.sublimetext.com/arch/stable/x86_64" | sudo tee -a /etc/pacman.conf

        echo "Synchronizing repositories..."

        sudo pacman -Sy
    fi
}

function install_pkgs_from_repo() {
    PKGS=(
        arandr
        compton
        diff-so-fancy
        dunst
        feh
        git
        i3-gaps
        icdiff
        light
        neovim
        nerd-fonts-complete
        nitrogen
        papirus-icon-theme
        polybar
        powerline-fonts
        rofi
        sublime-merge
        sublime-text
        termite
        ttf-fira-code
        ttf-font-awesome
        xautolock
        zsh
        zsh-autosuggestions
        zsh-completions
        zsh-syntax-highlighting
    )

    echo "Installing packages..."

    yay -S ${PKGS[*]}
}

function clone_git_repos() {
    GIT_REPOS=(
        https://github.com/0xdec/base16-rofi
        https://github.com/caiogondim/bullet-train.zsh
        https://github.com/chriskempson/base16-shell
        https://github.com/chriskempson/base16-vim
        https://github.com/chriskempson/base16-xresources
        https://github.com/khamer/base16-dunst
        https://github.com/khamer/base16-termite
        https://github.com/robbyrussell/oh-my-zsh
        https://github.com/rubikonx9/pa-vol
        https://github.com/ShikherVerma/i3lock-multimonitor
    )

    echo "Cloning git repositories..."

    for GIT_REPO in ${GIT_REPOS[*]}; do
        git clone "$GIT_REPO"
    done
}

function create_local_dirs() {
    echo "Creating directories..."

    cd "${GITHUB_DIR}"

    install --directory "${GITHUB_DIR}"
    install --directory "${HOME}/.config/"
    install --directory "${HOME}/.config/dunst/"
    install --directory "${HOME}/.config/i3/"
    install --directory "${HOME}/.config/polybar/"
    install --directory "${HOME}/.config/rofi/"
    install --directory "${HOME}/.config/sublime-merge/Packages/User/"
    install --directory "${HOME}/.config/sublime-text-3/Packages/User/"
    install --directory "${HOME}/.config/termite/"
    install --directory "${HOME}/.local/bin/"

    cd -
}

function make_symlinks() {
    echo "Creating symlinks..."

    ln --symbolic --force "${GITHUB_DIR}/dotfiles/.config/compton.conf" \
                          "${HOME}/.config/compton.conf"

    ln --symbolic --force "${GITHUB_DIR}/dotfiles/.config/dunst/dunstrc" \
                          "${HOME}/.config/dunst/dunstrc"

    ln --symbolic --force "${GITHUB_DIR}/dotfiles/.config/i3/config" \
                          "${HOME}/.config/i3/config"

    ln --symbolic --force "${GITHUB_DIR}/dotfiles/.config/polybar/config" \
                          "${HOME}/.config/polybar/config"

    ln --symbolic --force "${GITHUB_DIR}/dotfiles/.config/rofi/config" \
                          "${HOME}/.config/rofi/config"

    ln --symbolic --force "${GITHUB_DIR}/dotfiles/.config/sublime-merge/Packages/User/Preferences.sublime-settings" \
                          "${HOME}/.config/sublime-merge/Packages/User/Preferences.sublime-settings"

    ln --symbolic --force "${GITHUB_DIR}/dotfiles/.config/sublime-text-3/Packages/User/Preferences.sublime-settings" \
                          "${HOME}/.config/sublime-text-3/Packages/User/Preferences.sublime-settings"

    ln --symbolic --force "${GITHUB_DIR}/dotfiles/.config/termite/config" \
                          "${HOME}/.config/termite/config"

    ln --symbolic --force "${GITHUB_DIR}/dotfiles/.local/bin/i3lock-multimonitor-wrapper.sh" \
                          "${HOME}/.local/bin/i3lock-multimonitor-wrapper"

    ln --symbolic --force "${GITHUB_DIR}/dotfiles/.local/bin/monitors.sh" \
                          "${HOME}/.local/bin/monitors"

    ln --symbolic --force "${GITHUB_DIR}/dotfiles/.local/bin/polybar-launch.sh" \
                          "${HOME}/.local/bin/polybar-launch"

    ln --symbolic --force "${GITHUB_DIR}/dotfiles/.local/bin/rofi-exit-i3.sh" \
                          "${HOME}/.local/bin/rofi-exit-i3"

    ln --symbolic --force "${GITHUB_DIR}/dotfiles/.local/bin/rofi-power.sh" \
                          "${HOME}/.local/bin/rofi-power"

    ln --symbolic --force "${GITHUB_DIR}/dotfiles/.local/bin/setup-monitors.sh" \
                          "${HOME}/.local/bin/setup-monitors"

    ln --symbolic --force "${GITHUB_DIR}/dotfiles/.gitconfig" \
                          "${HOME}/.gitconfig"

    ln --symbolic --force "${GITHUB_DIR}/dotfiles/.xinitrc" \
                          "${HOME}/.xinitrc"

    ln --symbolic --force "${GITHUB_DIR}/dotfiles/.vimrc" \
                          "${HOME}/.vimrc"

    ln --symbolic --force "${GITHUB_DIR}/dotfiles/.Xresources" \
                          "${HOME}/.Xresources"

    ln --symbolic --force "${GITHUB_DIR}/dotfiles/.zshrc" \
                          "${HOME}/.zshrc"
}

add_sublime_repo
# install_pkgs_from_repo
create_local_dirs
# clone_git_repos
make_symlinks

echo "Done!"
