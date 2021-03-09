let g:codesdir=$HOME . "/Codes/X"
fu! CPP(...)
    exe "w"
    let pd=getcwd()
    cd `=g:codesdir`
    if a:0 == 0
        !g++ --std=c++17 -g -fsanitize=undefined % -o Program  && ./Program<Input.txt &> Output.txt
    elseif a:1 == 0
        !g++ --std=c++17 -g -fsanitize=undefined % -o Program  && ./Program<Input.txt > Output.txt
    elseif a:1 == 1
        !g++ --std=c++17 -g -fsanitize=undefined % -o Program  && gnome-terminal -- bash -c "./Program<Input.txt;read"
    elseif a:1 == 2
        !g++ --std=c++17 -g -fsanitize=undefined % -o Program && ./Program < Input.txt
    endif
    cd `=pd`
endfu
"IO
imap <F12> <Esc> :call CPP(0) <CR>
map <F12> :call CPP(0) <CR>
"IO+stderr
imap <F11> <Esc> :call CPP() <CR>
map <F11> :call CPP() <CR>
"Input only
imap <F10> <Esc> :call CPP(2) <CR>
map <F10> :call CPP(2) <CR>
"Input+terminal
imap <F10> <Esc> :call CPP(1) <CR>
map <F10> :call CPP(1) <CR>

map <Leader>tc :call CocAction('toggleService', 'clangd')<CR>
