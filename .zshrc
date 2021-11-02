# shortcuts
alias g="git"
alias v="nvim"

# navigation 
alias cd..="cd .."
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

# files
alias cat="bat"
alias cp="cp -i -v"
alias mv="mv -i -v"
alias rm='rm -i -v'
cp_progress() { rsync -WavP --human-readable --progress $1 $2 } # copy with progress 

# directories
alias lsa="gls --almost-all --classify --color --group-directories-first --human-readable -l"
alias lsd='ls -l | grep "^d"' # only directories
rm_recursive() { find . -name $1 -type d -prune -exec echo '{}' \; -exec rm -rf {} \;  }

# networking
alias ip="ifconfig | grep \"inet \" | grep -Fv 127.0.0.1 | awk '{print \$2}'"
alias ports="netstat -anvp tcp | awk 'NR<3 || /LISTEN/'"
kill_port() { lsof -i tcp:"$*" | awk 'NR!=1 {print $2}' | xargs kill -9 ;}

# zsh
bindkey -v # vim mode
autoload -U promptinit; promptinit # pure prompt 

# oh my zsh
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME=""
plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
)
source $ZSH/oh-my-zsh.sh
prompt pure # pure must be activated after oh my zsh

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh # autocomplete and key bindings

# environment variables
export EDITOR='nvim'
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export FZF_DEFAULT_COMMAND='rg --files --hidden'

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" 
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# call nvm use in a directory with a .nvmrc file (must be place this after nvm initialization)
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
  elif [ "$node_version" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

path() { echo $PATH | tr ':' '\n' }
