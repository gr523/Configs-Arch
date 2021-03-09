fu! RunAfter()
    call CocAction('toggleService', 'clangd')
endfu

autocmd VimEnter * call timer_start(1000, { tid -> execute("call RunAfter()")})
