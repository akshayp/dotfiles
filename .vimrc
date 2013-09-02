" General Settings"

set nocompatible
set clipboard=unnamed
set wildmenu
set esckeys
set backspace=indent,eol,start
set ttyfast
set gdefault
set encoding=utf-8 nobomb
let mapleader=","
set binary
set noeol
set exrc
set secure

" Make Code Editing Better"

set modeline
set modelines=4
set number
syntax on
set cursorline
set tabstop=4
set list
set hlsearch
set ignorecase
set incsearch
set laststatus=2
set mouse=a
set noerrorbells
set nostartofline
set ruler
set shortmess=atI
set showmode
set title
set showcmd

if exists("&relativenumber")
    set relativenumber
    au BufReadPost * set relativenumber
endif

set scrolloff=3

" Remaps"
function! StripWhitespace()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    :%s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfunction

noremap <leader>ss :call StripWhitespace()<CR>
noremap <leader>W :w !sudo tee % > /dev/null<CR>

" JSON -> JS"
if has("autocmd")
    filetype on
    autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript
endif