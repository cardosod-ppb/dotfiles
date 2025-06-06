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
  local include_ignored=0
  local name=""

  # Parse arguments
  while [[ $# -gt 0 ]]; do
    case $1 in
      --all)  # Include git-ignored files
        include_ignored=1
        shift
        ;;
      *)
        name=$1
        shift
        ;;
    esac
  done

  if [[ -z "$name" ]]; then
    echo "Usage: rm_recursive <name> [--all]"
    return 1
  fi


  if [[ $include_ignored -eq 1 ]]; then
    # Remove all matching files/folders, including git-ignored ones
    find . -name "$name" -exec rm -rf {} +
  else
    # Find files that are NOT ignored by Git and remove them
    find . -name "$name" -print | while read -r file; do
      if ! git check-ignore -q "$file"; then
        rm -rf "$file"
      fi
    done
  fi
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
export PNPM_HOME=$HOME/Library/pnpm
export PATH=$PATH:$PNPM_HOME

# java
export JAVA_HOME=$(brew --prefix openjdk)/libexec/openjdk.jdk/Contents/Home
export PATH=$PATH:$JAVA_HOME/bin

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
