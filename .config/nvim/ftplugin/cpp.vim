let g:compile_cur_file="!g++ --std=c++20 -fsanitize=undefined % -o Program"
let g:compile_and_run=g:compile_cur_file . " && " . "./Program"
let g:exe_program_in_term="alacritty --config-file=$HOME/.config/alacritty/alacritty_no_transparency.yml --class=Program -e sh -c './Program;read'"
let g:compile_and_run_in_term = g:compile_cur_file . " && " . g:exe_program_in_term

fu! CPP(...)
    exe "w"
    let pd=getcwd()
    cd `=g:codesdir`
    if a:0 == 0
        exe g:compile_and_run . "<Input.txt &> Output.txt"
    elseif a:1 == 0
        exe g:compile_and_run . "<Input.txt > Output.txt"
    elseif a:1 == 1
        exe g:compile_and_run_in_term
    elseif a:1 == 2
        exe g:compile_and_run . "<Input.txt"
    elseif a:1 == 3
        exe g:compile_and_run . "<Input.txt >> Output.txt"
    endif
    cd `=pd`
endfu

fu UpdateInput()
    exe "silent !xclip -o -sel clip > " . g:codesdir . "/Input.txt"
endfu

fu CopyOutput()
    exe "silent !xclip -sel clip " . g:codesdir . "/Output.txt"
endfu

fu! EnableClangd()
    :! [ -d settings ] && mv settings .vim
    :CocRestart
endfu

autocmd ExitPre * ![ -d .vim ] && mv .vim settings

map <silent><F8> :call EnableClangd()<CR> 

"IO
imap <F12> <Esc> :call CPP(0) <CR>
map <F12> :call CPP(0) <CR>
"IO+stderr
imap <F11> <Esc> :call CPP() <CR>
map <F11> :call CPP() <CR>
"Input only
imap <F9> <Esc> :call CPP(2) <CR>
map <F9> :call CPP(2) <CR>
"Input+terminal
imap <F10> <Esc> :call CPP(1) <CR>
map <F10> :call CPP(1) <CR>
"Input+Append
imap <F7> <Esc> :call CPP(3) <CR>
map <F7> :call CPP(3) <CR>

map<silent><F4> :call UpdateInput() <CR>
map<silent><F3> :call CopyOutput() <CR>

map <silent><Leader>tl :call CocAction('toggleService', 'clangd')<CR>
map <silent><Leader>td :call CocAction('diagnosticToggle', 'clangd')<CR>
