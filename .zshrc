# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source /opt/homebrew/share/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# history setup
HISTFILE=$HOME/.zhistory
SAVEHIST=1000
HISTSIZE=999
setopt share_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_verify

# completion using arrow keys (based on history)
bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Aliases 
alias ls="eza --icons=always"
alias la="eza -T -L=1 -la --no-permissions"
alias l="eza -T -L=2 -l"
eval "$(zoxide init zsh)"

# Handling of Ruby versions by adding rbenv to PATH
export PATH="$HOME/.rbenv/bin:$PATH"
# Initialize rbenv
eval "$(rbenv init -)"
export DYLD_LIBRARY_PATH=/opt/homebrew/lib
export GOOGLE_APPLICATION_CREDENTIALS=/Users/jonas/.config/gcloud/application_default_credentials.json

# Limiting the search of fzf
export FZF_DEFAULT_COMMAND="find . -maxdepth 1 tmux --80%"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

#The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/jonas/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/jonas/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/jonas/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/jonas/google-cloud-sdk/completion.zsh.inc'; fi
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"


