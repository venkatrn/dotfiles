#!/bin/bash

## Colorize the ls output
alias ls="ls --color=auto"

## Colorize the grep command output for ease of use (good for log files)##
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

alias diff='colordiff'

## Open pdfs
alias o='xdg-open'

alias matlab='matlab -nodesktop -nosplash'
alias matlab_gui='matlab'

alias work_sbpl='ssh -p 21890 venkat@sbpl.pc.cs.cmu.edu'
alias work_ta='cd /afs/cs.cmu.edu/academic/class/16831-f11/'

## TODO: ROS-specific aliases
alias rviz='rosrun rviz rviz'

ip=`ifconfig em1 | grep 'inet addr:' | cut -d: -f2 | awk '{ print $1}'`
# sbpl_ip="192.168.1.101"
sbpl_ip="192.168.1.111"
## PR2-aliases (based on whether I am connected to the SCS or SBPL network)
if [ "$ip" == "$sbpl_ip" ]
then
  alias pr2='ssh venkatrn@alan1'
  alias pr2master="export ROS_MASTER_URI=http://alan1:11311 ; export ROBOT=robot ; export ROS_IP=`ifconfig em1 | grep 'inet addr:' | cut -d: -f2 | awk '{ print $1}'`" 
  alias pr2_rviz='pr2master && rviz'
  alias dash='pr2master && rosrun rqt_pr2_dashboard rqt_pr2_dashboard'
else
  alias pr2='ssh venkatrn@alan1_wifi'
  alias pr2master="export ROS_MASTER_URI=http://alan1_wifi:11311 ; export ROBOT=robot ; export ROS_IP=`ifconfig em1 | grep 'inet addr:' | cut -d: -f2 | awk '{ print $1}'`" 
  alias pr2_rviz='pr2master && rviz'
  alias dash='pr2master && rosrun rqt_pr2_dashboard rqt_pr2_dashboard'
fi

## Temporary aliases
alias perch='roscd sbpl_perception'

# AWS
function aws {
ssh -X -i ~/research/aws/aws_cmu_desktop.pem ubuntu@$1
}

## Search history with grep
function history_sync {
history -a
history -c
history -r
}
function hist {
history -a
history -c
history -r
builtin history
}
alias hgrep="hist|grep"

function rmake {
  pushd ~/indigo_workspace
  catkin_make -DCMAKE_BUILD_TYPE=Release
  popd
}

# Colorize make output
make()
{
  pathpat="(/[^/]*)+:[0-9]+"
  ccred=$(echo -e "\033[0;31m")
  ccyellow=$(echo -e "\033[0;33m")
  ccgreen=$(echo -e "\033[0;32m")
  ccboldred=$(echo -e "\033[1;31m")
  ccend=$(echo -e "\033[0m")
  /usr/bin/make "$@" 2>&1 | sed -E -e "s/[^/]*error[: ].*/$ccred&$ccend/g" \
  -e "s/[^/]*warning[: ].*/$ccyellow&$ccend/g" \
  -e "s/[Bb]uilding[: ].*/$ccgreen&$ccend/g" \
  -e "s/[Ll]inking.*/$ccboldred&$ccend/g" \
  -e "s/[Ss]canning.*/$ccgreen&$ccend/g"
  return ${PIPESTATUS[0]}
}

# Setup git branch display in prompt
function parse_git_branch () {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

RED="\[\033[0;31m\]"
YELLOW="\[\033[0;33m\]"
GREEN="\[\033[0;32m\]"
NO_COLOR="\[\033[0m\]"

# PS1="$GREEN\u@\h$NO_COLOR:\w$YELLOW\$(parse_git_branch)$NO_COLOR\$ "
PS1="$NO_COLOR\u@\h$GREEN\$(parse_git_branch)$NO_COLOR:\w$NO_COLOR\$ "

bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'
