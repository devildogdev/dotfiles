typeset -U PATH path
path=( '/usr/local/sbin' '/usr/local/bin' '/usr/bin' '$HOME/.local/bin' '$path[@]')
export PATH
export LESSHISTFILE=-
export EDITOR='nvim'
