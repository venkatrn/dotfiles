AGENT="ssh-agent -s"
if [ ! -d $HOME/.ssh/agent ]; then
        mkdir -p $HOME/.ssh/agent
fi
#
# Start an agent if there isn't one running already.
#
pid=`ps -u$LOGNAME | grep ssh-age | awk '{print $1}'`
if [ -z "$pid" ]; then
        $AGENT | grep -v echo > $HOME/.ssh/agent/$HOST & pid=$!
        sleep 1 # Let it fork and stuff
fi

eval `ssh-agent -s`
ssh-add $HOME/.ssh/id_rsa

if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi
