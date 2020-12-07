call plug#begin('~/.config/nvim/plugged')
    Plug 'https://github.com/jiangmiao/auto-pairs'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'patstockwell/vim-monokai-tasty'
    Plug 'junegunn/fzf.vim'
    Plug 'morhetz/gruvbox'
call plug#end()

let g:codesdir=$HOME . "/Codes/X"

let ftToIgnore = ['cpp']
autocmd VimEnter * if index(ftToIgnore, &ft) < 0 | colo gruvbox | call Defaultcolor()

set wildmenu
set path+=**

set mouse=a
set nu rnu
set cursorline
set guicursor=
set termguicolors

set ignorecase
set smartcase

set statusline+=\ %M\ %y\ %r\ %F 
set statusline+=%=
set statusline+=\ %l/%L\ %p%%

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
imap <expr> <Tab> pumvisible() ? "\<Down>" : "\<Tab>"
imap <expr> <S-Tab> pumvisible() ? "\<Up>" : "\<S-Tab>"

"Copying to the system clipboard
vmap <C-c> "+y
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

autocmd FileType cpp call Cppbindings() | colo vim-monokai-tasty 

let &winminwidth=0
fu Ftog()
    if winwidth(0) > 76
        vert res 76
    else
        vert res 100
    endif
endfu

map <silent> <A-\> :call Ftog() <CR>
