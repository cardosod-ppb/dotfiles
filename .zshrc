# general
#current_folder=$(dirname "$(realpath "$0")") # FIXME: throws an error on bootstrap

# private stuff
# source $current_folder/private/tokens.sh

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

# rpm
alias extract_rpm='rpm2cpio "$(fzf)" | cpio -idmv'

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

# thefuck
eval $(thefuck --alias fck)

# asdf (version manager)
. /usr/local/opt/asdf/libexec/asdf.sh
export ASDF_NODEJS_LEGACY_FILE_DYNAMIC_STRATEGY=latest_installed # partial versions

# environment variables
export EDITOR='nvim'
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export FZF_DEFAULT_COMMAND='rg --files --hidden'

export PATH="$HOME/.docker/bin:$PATH"
export PATH="Applications/Visual Studio Code.app/Contents/Resources/app/bin:$PATH"

path() { echo $PATH | tr ':' '\n' }
