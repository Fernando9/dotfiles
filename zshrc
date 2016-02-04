#Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

#virtualenvwrapper configuration
export WORKON_HOME=~/.virtualenvs
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python2.7
export VIRTUALENVWRAPPER_VIRTUALENV=/usr/local/bin/virtualenv
source /usr/local/bin/virtualenvwrapper.sh

#enviroment variables for emma.
#export /usr/local/share/npm/bin
export LOCALEMMA_EMMA_BASE_DIR=/Users/fmunoz/Dev/emma/
export LOCALEMMA_EMMADMIN_BASE_DIR=/Users/fmunoz/Dev/emmadmin
export LOCALEMMA_AUDIENCE_BASE_DIR=/Users/fmunoz/dev/new_platform/
export LOCALEMMA_REALTIME_BASE_DIR=/Users/fmunoz/dev/realtime/
export LOCALEMMA_EMMA27_VM_MEMORY=256
export LOCALEMMA_AUDIENCE_VM_MEMORY=512
export LOCALEMMA_REALTIME_VM_MEMORY=256

#default user
export DEFAULT_USER="fmunoz"
# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# miloshadzic lambda norm muse gallifrey
ZSH_THEME="af-magic"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
 COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git vi-mode)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/usr/X11/bin:/usr/local/share/npm/bin:/usr/local/sbin:/usr/local/opt/ruby/bin:$PATH

#Aliases
#alias mvim='DYLD_FORCE_FLAT_NAMESPACE=1 mvim'
alias work='cd ~/dev/emma/python/emma'
alias off='cd ~/dev/localemma/ && vagrant halt && sudo shutdown -s now'
alias cls='clear'
alias le='cd ~/dev/LocalEmma/'
alias unitest='cd ~/dev/emma/python/tests && workon testemma && nosetests'
alias worka='cd ~/dev/emmadmin/emmadmin'
alias nyan='cd ~/dev/emma/python/emma/media/js && ./node_modules/mocha/bin/mocha test/mailing-create --recursive --reporter nyan'
alias deploy='cd ~/dev/emma/ && workon deploy'
alias auto='cd ~/dev/autoresponders/app'
alias workflow='cd ~/dev/eda-workflows/ && workon eda-workflows && python start.py --env-config config/local.json --service processor'
alias audrelay='cd ~/dev/eda-audience-relay/ && workon eda-audience-relay && echo "aud-relay Running" && python start.py --env-config config/local.json --service processor'
alias autorun='cd ~/dev/autoresponders/ && workon autoresponders && export DJANGO_SETTINGS_MODULE=config && echo "Server Running" && python runserver.py'
alias e-mail='cd ~/dev/eda-email/ && workon eda-email && python start.py --env-config config/local.json --service processor'
alias prohome='cd ~/dev/response/ && workon response && export DJANGO_SETTINGS_MODULE=config && echo "ProHome Running" && python runserver.py'

#Aliases for mac computer hacks
alias fullpathon='defaults write com.apple.finder _FXShowPosixPathInTitle -bool YES'
alias showhidden='defaults write com.apple.Finder AppleShowAllFiles TRUE'
alias insert_fix='cd ~/scripts_mac && ./editortfix.sh && cd'
alias delete_fix='cd ~/scripts_mac && ./editortfixrm.sh $$ cd'
alias apache="cd ~/dev/LocalEmma/ && vagrant ssh emma27 -c 'sudo apache2ctl restart' && cd "
alias apache2="(cd ~/dev/LocalEmma/ && vagrant ssh emma27 -c 'sudo /etc/init.d/apache2 restart')"
alias emmadev="open https://github.com/emmadev/"
alias rpdb="cd ~/dev/rpdb-autoconnect && workon rpdb && node socket.js --host emma27 --port 4444"
alias cleanpyc='find . -type f -name "*.pyc" -delete'
alias deletepyc='find . -type f -name "*.pyc" -exec rm {} \;'
alias ij=_intellij
alias fflag="(cd ~/scripts_mac && ./featureflag.sh)"
alias deploy1="(cd ~/scripts_mac && ./pushit.sh)"
alias runt="(cd ~/scripts_mac && ./runtests.sh)"
alias wst="(cd ~/scripts_mac && ./startwebsockets.sh)"
alias feature="cd ~/dev/feature-control && node src/ 8012 config/local.json"

#This function allows to launch the MacVim editor.
function gvim { /Applications/MacVim.app/Contents/MacOS/Vim -g $*; }
#This function allows to launch IntelliJ
function _intellij() {
    if [ -e $* ]
    then
        open $* -a /Applications/IntelliJ\ IDEA\ 14.app/
    else
        echo '' > $*
        open $* -a /Applications/IntelliJ\ IDEA\ 14.app/
    fi
}
#This function allows me to run a quick update on psql in a specific folder.
#run_schema_changes () {
#    cd ~/dev/emma/python/emma/schema_changes
#    local count="${1:-6}"
#    find [0-9]*.sql | tail -n $count | xargs cat | psql -U postgres -h emma.int emma
#}

#. ~/.vim/bundle/powerline/powerline/bindings/zsh/powerline.zsh
alias pgstart="pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start"
alias pgstop="pg_ctl -D /usr/local/var/postgres stop -s -m fast"

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

### alias tmux
alias tmux="TERM=screen-256color-bce tmux"
## Command completation in Homebrew.
fpath=($HOME/.zsh/func $fpath)
typeset -U fpath

source /Users/fmunoz/.iterm2_shell_integration.zsh
## Self completion for pyenv
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
#eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
export PYENV_VIRTUALENVWRAPPER_PREFER_PYVENV="true"
#nvm for multiple node versions
export NVM_DIR=~/.nvm

export NVM_DIR="/Users/fmunoz/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

#  LOCALEMMA_PATH
export PATH="$PATH:/Users/fmunoz/dev/LocalEmma/bin"

# LOCALEMMA lemma zsh completion
fpath=(/Users/fmunoz/dev/LocalEmma/bin $fpath)
autoload -U compinit
compinit
