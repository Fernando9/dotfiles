# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

export WORKON_HOME=~/.virtualenvs
source /usr/local/bin/virtualenvwrapper.sh

#enviroment variables for emma. 
export LOCALEMMA_EMMA_BASE_DIR=/Users/fmunoz/Dev/emma/
export LOCALEMMA_EMMADMIN_BASE_DIR=/Users/fmunoz/Dev/emmadmin/
export LOCALEMMA_AUDIENCE_BASE_DIR=/Users/fmunoz/dev/new_platform/

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="cloud"

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
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git vi-mode)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/opt/X11/bin:/usr/X11/bin

#Aliases 
alias vim='/Applications/MacVim.app/Contents/MacOS/Vim'
alias ea='workon emmad && cd ~/dev/emmadmin && make runserver'
alias work='cd ~/dev/emma/python/emma'
alias off='sudo shutdown -s now'
alias cls='clear'
alias vn='cd ~/dev/LocalEmma/ && vagrant up'
alias unitest='cd ~/dev/emma/python/tests && workon emma && nosetests'
alias worka='cd ~/dev/emmadmin/emmadmin'

#This function allows to launch the MacVim editor. 
function gvim { /Applications/MacVim.app/Contents/MacOS/Vim -g $*; }

#This function allows me to run  a quick update on psql in a specific folder. 
run_schema_changes () {
    cd ~/dev/emma/python/emma/schema_changes
    local count="${1:-6}"
    find [0-9]*.sql | tail -n $count | xargs cat | psql -U postgres -h emma.int emma
}
