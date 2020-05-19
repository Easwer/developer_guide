# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions
alias h='history'
alias b='gedit ~/.bashrc'
alias k='gedit ~/.ssh/known_hosts'
alias r='reset'
alias s='source ~/.bashrc'
alias vnc='nohup x11vnc -forever -shared &'
alias startvnc='vncserver :10 -geometry 1280x1024'
alias stopvnc='vncserver -kill :10'


#PostgreSQL
alias psql9='~/Resource/postgresql/postgres-9.3.2/bin/psql -p 55432 -U admin -h 192.168.27.234 -d DNMS_EMS_DB'
alias psql_start='sh ~/Resource/postgresql/start-postgres-server.sh'
alias psql_stop='sh ~/Resource/postgresql/stop-postgres-server.sh'
alias psql_status='sh ~/Resource/postgresql/status-postgres-server.sh'
alias psql_restart='sh ~/Resource/postgresql/restart-postgres-server.sh'
alias psql_reload='sh ~/Resource/postgresql/reload-postgres-server.sh'
alias psql_log='setTitle "PostgreSQL Log" && tail -f ~/Resource/postgresql/data/logs/*.log'
export PGHOME=~/Resource/postgresql/postgres-9.3.2
export PATH=$PGHOME/bin:$PATH

export PATH="/bin:/usr/lib64/qt-3.3/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/sbin:~/.local/bin:~/bin:/usr/local/go/bin"

### jdk-1.7
#export JAVA_HOME="~/Resource/Java/jdk1.7.0_75"
#export JRE_HOME="~/Resource/Java/jdk1.7.0_75/jre/bin"

### jdk-1.8
#export JAVA_HOME="~/Resource/Java/jdk1.8.0_201"
#export JRE_HOME="~/Resource/Java/jdk1.8.0_201/jre/bin"

### Amazon-Correto jdk-1.8
export JAVA_HOME="~/Resource/Java/amazon-corretto-8.202.08.2-linux-x64"
export JRE_HOME="~/Resource/Java/amazon-corretto-8.202.08.2-linux-x64/jre/bin"
export PATH=$JAVA_HOME:$JRE_HOME:$PATH
export M2_HOME="/usr/local/maven"
export PATH=$PATH:$M2_HOME
export MAVEN_OPTS="-Xdebug -Xnoagent -Djava.compiler=NONE -Xrunjdwp:transport=dt_socket,address=8181,server=y,suspend=n"
#export JPDA_OPTS="-agentlib:jdwp=transport=dt_socket,address=6666,server=y,suspend=n"
export ANT_HOME="~/Resource/Ant/apache-ant-1.9.14"
export ANT_OPTS="-Xmx2g -XX:MaxPermSize=1g"

extract () {
   if [ -f $1 ] ; then
       case $1 in
	*.tar.bz2)	tar xvjf $1 && cd $(basename "$1" .tar.bz2) ;;
	*.tar.gz)	tar xvzf $1 && cd $(basename "$1" .tar.gz) ;;
	*.tar.xz)	tar Jxvf $1 && cd $(basename "$1" .tar.xz) ;;
	*.bz2)		bunzip2 $1 && cd $(basename "$1" /bz2) ;;
	*.rar)		unrar x $1 && cd $(basename "$1" .rar) ;;
	*.gz)		gunzip $1 && cd $(basename "$1" .gz) ;;
	*.tar)		tar xvf $1 && cd $(basename "$1" .tar) ;;
	*.tbz2)		tar xvjf $1 && cd $(basename "$1" .tbz2) ;;
	*.tgz)		tar xvzf $1 && cd $(basename "$1" .tgz) ;;
	*.zip)		unzip $1 && cd $(basename "$1" .zip) ;;
	*.Z)		uncompress $1 && cd $(basename "$1" .Z) ;;
	*.7z)		7z x $1 && cd $(basename "$1" .7z) ;;
	*.rpm)		rpm -ivh $1 && cd $(basename "$1" .rpm) ;;
	*)		echo "Sorry......Don't know how to extract '$1'" ;;
       esac
   else
       echo "'$1' is not a valid file!"
   fi
 }

setTitle()
{
    if [ $# -eq 0 ]
        then
        eval set -- $1
    fi

    case $TERM in
        xterm*) local title="\[\033]0;$@\007\]";;
        *) local title=''
    esac
    local prompt=$(echo "$PS1" | sed -e 's/\\\[\\033\]0;.*\\007\\\]//')
    PS1="${title}${prompt}"
}

