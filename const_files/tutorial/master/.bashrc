# .bashrc

# User specific aliases and functions

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

export LOSF_CONFIG_DIR=/home/losf/ec2-losf/
export PS1='[\u@SMS \W]\$ '
