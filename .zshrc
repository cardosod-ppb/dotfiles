# shortcuts
alias f="rg"
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
alias ls="gls --almost-all --classify --color --group-directories-first --human-readable -l"
alias lsd='ls -l | grep "^d"' # only directories
rm_recursive() { find . -name $1 -type d -prune -exec echo '{}' \; -exec rm -rf {} \;  }

# networking
alias ip="ifconfig | grep \"inet \" | grep -Fv 127.0.0.1 | awk '{print \$2}'"
alias ports="netstat -anvp tcp | awk 'NR<3 || /LISTEN/'"
kill_port() { lsof -i tcp:"$*" | awk 'NR!=1 {print $2}' | xargs kill -9 ;}

# zsh
autoload -U promptinit; promptinit; prompt pure # load theme

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh # autocomplete and key bindings

# environment variables
export EDITOR='nvim'
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export FZF_DEFAULT_COMMAND='rg --files --hidden'

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" 
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export PATH="$PATH:$HOME/.rvm/bin"
