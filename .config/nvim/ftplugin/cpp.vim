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
        ! g++ --std=c++11 -c % -o main.o ; g++ main.o -o Program -lsfml-graphics -lsfml-window -lsfml-system && ./Program 
    elseif a:1 == 3
        ! g++ --std=c++11 -c % -o main.o ; g++ main.o -o Program && ./Program>Output.txt 
    elseif a:1 == 4
        ! g++ --std=c++11 -c % -o main.o ; g++ main.o -o Program && ./Program
    endif
    cd `=pd`
endfu

imap <F12> <Esc> :call CPP(0) <CR>
map <F12> :call CPP(0) <CR>
map <F8>  :call CPP(2) <CR>
map <F11> :call CPP(0) <CR><CR>:!xdotool key Super_L+Tab;xdotool key Super_L+Tab <CR> 
map <F9>  :call CPP(3) <CR>
map <F10> :call CPP(4) <CR>
map <Leader>tc :call CocAction('toggleService', 'clangd')<CR>
