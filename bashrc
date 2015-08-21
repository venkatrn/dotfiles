export PATH=~/bin:$PATH
export PATH=/usr/local/programs/MATLAB/R2013a/bin:$PATH
export PATH=~/projects/third_party/google_appengine:$PATH
export TERM="xterm-256color"

# Set python path (for some reason, this is not st by default)
export PYTHONPATH=/usr/lib/python2.7/dist-packages

# YCM-autocompleter compile flags
export PYTHONPATH=~/projects/third_party/ycm_extra_conf.jsondb:$PYTHONPATH


# ROS-specific
# source ~/groovy_workspace/setup.bash
# export ROS_PACKAGE_PATH=~/fuerte_workspace:$ROS_PACKAGE_PATH
# export ROS_WORKSPACE=~/fuerte_workspace

source /opt/ros/hydro/setup.bash
export ROS_PACKAGE_PATH=~/hydro_workspace:$ROS_PACKAGE_PATH

export ROBOT=sim
#export ROS_IP=128.2.178.26
export ROS_IP=`ifconfig eth0 | grep 'inet addr:' | cut -d: -f2 | awk '{ print $1}'`
export ROS_PARALLEL_JOBS=-j8

# Enable ccache
export PATH=/usr/lib/ccache:$PATH

source ~/.bash_aliases

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

# Caffe--dependency
# export LD_LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH
# export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig:$PKG_CONFIG_PATH

# The next line updates PATH for the Google Cloud SDK.
source '/usr0/home/venkatrn/projects/third_party/google-cloud-sdk/path.bash.inc'

# The next line enables bash completion for gcloud.
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

eval $BASH_POST_RC
export BASH_POST_RC=''

