# homebrew
eval $(/opt/homebrew/bin/brew shellenv)

# System paths
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$XDG_CONFIG_HOME/local/share"
export XDG_CACHE_HOME="$XDG_CONFIG_HOME/cache"
export ZPLUGS="$HOME/.plugins"

# Android
export JAVA_HOME=/Library/Java/JavaVirtualMachines/zulu-17.jdk/Contents/Home
export ANDROID_SDK="$HOME/Library/Android/sdk"
export PATH="$PATH:$ANDROID_SDK/emulator"
export PATH="$PATH:$ANDROID_SDK/platform-tools"

# Editor
export EDITOR="vim"
export VISUAL="zed"

# yarn
export PATH="$HOME/.yarn/bin:$XDG_CONFIG_HOME/.config/yarn/global/node_modules/.bin:$PATH"

# pnpm
export PNPM_HOME="$XDG_DATA_HOME/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# nvm
source "$ZPLUGS/zsh-nvm/zsh-nvm.plugin.zsh"

# run nvm use if .nvmrc is present
autoload -U add-zsh-hook
load-nvmrc() {
  local node_version="$(nvm version)"
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$node_version" ]; then
      nvm use
    fi
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# dprint, code formatter
export DPRINT_INSTALL="$HOME/.dprint"
export PATH="$DPRINT_INSTALL/bin:$PATH"

# gpg (for signing commits with yubikey)
export "GPG_TTY=$(tty)"

# ruby via brew
export PATH="/opt/homebrew/lib/ruby/gems/3.3.0/bin:$PATH"
export PATH="/opt/homebrew/opt/ruby/bin:$PATH"
export LDFLAGS="-L/opt/homebrew/opt/ruby/lib"
export CPPFLAGS="-I/opt/homebrew/opt/ruby/include"

# increase node's memory allocation
export NODE_OPTIONS="--max-old-space-size=10000"

# GPG signing
export "GPG_TTY=/dev/ttys000"
