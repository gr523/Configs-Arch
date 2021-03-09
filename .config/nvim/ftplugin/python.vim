let g:codesdir=$HOME . "/Codes/X"
fu! PY3(...)
    exe "w"
    let pd=getcwd()
    cd `=g:codesdir`
    if a:0 == 0
        !python3 % &>Output.txt<Input.txt 
    elseif a:1 == 0
        !python3 % >Output.txt<Input.txt 
    elseif a:1 == 1
       !python3 % <Input.txt 
    endif
    cd `=pd`
endfu

imap <F12> <Esc> :call PY3(0) <CR>
map <F12> <Esc> :call PY3(0) <CR>
map <F11> :call PY3() <CR>
map <F10>  :call PY3(1) <CR>