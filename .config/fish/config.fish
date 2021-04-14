#!/bin/fish
set fish_greeting
set _ZL_MATCH_MODE 1
set PATH $PATH:$HOME/bin:$HOME/.local/bin
set -x MANPAGER "/bin/sh -c \"unset PAGER;col -b -x | \
    vi -R -c 'set ft=man nomod nolist' -c 'map q :q<CR>' \
    -c 'map <SPACE> <C-D>' -c 'map b <C-U>' \
    -c 'nmap K :Man <C-R>=expand(\\\"<cword>\\\")<CR><CR>' -\""


#source /usr/share/fish/vendor_functions.d/fzf_key_bindings.fish
fzf_key_bindings
