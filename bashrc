export PATH=~/bin:$PATH
export PATH=~/projects/third_party/google_appengine:$PATH
export TERM="xterm-256color"

# Set python path (for some reason, this is not st by default)
# export PYTHONPATH=/usr/lib/python2.7/dist-packages

# YCM-autocompleter compile flags
export PYTHONPATH=~/projects/third_party/ycm_extra_conf.jsondb:$PYTHONPATH

# ROS-specific
# source ~/groovy_workspace/setup.bash
# export ROS_PACKAGE_PATH=~/groovy_workspace:$ROS_PACKAGE_PATH

source /opt/ros/indigo/setup.bash
source ~/indigo_workspace/devel/setup.bash
export ROS_WORKSPACE=~/indigo_workspace
#export ROS_PACKAGE_PATH=~/hydro_workspace:$ROS_PACKAGE_PATH

export ROBOT=sim
#export ROS_IP=128.2.178.26
export ROS_IP=`ifconfig em1 | grep 'inet addr:' | cut -d: -f2 | awk '{ print $1}'`
export ROS_PARALLEL_JOBS=-j8

# Enable ccache
# export PATH=/usr/lib/ccache:$PATH

source ~/.bash_aliases

# Caffe--dependency
# export LD_LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH
# export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig:$PKG_CONFIG_PATH

# The next line updates PATH for the Google Cloud SDK.
source '/usr0/home/venkatrn/projects/third_party/google-cloud-sdk/path.bash.inc'

# The next line enables shell command completion for gcloud.
source '/usr0/home/venkatrn/projects/third_party/google-cloud-sdk/completion.bash.inc'

# added by Anaconda 2.3.0 installer
# export PATH="/usr0/home/venkatrn/projects/third_party/anaconda/bin:$PATH"

# Infinite bash history
# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
export HISTCONTROL=ignoredups:erasedups

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
export HISTSIZE=100000
export HISTFILESIZE=200000

eval $BASH_POST_RC
export BASH_POST_RC=''
