# reference: https://thevaluable.dev/zsh-install-configure-mouseless/

# Autocompletion
zstyle ':completion:*' completer _complete _ignored _correct _approximate
zstyle :compinstall filename '/home/alec/.config/zsh/.zshrc'

autoload -Uz compinit; compinit # Enable
_comp_options+=(globdots) # With hidden files

# Additional CLI autocompletions
fpath=("$ZPLUGS/zsh-completions/src" $fpath)

# prompt
fpath=($ZDOTDIR $fpath)
autoload -Uz .prompt; .prompt

# Key bindings
setopt autocd
bindkey -v # -v for vi, -e for emacs
export KEYTIMEOUT=1 # vi-style: speed up INSERT and NORMAL mode switching

# fzf (https://github.com/junegunn/fzf#using-homebrew)
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Indexed directory history (see https://thevaluable.dev/zsh-install-configure-mouseless/)
setopt AUTO_PUSHD           # Push the current directory visited on the stack.
setopt PUSHD_IGNORE_DUPS    # Do not store duplicates in the stack.
setopt PUSHD_SILENT         # Do not print the directory stack after pushd or popd.

# Aliases
source "$XDG_CONFIG_HOME/.aliases"

# Syntax highlighting
# Must come last!
source "$ZPLUGS/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
