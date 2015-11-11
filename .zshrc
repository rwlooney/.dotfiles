#date

function _exit()              # Function to run upon exit of shell.
{
    echo -e "$fg_bold[white]This is Ripley, last survivor of the Nostromo, signing off.$reset_color"
}
trap _exit EXIT


export TIMEFORMAT=$'\nreal %3R\tuser %3U\tsys %3S\tpcpu %P\n'
export HISTIGNORE="&:bg:fg:ll:h"
export HISTTIMEFORMAT="$(echo -e ${BCyan})[%d/%m %H:%M:%S]$(echo -e ${NC}) "
export HISTCONTROL=ignoredups
export HOSTFILE=$HOME/.hosts    # Put a list of remote hosts in ~/.hosts

# export GOPATH=$HOME/Go

BASE16_SHELL="$HOME/.config/base16-shell/base16-eighties.dark.sh"
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL

export PATH=~/bin:"$PATH"
# export EDITOR="/usr/bin/vim"
export BROWSER="/usr/bin/firefox"
export VISUAL="vim"
autoload -U colors && colors
autoload -U compinit promptinit
compinit
promptinit


#-------------------
# Personnal Aliases
#-------------------

alias fuck='sudo !!'

alias pacupdate='yaourt -Syua'

alias screenshot='scrot '%Y-%m-%d-%H-%M-%S.png' -cd 3 -e "mv %Y-%m-%d-%H-%M-%S.png ~/Pictures/Screenshots/"'

# alias i3lock='/home/inaki/scripts/./locker.sh'

alias rm='rm -iv'
#alias cp='cp -iv'
alias mv='mv -iv'
# -> Prevents accidentally clobbering files.
alias mkdir='mkdir -p'

# Pretty-print of some PATH variables:
alias path='echo -e ${PATH//:/\\n}'
alias libpath='echo -e ${LD_LIBRARY_PATH//:/\\n}'


alias du='du -kh'    # Makes a more readable output.
alias df='df -kTh'

#-------------------------------------------------------------
# The 'ls' family (this assumes you use a recent GNU ls).
#-------------------------------------------------------------

alias ls='ls -l --color'


#-------------------------------------------------------------
# Spelling typos - highly personnal and keyboard-dependent :-)
#-------------------------------------------------------------

#alias xs='cd'
#alias vf='cd'
#alias moer='more'
#alias moew='more'
#alias kk='ll'
#alias vim='vim -c "set number"'
##alias grep='grep -n'
#alias vi='vim'


#-------------------------------------------------------------
# File & strings related functions:
#-------------------------------------------------------------

function extract()      # Handy Extract Program
{
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)   tar xvjf $1     ;;
            *.tar.gz)    tar xvzf $1     ;;
            *.bz2)       bunzip2 $1      ;;
            *.rar)       unrar x $1      ;;
            *.gz)        gunzip $1       ;;
            *.tar)       tar xvf $1      ;;
            *.tbz2)      tar xvjf $1     ;;
            *.tgz)       tar xvzf $1     ;;
            *.zip)       unzip $1        ;;
            *.Z)         uncompress $1   ;;
            *.7z)        7z x $1         ;;
            *)           echo "'$1' cannot be extracted via >extract<" ;;
        esac
    else
        echo "'$1' is not a valid file!"
    fi
}

# eval $(dircolors ~/.dircolors)

ttyctl -f

case ${TERM} in
  xterm-termite | xterm | rxvt-uni*)
    #date
    PROMPT="%B%F{blue}%T - %F{white}[%F{cyan}%n@%m%F{white}] %F{blue}%0~ %F{white}%# %b"
    #RPROMPT="[%{$fg_no_bold[yellow]%}%?%{$reset_color%}]"
    ;;
  *)
    prompt redhat
    ;;
esac



zstyle ':completion:*' menu select

setopt completealiases

setopt HIST_IGNORE_DUPS
