export ZAP_PATH=/home/fahim/.local/share/zap/bin
export PATH="$PATH:$HOME/bin:$HOME/.local/bin:$ZAP_PATH"
export PYTHONPATH="$HOME/Codes/pythonScripts"
export MANPAGER="/bin/sh -c \"unset MANPAGER;col -b -x | \
   vi -R -c 'set ft=man nomod nolist' -c 'map q :q<CR>' \
    -c 'map <SPACE> <C-D>' -c 'map b <C-U>' \
    -c 'nmap K :Man <C-R>=expand(\\\"<cword>\\\")<CR><CR>' -\""

export ZDOTDIR=$HOME/.config/zsh

source /home/fahim/.config/broot/launcher/bash/br

# fzf
export FZF_CTRL_T_COMMAND="fd --ignore-file ~/.fdignore -t f -i -LHI $dir 2> /dev/null | sed 's@^\./@@'"
export FZF_ALT_C_COMMAND="fd --ignore-file ~/.fdignore -i -t d -HLI  2> /dev/null | sed 's@^\./@@'"
