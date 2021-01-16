set fish_greeting
set _ZL_MATCH_MODE 1
set PATH $PATH:$HOME/bin
set -x PAGER "/bin/sh -c \"unset PAGER;col -b -x | \
    vi -R -c 'set ft=man nomod nolist' -c 'map q :q<CR>' \
    -c 'map <SPACE> <C-D>' -c 'map b <C-U>' \
    -c 'nmap K :Man <C-R>=expand(\\\"<cword>\\\")<CR><CR>' -\""

for f in ~/.config/fish/functions/custom/*
  source $f
end


function bind_bang
    switch (commandline -t)[-1]
        case "!"
            commandline -t $history[1]; commandline -f repaint
        case "*"
            commandline -i !
    end
end

function bind_dollar
    switch (commandline -t)[-1]
        case "!"
            commandline -t ""
            commandline -f history-token-search-backward
        case "*"
            commandline -i '$'
    end
end

function fish_user_key_bindings
    bind ! bind_bang
    bind '$' bind_dollar
end

#source /usr/share/fish/vendor_functions.d/fzf_key_bindings.fish
fzf_key_bindings
