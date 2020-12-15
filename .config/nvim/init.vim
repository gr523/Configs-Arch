call plug#begin('~/.config/nvim/plugged')
    Plug 'https://github.com/jiangmiao/auto-pairs'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'junegunn/fzf.vim'
    Plug 'morhetz/gruvbox'
    Plug 'patstockwell/vim-monokai-tasty'
    Plug 'ThePrimeagen/vim-be-good'
    Plug 'szw/vim-maximizer'
"     Plug 'puremourning/vimspector'
call plug#end()

let g:codesdir=$HOME . "/Codes/X"

let ftToIgnore = ['cpp']
autocmd VimEnter * if index(ftToIgnore, &ft) < 0 | colo gruvbox | call Defaultcolor()

autocmd FileType * setlocal formatoptions-=cro

set wildmenu
set path+=**

set shell=/usr/bin/fish
set mouse=a
set nu rnu
set cursorline
set guicursor=
set termguicolors

set ignorecase
set smartcase

set statusline=\ %M\ %r\ %f 
set statusline+=%=
set statusline+=\ [%{getcwd()}]\ %l/%L\ %p%%

set tabstop=4
set shiftwidth=4
set expandtab

set splitbelow splitright
set noequalalways

" autoreload file if its changed
autocmd Focusgained * checktime

" Clears highlighting after these commands
for s:c in ['a', 'A', '<Insert>', 'i', 'I', 'gI', 'gi', 'o', 'O', '<Esc>']
    exe 'nnoremap <silent>' . s:c . ' :noh<CR>' . s:c
endfor

"Keymapings

"Copying and Cutting to the system clipboard
vmap <C-c> "+y
vmap <C-x> <C-c>gvd

let mapleader=','
" ,, to get in normal mode
imap <Leader>, <Esc>
map <Leader>, <Esc>
cmap <Leader>, <Esc>
smap <Leader>, <Esc>
tnoremap <Leader>, <C-\><C-n>

"move between windows
map <C-l> <C-w>l
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k

map <Leader>Q :qa!<CR>
map <Leader>q :q!<CR>
map <Leader>w :w!<CR>
map <Leader>W :wq!<CR>

"Ctrl-Alt-k/j move current line up and down
nnoremap <C-A-j> :m .+1<CR>==
nnoremap <C-A-k> :m .-2<CR>==
inoremap <C-A-j> <Esc>:m .+1<CR>==gi
inoremap <C-A-k> <Esc>:m .-2<CR>==gi
vnoremap <C-A-j> :m '>+1<CR>gv=gv
vnoremap <C-A-k> :m '<-2<CR>gv=gv


let &winminwidth=0
let &winminheight=0

fu Ftog()
    if winwidth(0) > 76
        vert res 76
    else
        vert res 200
    endif
endfu

map <silent> <A-\> :MaximizerToggle <CR>
