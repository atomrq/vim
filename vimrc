set clipboard=exclude:.* "speed vim startup" 
set nocompatible
call plug#begin('~/.vim/plugged')
Plug 'easymotion/vim-easymotion'
Plug 'Yggdroot/indentLine'
Plug 'Valloric/YouCompleteMe'
Plug 'scrooloose/nerdcommenter'
Plug 'jiangmiao/auto-pairs'
Plug 'flazz/vim-colorschemes'
Plug 'itchyny/lightline.vim'
Plug 'dstein64/vim-startuptime'
call plug#end()

filetype plugin indent on
set mouse= cursorline ruler showcmd backspace=2 t_Co=256 encoding=utf-8 laststatus=2
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
nmap     <Leader>s <Plug>(easymotion-overwin-f2)
map      <Leader>L <Plug>(easymotion-bd-jk)
nmap     <Leader>L <Plug>(easymotion-overwin-line)

nmap <F5> :set invnumber<CR>
nnoremap <F8> :set invpaste paste?<CR>
set pastetoggle=<F8>

cmap w!! w !sudo tee >/dev/null %
noremap <silent><Space>/ :nohls<CR>

set expandtab tabstop=4 shiftwidth=4 softtabstop=4 autoindent "indent
set writebackup noswapfile undofile autoread nowrap "edit
set hlsearch showmatch ignorecase "search

let g:lightline = {'colorscheme': 'wombat','active': {'left': [ [ 'mode', 'paste' ], [ 'readonly', 'filename', 'modified']]}}
colorscheme space-vim-dark
hi Comment guifg=#5C6370 ctermfg=59 "Comment grey color"
let g:space_vim_dark_background = 255 

let g:ycm_disable_for_files_larger_than_kb = 2000 "Youcompleteme
highlight PMenu ctermfg=0 ctermbg=242 guifg=black guibg=darkgrey
highlight PMenuSel ctermfg=242 ctermbg=8 guifg=darkgrey guibg=black