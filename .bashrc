alias ls='ls -F -G'
alias la='ls -la'
alias ll='ls -l'
alias mv='mv -i'
alias rm='rm -i'
alias cp='cp -i'
alias sc='screen'
alias ps='ps --sort=start_time'
alias svnst='svn st | grep "^[A,M,?,\!] *"'
alias svnsrchk='svn st -q | grep "^[A,M,?,\!] .*\.php" | sed -e "s/^[A,M] *//g" | xargs -n1 php -l'

export LSCOLORS=gxfxcxdxbxegedabagacad
export HISTSIZE=10000
export HISTCONTROL=ignoredups

if [ "$TERM" == "screen" ]; then
    export PS1='\h:$WINDOW:\w\$'
fi

function svnlogByDateRange() {
    TO_DATE='HEAD'
    case $# in
    0)
        # 引数なしは昨日から最新まで
        FROM_DATE={`date -d '1 day ago' '+%F'`}
        ;;
    1)
        # 引数1個は開始指定日(yyyy-mm-dd)から最新まで
        FROM_DATE={$1}
        ;;
    2)
        # 引数2個は開始指定日(yyyy-mm-dd)から終了指定日(yyyy-mm-dd)まで
        FROM_DATE={$1}
        TO_DATE={$2}
        ;;
    esac

    CMD="svn log -v -r $FROM_DATE:$TO_DATE"
    echo $CMD
    eval $CMD
}

function svnlogByDateRangeMine() {
    CMD='svnlogByDateRange $@ | sed -n "/okada/,/----$/ p"'
    echo $CMD
    eval $CMD
}
