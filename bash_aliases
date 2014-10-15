#!/bin/bash

## Colorize the ls output
alias ls="ls --color=auto"

## Colorize the grep command output for ease of use (good for log files)##
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

alias diff='colordiff'

alias matlab='matlab -nodesktop -nosplash'
alias matlab_gui='matlab'


alias work_sbpl='ssh -p 21890 venkat@sbpl.pc.cs.cmu.edu'
alias work_ta='cd /afs/cs.cmu.edu/academic/class/16831-f11/'

## TODO: ROS-specific aliases
alias rviz='rosrun rviz rviz'

ip=`ifconfig eth0 | grep 'inet addr:' | cut -d: -f2 | awk '{ print $1}'`
sbpl_ip="192.168.1.100"
## PR2-aliases (based on whether I am connected to the SCS or SBPL network)
if [ "$ip" == "$sbpl_ip" ]
then
  alias pr2='ssh venkatrn@alan1'
  alias pr2master="export ROS_MASTER_URI=http://alan1:11311 ; export ROBOT=robot ; export ROS_IP=`ifconfig eth0 | grep 'inet addr:' | cut -d: -f2 | awk '{ print $1}'`" 
  alias pr2_rviz='pr2master && rviz'
  alias dash='pr2master && rosrun pr2_dashboard pr2_dashboard'
else
  alias pr2='ssh venkatrn@alan1_wifi'
  alias pr2master="export ROS_MASTER_URI=http://alan1_wifi:11311 ; export ROBOT=robot ; export ROS_IP=`ifconfig eth0 | grep 'inet addr:' | cut -d: -f2 | awk '{ print $1}'`" 
  alias pr2_rviz='pr2master && rviz'
  alias dash='pr2master && rosrun pr2_dashboard pr2_dashboard'
fi

## Temporary aliases
alias ltm='cd ~/groovy_workspace/sandbox/ltm'


