alias ls='ls -F -G'
alias la='ls -la'
alias ll='ls -l'
alias mv='mv -i'
alias rm='rm -i'
alias cp='cp -i'
alias sc='screen'
alias ps='ps --sort=start_time'
alias svnst='svn st | grep "^[A,M,?,\!] *"'
alias svnsrchk='svn st -q | grep "^[A,M,?,\!] *" | sed -e "s/^[A,M] *//g" | xargs -n1 php -l'

export LSCOLORS=gxfxcxdxbxegedabagacad
export HISTSIZE=10000
export HISTCONTROL=ignoredups

if [ "$TERM" == "screen" ]; then
    export PS1='\h:$WINDOW:\w\$'
fi

function svnlog() {
    FROM_DATE=`date -d '1 day ago' '+%F'`
    CMD="svn log -v -r {$FROM_DATE}:HEAD"
    echo $CMD
    eval $CMD
}
