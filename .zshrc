export GPG_TTY=$(tty)
# Add deno completions to search path
if [[ ":$FPATH:" != *":/Users/hejunhao/.zsh/completions:"* ]]; then export FPATH="/Users/hejunhao/.zsh/completions:$FPATH"; fi
# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(git zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

ZSH_THEME="haoomz"
alias python="python3"
alias pip="pip3"
. "/Users/hejunhao/.deno/env"
# Initialize zsh completions (added by deno install script)
autoload -Uz compinit
compinit
# pnpm
export PNPM_HOME="/Users/hejunhao/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
fpath=(/Users/hejunhao/.docker/completions $fpath)
autoload -Uz compinit
compinit

[ -s "/Users/hejunhao/.bun/_bun" ] && source "/Users/hejunhao/.bun/_bun"
# lang
export LANG=zh_CN.UTF-8
export LC_ALL=zh_CN.UTF-8
# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
eval "$(starship init zsh)"
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
proxy() {
  if [ "$1" = "on" ]; then
    export http_proxy="http://127.0.0.1:7897"
    export https_proxy="http://127.0.0.1:7897"
    export all_proxy="socks5://127.0.0.1:7897"
    echo "🌐 Proxy enabled"
  elif [ "$1" = "off" ]; then
    unset http_proxy
    unset https_proxy
    unset all_proxy
    echo "❌ Proxy disabled"
  else
    echo "Usage: proxy [on|off]"
  fi
}

___MY_VMOPTIONS_SHELL_FILE="${HOME}/.jetbrains.vmoptions.sh"; if [ -f "${___MY_VMOPTIONS_SHELL_FILE}" ]; then . "${___MY_VMOPTIONS_SHELL_FILE}"; fi
