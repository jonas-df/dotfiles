# Prompt coloring
PROMPT='%F{green}%n%f %F{red}%B%~%b%f %F{purple} 󰣘 :'

# Aliases
alias ls='ls'
alias vd='ls -1'
alias grep='grep'
alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'
alias fman='bash -c "compgen -c" | fzf | xargs man'
alias py='python3'

# History configuration
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000

# Set option to not need cd
setopt autocd
bindkey -e

# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/jonas/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

source /home/jonas/.zsh/catppuccin_mocha-zsh-syntax-highlighting.zsh
source /home/jonas/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
export PATH="$PATH:/opt/nvim-linux64/bin"
export PATH="$PATH:$HOME/.local/bin"

export GOPATH=$HOME/go 
export GOROOT=/usr/local/go 
export GOBIN=$GOPATH/bin 
export PATH=$PATH:$GOPATH 
export PATH=$PATH:$GOROOT/bin

zstyle ':completion:*' menu select
fpath+=~/.zfunc

# Func for different nvim configs

alias nvim-lazy="NVIM_APPNAME=LazyVim nvim"
alias nvim-kick="NVIM_APPNAME=kickstart nvim"
alias nvim-chad="NVIM_APPNAME=NvChad nvim"
alias nvim-astro="NVIM_APPNAME=AstroNvim nvim"

function nvims() {
  items=("default" "kickstart" "LazyVim" "NvChad" "AstroNvim")
  config=$(printf "%s\n" "${items[@]}" | fzf --prompt=" Neovim Config  " --height=50% --layout=reverse --border --exit-0)
  if [[ -z $config ]]; then
    echo "Nothing selected"
    return 0
  elif [[ $config == "default" ]]; then
    config=""
  fi
  NVIM_APPNAME=$config nvim $@
}

#bindkey -s ^a "nvims\n"

# Func for better history grep
hg () {
  rg "$1" ~/.histfile 
}

#---------------------------------------------- chpwd pyvenv ---
python_venv() {
  MYVENV=./venv
  # when you cd into a folder that contains $MYVENV
  [[ -d $MYVENV ]] && source $MYVENV/bin/activate > /dev/null 2>&1
  # when you cd into a folder that doesn't
  [[ ! -d $MYVENV ]] && deactivate > /dev/null 2>&1
}
autoload -U add-zsh-hook
add-zsh-hook chpwd python_venv
