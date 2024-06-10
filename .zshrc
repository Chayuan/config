source ~/.nvm/nvm.sh

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(git)

source $ZSH/oh-my-zsh.sh


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

alias vim="nvim"
alias v="nvim"
alias commit="gitmoji -c"
alias gp="git push origin $1"
alias conf="cd ~/.config"
alias work="cd ~/ornikar/"
alias perso="cd ~/perso/"
