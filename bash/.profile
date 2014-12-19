export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin

#Go Lang
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

source ~/.aliasfile
source /usr/local/share/chruby/chruby.sh
source /usr/local/share/chruby/auto.sh

#Color codes
clr0='\[\e[0;30m\]'
clr1='\[\e[0;31m\]'
clr2='\[\e[0;32m\]'
clr3='\[\e[0;33m\]'
clr4='\[\e[0;34m\]'
clr5='\[\e[0;35m\]'
clr6='\[\e[0;36m\]'
clr7='\[\e[0;37m\]'
clrx='\[\e[0m\]'

#Custom command prompt
export PS1="\n(${clr3}\w${clrx})[${clr6}\u${clrx}]=> "
export PS2="=> "

#Autocomplete for git
if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

#Hop up to specified directory
hop ()
{
  if [ -z "$1" ]; then
    return
  fi
  local target=$1
  cd "${PWD/\/$target\/*//$target}"
}
#Autocomplete for hop()
_hop ()
{
  local cur=${COMP_WORDS[COMP_CWORD]}
  local d=${PWD//\//\ }
  COMPREPLY=( $( compgen -W "$d" -- "$cur" ) )
}
complete -F _hop hop

#Display the contents of a directory in color.
alias ls='ls -G'

#Display the contents of a directory when switching to it.
#function cd()
#{
#  builtin cd "$*" && ls
#}
