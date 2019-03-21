# dotfiles
My personal dotfiles.

Specific to my `Manjaro` setup.

If no link is provided, it means it's installed from the repositories.

## ZSH

### What it does:
- Sets custom theme & `PS1` & color scheme
- Sets custom aliases
- Add some small functions

### Dependencies:
- `zsh`
- `powerline-fonts`
- [`oh-my-zsh`](https://github.com/robbyrussell/oh-my-zsh)
- [Bullet Train](https://github.com/caiogondim/bullet-train.zsh) theme
- [Base16-shell](https://github.com/chriskempson/base16-shell) color scheme
- `zsh-autosuggestions` plugin
- `zsh-syntax-highlighting` plugin

## Git

### What it does:
- Adds some aliases
- Sets some nice pagers
- Defines pull/push behavior, etc.

### Dependencies:
- `git`
- `neovim`
- `icdiff`
- `diff-so-fancy`

## Vim

Well, I'm using `neovim`, actually, but it should be mostly (?) compatible.

### What it does:
- Turns on a few settings
- Sets color scheme

### Dependencies:
- `neovim`
- [Base16-Vim](https://github.com/chriskempson/base16-vim) color scheme

## XResources

### What it does:
- Defines color scheme: [Base16-eighties](https://github.com/chriskempson/base16-xresources)
- Sets some screen settings

### Dependencies:
- `xorg`-something (?)

## Termite

### What it does:
- Sets color scheme [Base16-eighties](https://github.com/khamer/base16-termite)
- Sets fonts, cursor style, etc.

### Dependencies:
- `termite`
- `nerd-fonts-complete`

## Compton

### What it does:
- Mostly default settings
- Tweaked fading
- Tweaked GLX settings to prevent screen tearing

### Dependencies:
- `compton`

## Rofi

### What it does:
- Sets color scheme
- Defines terminal

### Dependencies:
- `rofi`
- [Base-16 themes](https://github.com/0xdec/base16-rofi)
    + Can be patched with `base16-eighties.rasi.patch` for wider margins
- `nerd-fonts-complete`

## Sublime Text 3

### What it does:

- Visual settings, mostly

### Dependencies:
- `sublime-text`
    + `Theme - Spacegray` package for theme & color scheme
- `ttf-fira-code`

## Sublime Merge

### What it does:

- Visual settings, mostly

### Dependencies:
- `sublime-merge`
- `ttf-fira-code`

## Dunst

### What it does:
- Sets color scheme: [Base16-eighties](https://github.com/khamer/base16-dunst)
- Visual settings

### Dependencies:
- `dunst`
- `nerd-fonts-complete`
- `papirus-icon-theme`

## i3

### What it does:
- Visual settings
- Sets key bindings

### Dependencies:
- `i3-gaps`
- `nerd-fonts-complete`
- [`pa-vol`](https://github.com/rubikonx9/pa-vol) for volume control
- `light` for brightness control
- `termite` as terminal emulator
- `arandr` for display management
- `rofi` for many things
- `polybar` as bar
- `compton` as compositor
- `dunst` for notifications
- `nm-applet` for network management icon in tray
- `nitrogen` for setting wallpapers
- `xautolock` for screen locking
- `i3lock` for screen locking
    + I'm using `i3lock-fancier-git` from `AUR`

## Polybar

### What it does:
- Defines bars & modules

### Dependencies:
- `polybar`
- `nerd-fonts-complete`
- `ttf-font-awesome`
- Relies on color scheme defined in `xrdb`, see `Xresources` above
- `dunst`

