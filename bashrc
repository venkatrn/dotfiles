export PATH=~/bin:$PATH
export PATH=/usr/local/programs/MATLAB/R2013a/bin:$PATH
export PATH=~/projects/third_party/google_appengine:$PATH
export TERM="xterm-256color"

# ROS-specific
source ~/groovy_workspace/setup.bash

#export ROS_PACKAGE_PATH=~/fuerte_workspace:$ROS_PACKAGE_PATH
#export ROS_WORKSPACE=~/fuerte_workspace

export ROBOT=sim
#export ROS_IP=128.2.178.26
export ROS_IP=`ifconfig eth0 | grep 'inet addr:' | cut -d: -f2 | awk '{ print $1}'`
export ROS_PARALLEL_JOBS=-j8

source ~/.bash_aliases

eval $BASH_POST_RC
export BASH_POST_RC=''
