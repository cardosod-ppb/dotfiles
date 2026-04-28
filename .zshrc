# private stuff
source ~/Projects/personal/dotfiles/.tokens.sh

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

# git
gstla() {
  git stash list | fzf | sed 's/:.*//' | xargs git stash apply
}

gstlp() {
  git stash list | fzf | sed 's/:.*//' | xargs git stash pop
}

rm_recursive() {
  if [ -z "$1" ]; then
    echo "Usage: rm_recursive <folder_name>"
    return 1
  fi

  folder_name="$1"

  # List the folders to be deleted
  echo "The following folders will be deleted:"
  folders_to_delete=$(find . -type d -name "$folder_name")
  
  if [ -z "$folders_to_delete" ]; then
    echo "No folders named '$folder_name' found."
    return 0
  fi

  echo "$folders_to_delete"

  # Prompt the user for confirmation
  echo -n "Do you want to proceed? (y/n): "
  read confirmation
  if [[ "$confirmation" != "y" && "$confirmation" != "Y" ]]; then
    echo "Operation canceled."
    return 0
  fi

  # Delete the folders
  echo "Deleting folders..."
  find . -type d -name "$folder_name" -exec rm -rf {} +
  echo "Done."
}

# networking
alias ip="ifconfig | grep \"inet \" | grep -Fv 127.0.0.1 | awk '{print \$2}'"
alias ports="netstat -anvp tcp | awk 'NR<3 || /LISTEN/'"
kill_port() { lsof -i tcp:"$*" | awk 'NR!=1 {print $2}' | xargs kill -9 ;}

# rpm
alias extract_rpm='rpm2cpio "$(fzf)" | cpio -idmv'

# zsh
bindkey -v # vim mode

# oh my zsh
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(git)
source $ZSH/oh-my-zsh.sh

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh # autocomplete and key bindings

# thefuck
eval $(thefuck --alias fck)

# asdf (version manager)
export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"
export ASDF_NODEJS_LEGACY_FILE_DYNAMIC_STRATEGY=latest_installed # partial versions

# pnpm
alias pn="pnpm"
export PNPM_HOME=$HOME/Library/pnpm
export PATH=$PATH:$PNPM_HOME

# java
export JAVA_HOME="/opt/homebrew/Cellar/openjdk@17/17.0.17/libexec/openjdk.jdk/Contents/Home"
export PATH="/opt/homebrew/opt/openjdk@17/bin:$PATH"

# ruby
export PATH="$HOME/.asdf/shims:$PATH"

# react native (android)
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools

# environment variables
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export FZF_DEFAULT_COMMAND='rg --files --hidden'

export PATH="$HOME/.docker/bin:$PATH"
export PATH="Applications/Visual Studio Code.app/Contents/Resources/app/bin:$PATH"

path() { echo $PATH | tr ':' '\n' }
