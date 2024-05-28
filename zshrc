# reference: https://thevaluable.dev/zsh-install-configure-mouseless/

# Aliases
source "$HOME/.aliases"

# Autocompletion
zstyle ':completion:*' completer _complete _ignored _correct _approximate
zstyle :compinstall filename '/home/alec/.config/zsh/.zshrc'

autoload -Uz compinit; compinit    # Enable
_comp_options+=(globdots)          # With hidden files

# Additional CLI autocompletions
fpath=("$ZPLUGS/zsh-completions/src" $fpath)

# prompt
fpath=($HOME $fpath)
autoload -Uz .prompt; .prompt

# Enable terminal editor keybindings via mode switching with ESC
# bindkey -v                  # -v will use vi bindings, -e uses emacs
# export KEYTIMEOUT=1         # vi-style: speed up INSERT and NORMAL mode switching

# fzf (https://github.com/junegunn/fzf#using-homebrew)
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Misc options https://zsh.sourceforge.io/Doc/Release/Options.html
setopt HIST_SAVE_NO_DUPS    # Do not write a duplicate event to the history file.
setopt AUTO_CD              # If a command is issued that can’t be executed as a normal command, and the command is the name of a directory, perform the cd command to that directory.
setopt CD_SILENT            # Never print the working directory after a cd.

# Indexed directory history (see https://thevaluable.dev/zsh-install-configure-mouseless/)
setopt AUTO_PUSHD           # Push the current directory visited on the stack.
setopt PUSHD_IGNORE_DUPS    # Do not store duplicates in the stack.
setopt PUSHD_SILENT         # Do not print the directory stack after pushd or popd.
setopt PUSHD_TO_HOME        # Have pushd with no arguments act like ‘pushd $HOME’.

# Autosuggestions
source "$ZPLUGS/zsh-autosuggestions/zsh-autosuggestions.zsh"

# tabtab source for packages (pnpm)
[[ -f ~/.config/tabtab/zsh/__tabtab.zsh ]] && . ~/.config/tabtab/zsh/__tabtab.zsh || true

# History
export HISTFILE="$HOME/.zsh_history"       # History filepath
export HISTSIZE=10000                      # Maximum events for internal history
export SAVEHIST=10000                      # Maximum events in history file

# bun completions
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

# branches — function for Git branch management. Requires fzf.
# - Default (no flag): Interactive branch checkout.
#   Lists 30 most recent local branches. Use arrow keys to navigate, "enter" to select and checkout.
# - With '-d' flag: Interactive branch deletion.
#   Lists 30 most recent local branches with multi-select. Use arrow keys to navigate, "tab" to select, and "enter" to delete selected branches.

branches() {
  # Check if the current directory is inside a git repository
  if ! git rev-parse --is-inside-work-tree > /dev/null 2>&1; then
    echo "Error: Not inside a Git repository. Please navigate to a repository to use this function."
    return 1
  fi

  local branches branch
  branches=$(git for-each-ref --count=30 --sort=-committerdate refs/heads/ --format="%(refname:short)")

  case "$1" in
    -d) branch=$(echo "$branches" | fzf --multi)
        git branch -D $(echo "$branch" | sed "s/.* //" | sed "s#remotes/[^/]*/##") ;;
    *)  branch=$(echo "$branches" | fzf)
        git checkout $branch ;;
  esac
}



#### Syntax highlighting
source "$ZPLUGS/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
#### Must come last!
