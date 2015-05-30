# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
export PATH=/opt/mono/bin:$HOME/.local/bin:/usr/local/bin:$PATH
export LD_LIBRARY_PATH=$HOME/.local/lib:/usr/local/lib:$LD_LIBRARY_PATH
#export LIBRARY_PATH=$HOME/.local/lib:/usr/local/lib:$LIBRARY_PATH
export C_INCLUDE_PATH=$HOME/.local/include:/usr/local/include:/usr/src/gtest/include:$C_INCLUDE_PATH
export CPLUS_INCLUDE_PATH=$HOME/.local/include:/usr/local/include:/usr/src/gtest/include:$CPLUS_INCLUDE_PATH
export PKG_CONFIG_PATH=$HOME/.local/pkgconfig:/usr/local/lib/pkgconfig:$PKG_CONFIG_PATH
export EDITOR=/usr/bin/vim
