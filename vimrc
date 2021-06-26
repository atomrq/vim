set clipboard=exclude:.* "speed vim startup" 
set nocompatible

call plug#begin('~/.vim/plugged')
Plug 'easymotion/vim-easymotion'
Plug 'Yggdroot/indentLine'
Plug 'Valloric/YouCompleteMe'
Plug 'scrooloose/nerdcommenter'
Plug 'mhinz/vim-startify'
Plug 'jiangmiao/auto-pairs'
Plug 'flazz/vim-colorschemes'
Plug 'itchyny/lightline.vim'
Plug 'dstein64/vim-startuptime'
call plug#end()

set laststatus=2
filetype plugin indent on
set mouse=                     "set mouse= means mouse can not be used in vim at any mode"
set t_Co=256                   " use 256-color in terminal 
set backspace=2                 
set encoding=utf-8
set cursorline
set ruler
set showcmd

autocmd Filetype xml dat if getfsize(@%) > 5000000 | setlocal syntax=OFF | endif

let mapleader=","
noremap  <Leader>z <c-z>
noremap  <Leader>q :x<CR>
noremap  <Leader>a :w<CR>
inoremap <Leader>w <Esc>
nnoremap <Leader>h <c-w>h
nnoremap <Leader>j <c-w>j
nnoremap <Leader>k <c-w>k
nnoremap <Leader>l <c-w>l
nmap <leader>s <Plug>(easymotion-overwin-f2)
map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)

nmap <F5> :set invnumber<CR>
nnoremap <F8> :set invpaste paste?<CR>
set pastetoggle=<F8>

cmap w!! w !sudo tee >/dev/null %
noremap <silent><leader>/ :nohls<CR>

set expandtab                   " tab=<Space>
set tabstop=4                   " tab indent 4 space
set shiftwidth=4                
set softtabstop=4              
set autoindent                

set writebackup "save file before backup, then delete after it is saved" 
set noswapfile
set undofile
set autoread "renew file when modified outside
set nowrap "do not warp line automatically

set hlsearch
set showmatch
set ignorecase

let g:lightline = {'colorscheme': 'wombat','active': {'left': [ [ 'mode', 'paste' ], [ 'readonly', 'filename', 'modified']]}}

colorscheme space-vim-dark
hi Comment guifg=#5C6370 ctermfg=59 "Comment grey color"
let g:space_vim_dark_background = 255 

let g:ycm_disable_for_files_larger_than_kb = 2000 "Youcompleteme
highlight PMenu ctermfg=0 ctermbg=242 guifg=black guibg=darkgrey
highlight PMenuSel ctermfg=242 ctermbg=8 guifg=darkgrey guibg=black
