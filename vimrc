set clipboard=exclude:.* "speed vim startup"
set nocompatible
call plug#begin('~/.vim/plugged')
Plug 'Yggdroot/indentLine'
Plug 'Valloric/YouCompleteMe'
Plug 'scrooloose/nerdcommenter'
Plug 'jiangmiao/auto-pairs'
Plug 'itchyny/lightline.vim'
Plug 'dstein64/vim-startuptime'
Plug 'liuchengxu/vim-which-key'
Plug 'liuchengxu/space-vim-dark'
Plug 'Chiel92/vim-autoformat'
call plug#end()

filetype plugin indent on
autocmd Filetype xml if getfsize(@%) > 1000000 | setlocal syntax=OFF | endif

set mouse= cursorline ruler showcmd backspace=2 t_Co=256 encoding=utf-8 laststatus=2 "basic
set expandtab tabstop=4 shiftwidth=4 softtabstop=4 autoindent "indent
set nobackup autoread nowrap noswapfile "edit
set hlsearch showmatch ignorecase "search
set timeoutlen=800 "trigger time
set undofile undodir=$HOME/.dotfiles/vim/.vimundo
set shm+=I "close the startup window

let g:mapleader = " "
nmap <Leader>j <c-w>j
nmap <Leader>k <c-w>k
nmap <Leader>h <c-w>h
nmap <Leader>l <c-w>l
nmap <Leader>w <c-w>w
nmap <Leader>n :set invnumber <CR>
nmap <Leader>p :set invpaste <CR>
nmap <Leader>z <c-z>
nmap <Leader>s :w <CR>
nmap <Leader>x :x <CR>
nmap <Leader>q :q <CR>
nmap <Leader>; :AutoformatLine <CR>
noremap <silent><Leader>/ :nohls<CR>

let g:lightline = {'colorscheme': 'wombat','active': {'left': [ [ 'mode', 'paste' ], [ 'readonly', 'filename', 'modified']]}}
colorscheme space-vim-dark
hi Comment guifg=#5C6370 ctermfg=59
"hi Normal     ctermbg=NONE guibg=NONE
"hi LineNr     ctermbg=NONE guibg=NONE
"hi SignColumn ctermbg=NONE guibg=NONE

let g:ycm_global_ycm_extra_conf = '~/.vim/plugged/YouCompleteMe/third_party/ycmd/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf=0
let g:ycm_disable_for_files_larger_than_kb = 1000
let g:ycm_key_detailed_diagnostics = ''
set completeopt=menu,menuone
let g:ycm_min_num_identifier_candidate_chars = 2
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_complete_in_strings=1
let g:ycm_add_preview_to_completeopt = 0
let g:ycm_show_diagnostics_ui = 0
highlight PMenu ctermfg=0 ctermbg=242 guifg=black guibg=darkgrey
highlight PMenuSel ctermfg=242 ctermbg=8 guifg=darkgrey guibg=black