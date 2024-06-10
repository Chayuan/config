source ~/.nvm/nvm.sh
export PATH="${HOME}/Library/Android/sdk/tools:${HOME}/Library/Android/sdk/platform-tools:${PATH}"
export ANDROID_SDK_ROOT=~/Library/Android/sdk
export NULI_ROOT=~/nuli
export HORIZON_ROOT=~/perso

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(git)

source $ZSH/oh-my-zsh.sh

export PATH="/usr/local/opt/mysql-client/bin:$PATH"
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

alias refreshhosts="cd ~/nuli/tools.nuli.app/aws-helpers && yarn start refresh-ssh-hosts && popd"

function getLatestDump () {
  DEST=$(pwd)
  cd ~/nuli/tools.nuli.app/aws-helpers
  yarn start getLatestDump $1 ${DEST}/dumps
  popd -q
}

alias log="cd ~/nuli/tools.nuli.app && yarn log && popd"

alias vim="nvim"
alias schema="~/nuli/tools.nuli.app/scripts/gql_schema.sh"
alias commit="gitmoji -c"
alias gp="git push origin $1"
alias horizonSchema="~/perso/scripts/horizon-schema.sh"


# bun completions
[ -s "/Users/gwenaelrobert/.bun/_bun" ] && source "/Users/gwenaelrobert/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
