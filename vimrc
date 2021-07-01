set clipboard=exclude:.* "speed vim startup" 
set nocompatible
call plug#begin('~/.vim/plugged')
Plug 'easymotion/vim-easymotion'
Plug 'Yggdroot/indentLine'
Plug 'Valloric/YouCompleteMe'
Plug 'scrooloose/nerdcommenter'
Plug 'jiangmiao/auto-pairs'
Plug 'itchyny/lightline.vim'
Plug 'dstein64/vim-startuptime'
Plug 'liuchengxu/vim-which-key'
Plug 'dense-analysis/ale'
call plug#end()

filetype plugin indent on
autocmd Filetype xml if getfsize(@%) > 1000000 | setlocal syntax=OFF | endif

set mouse= cursorline ruler showcmd backspace=2 t_Co=256 encoding=utf-8 laststatus=2 "basic
set expandtab tabstop=4 shiftwidth=4 softtabstop=4 autoindent "indent
set writebackup noswapfile undofile autoread nowrap "edit
set hlsearch showmatch ignorecase "search
set timeoutlen=300 "trigger time

let g:mapleader = "\<Space>"
nnoremap <silent> <leader> :<c-u>WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :<c-u>WhichKeyVisual '<Space>'<CR>

call which_key#register('<Space>', "g:which_key")
let g:which_key = {
        \'n' : [':set invnumber', 'linenumber'],
        \'/' : [':let @/ = ""', 'clear search'],
        \'p' : [':set invpaste paste?', 'paste'],
        \'l' : {
                \'name' : '+mysettings'                      ,
                \'z' : ['<c-z>'          , 'append']         ,
                \'x' : [':x'         , 'save and exit']  ,
                \'w' : [':w'    , 'save']           ,
                \'q' : [':q'    , 'exit']           ,
                \'/' : ['<Leader>/'      , 'cancel highlight']           ,
                \'v' : {
                        \ 'name' : '+vimrc'                         , 
                        \ 'v' :  [':e $MYVIMRC',   'open-vimrc']    ,
                        \ 'r' :  [':source $MYVIMRC',   'source-vimrc'],
                    \},
            \},
        \'f' : {'name' : '+search',
                \ 'f'  : ['<Plug>(easymotion-overwin-f2)', 'easymotion-f2)'],
                \ 'd'  : ['<Plug>(easymotion-overwin-line)', 'easymotion-line'],
            \},
        \'w' : {'name' : '+windows' ,
                \ 'w' : ['<C-W>w'     , 'other-window']          ,
                \ 'd' : ['<C-W>c'     , 'delete-window']         ,
                \ '2' : ['<C-W>v'     , 'layout-double-columns'] ,
                \ 'h' : ['<C-W>h'     , 'window-left']           ,
                \ 'j' : ['<C-W>j'     , 'window-below']          ,
                \ 'l' : ['<C-W>l'     , 'window-right']          ,
                \ 'k' : ['<C-W>k'     , 'window-up']             ,
                \ 'H' : ['<C-W>5<'    , 'expand-window-left']    ,
                \ 'J' : [':resize +5'  , 'expand-window-below']   ,
                \ 'L' : ['<C-W>5>'    , 'expand-window-right']   ,
                \ 'K' : [':resize -5'  , 'expand-window-up']      ,
                \ '=' : ['<C-W>='     , 'balance-window']        ,
                \ 's' : ['<C-W>s'     , 'split-window-below']    ,
                \ 'v' : ['<C-W>v'     , 'split-window-right']    ,
            \},
        \}

let g:lightline = {'colorscheme': 'wombat','active': {'left': [ [ 'mode', 'paste' ], [ 'readonly', 'filename', 'modified']]}}
colorscheme space-vim-dark
hi Comment guifg=#5C6370 ctermfg=59 "Comment grey color"

let g:ycm_disable_for_files_larger_than_kb = 2000 "Youcompleteme
let g:ycm_key_detailed_diagnostics = ''
highlight PMenu ctermfg=0 ctermbg=242 guifg=black guibg=darkgrey
highlight PMenuSel ctermfg=242 ctermbg=8 guifg=darkgrey guibg=black

"nnoremap <Leader>ts :ALEToggle<CR>
let g:ale_linters = {'python': ['flake8', 'pylint']}
let g:ale_python_flake8_options = '--ignore=E501,W291,W391,N806,F405,F841'
let g:ale_python_pylint_options = '--disable=C0411, C0301, C0114'
let g:ale_set_highlights = 0
let g:ale_echo_msg_format = '[%linter%-%code%] %s [%severity%]'
let b:ale_warn_about_trailing_whitespace = 0