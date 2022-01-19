# zsh

Dotfiles for zsh configuration. Simple (no frameworks) and portable (plugins as submodules).

> Reference: https://thevaluable.dev/zsh-install-configure-mouseless/

1. Install zsh (no need for macOS):
   ```
   sudo apt install zsh
   ```
1. Set path variables:
   ```
   export XDG_CONFIG_HOME="$HOME/.config"
   export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
   ```
1. Create a `.zshenv` file in your home directory:
   ```
   touch ~/.zshenv
   ```
   ```
   # .zshenv contents

   # System paths
   export XDG_CONFIG_HOME="$HOME/.config"
   export XDG_DATA_HOME="$XDG_CONFIG_HOME/local/share"
   export XDG_CACHE_HOME="$XDG_CONFIG_HOME/cache"
   export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
   export ZPLUGS="$ZDOTDIR/plugins"

   # Editor
   export EDITOR="vim"
   export VISUAL="code"

   # History
   export HISTFILE="$ZDOTDIR/.zhistory"    # History filepath
   export HISTSIZE=10000                   # Maximum events for internal history
   export SAVEHIST=10000                   # Maximum events in history file
   ```
1. Make an `.aliases` file in your config directory:
   ```
   touch ~/.config/.aliases
   ```
   ```
   # .aliases contents

   # git

   alias gs='git status'
   alias ga='git add'
   alias gp='git push'
   alias gpo='git push origin'
   alias gb='git branch '
   alias gbm='git branch -m'
   alias gbd='git branch -D'
   alias gc='git commit'
   alias gd='git diff'
   alias gco='git checkout '
   alias gl='git log'
   alias glo='git log --pretty="oneline"'
   alias glol='git log --graph --oneline --decorate'
   alias gri='git rebase -i'

   # ls

   alias ls='ls --color=auto'
   alias lsl='ls -l'
   alias ll='ls -lahF'
   alias lls='ls -lahFtr'
   alias la='ls -A'
   alias l='ls -CF'

   # directories

   alias phantom="$HOME/phantom"

   # see https://thevaluable.dev/zsh-install-configure-mouseless/
   alias d='dirs -v'
   for index ({1..9}) alias "$index"="cd +${index}"; unset index
   # Usage:
   # ~ > cd .config
   # ~/.config > cd devdash
   # ~/.config/devdash > cd ..
   # ~/.config > cd i3
   # ~/.config/i3 > cd ..
   # ~/.config > d
   # 0       ~/.config
   # 1       ~/.config/i3
   # 2       ~/.config/devdash
   # 3       ~
   # ~/.config > 2
   # ~/.config/devdash >
   ```
1. [Install fzf](https://github.com/junegunn/fzf#installation):
   ```
   brew install fzf
   ```
1. Pull into `~/.config`:
   ```
   cd ~/.config && git clone https://github.com/alecmarcus/zsh.git
   ```
1. Run zsh:
   ```
   zsh
   ```
1. Set the default shell to zsh:
   ```
   chsh -s $(which zsh)
   ```
1. Never look back
