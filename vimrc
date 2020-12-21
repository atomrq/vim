set clipboard=exclude:.* "speed vim startup" 
set nocompatible

call plug#begin('~/.vim/plugged')
Plug 'easymotion/vim-easymotion'
Plug 'junegunn/vim-easy-align'
Plug 'dense-analysis/ale'
Plug 'Yggdroot/indentLine'
Plug 'Valloric/YouCompleteMe'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle'  }
Plug 'tpope/vim-surround'
Plug 'mhinz/vim-startify'
Plug 'jiangmiao/auto-pairs'
Plug 'chxuan/change-colorscheme'
Plug 'flazz/vim-colorschemes'
Plug 'junegunn/fzf', { 'dir': '~/.vim/fzf', 'do': './install --all', 'for':'none'}
Plug 'yianwillis/vimcdoc'
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable'  }
Plug 'Yggdroot/LeaderF', { 'do': './install.sh','for':'markdown'}
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'itchyny/lightline.vim'
Plug 'dstein64/vim-startuptime', { 'for': 'clojure'  }
Plug 'ybian/smartim'
call plug#end()

"==============BASIC CONFIGURATION=====================
set laststatus=2
filetype plugin indent on
syntax on
set mouse=                     "set mouse= means mouse can not be used in vim at any mode"
set t_Co=256                   " use 256-color in terminal 
set backspace=2                 
set encoding=utf-8
set cmdheight=2
set cursorline
set ruler
set showcmd

"syntax off for large file (unit: bytes)
autocmd Filetype xml if getfsize(@%) > 5000000 | setlocal syntax=OFF | endif

"set <Leader> Key nnoremap <SPACE> <Nop>
let mapleader=" "
noremap <Leader>z <c-z>
noremap <Leader>q :x<CR>
noremap <Leader>a :w<CR>

"mappings
nnoremap <Leader>ev :vsplit $MYVIMRC<cr>
nnoremap <Leader>sv :source $MYVIMRC<cr>

"move between windows 
nnoremap <Leader>h <c-w>h
nnoremap <Leader>j <c-w>j
nnoremap <Leader>k <c-w>k
nnoremap <Leader>l <c-w>l

" In command mode, move normally by using Ctrl
cnoremap <c-h> <Left>
cnoremap <c-j> <Down>
cnoremap <c-k> <Up>
cnoremap <c-l> <Right>

let NERDSpaceDelims = 1
nmap <F5> :set invnumber<CR>
nmap <F6> :NERDTreeToggle<CR>
nnoremap <F8> :set invpaste paste?<CR>
set pastetoggle=<F8>

cmap w!! w !sudo tee >/dev/null %
noremap <silent><leader>/ :nohls<CR>

"paste mode: no auto insert // if #, //, " in pasted contents.
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "no rm $"|endif|endif
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

"indent
set expandtab                   " tab=<Space>
set tabstop=4                   " tab indent 4 space
set shiftwidth=4                
set softtabstop=4              
set autoindent                

"edit
set writebackup "save file before backup, then delete after it is saved" 
set noswapfile
set undofile
set autoread "renew file when modified outside
set nowrap "do not warp line automatically

"search
set hlsearch
set incsearch  
set ignorecase 
set smartcase 
set showmatch

"========================================================
" linghtline 
    let g:lightline = {
       \ 'colorscheme': 'wombat',
       \ 'active': {
       \   'left': [ [ 'mode', 'paste' ],
       \             [ 'readonly', 'filename', 'modified'] ]
       \ }}

"========================================================                                                                                                                 
"easymotion
    let g:EasyMotion_do_mapping = 0 " Disable default mappings"
    let g:EasyMotion_smartcase = 1

    " <Leader>f{char} to move to {char}
    map  <Leader>f <Plug>(easymotion-bd-f)
    nmap <Leader>f <Plug>(easymotion-overwin-f)

    " s{char}{char} to move to {char}{char}
    " nmap <Leader>s <Plug>(easymotion-overwin-f2)
    " nmap <Leader>s <Plug>(easymotion-overwin-f2)

    " Move to line
    map <Leader>l <Plug>(easymotion-bd-jk)
    nmap <Leader>l <Plug>(easymotion-overwin-line)

    " Move to word
    map  <Leader>w <Plug>(easymotion-bd-w)
    nmap <Leader>w <Plug>(easymotion-overwin-w)

    map  / <Plug>(easymotion-sn)
    omap / <Plug>(easymotion-tn)

"========================================================
"colorscheme
    colorscheme space-vim-dark
    " hi Normal     ctermbg=NONE guibg=NONE
    " hi LineNr ctermbg=NONE guibg=NONE
    " hi SignColumn ctermbg=NONE guibg=NONE
    hi Comment guifg=#5C6370 ctermfg=59 "Comment grey color"
    let g:space_vim_dark_background = 255 

"=====================================================
"ale
"Note that 235 refering to RGB-(38,38,38) current atom dark theme color
"For foreground color, 235/196 is chosen to hide the Warnings
    let g:ale_sign_column_always = 1
    let g:ale_set_highlights = 0
    let b:ale_warn_about_trailing_whitespace = 0
    let g:ale_sign_error = '✗'
    let g:ale_sign_warning = '--'
    let g:ale_echo_msg_error_str = 'E'
    let g:ale_echo_msg_warning_str = 'W'
    let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
    let g:ale_lint_on_enter = 0
    let g:ale_linters = {'c++': ['clang'], 'c': ['clang'], 'python': ['flake8']}
    let g:ale_python_flake8_options = '--ignore=F841,F401,E303,E228,E265,E501,E262,E271,E302,E261,E221,E222,E271,E272,E128' 

    nmap <Leader>r :ALEToggle<CR>
    nmap sp <Plug>(ale_previous_wrap)
    nmap sn <Plug>(ale_next_wrap)

    highlight ALEErrorSign ctermfg=196 ctermbg=235 guifg=#262626 guibg=#262626
    highlight ALEWarningSign ctermfg=196 ctermbg=235 guifg=#262626 guibg=#262626

"=======================================================
"indentline
    nmap <leader>il :IndentLinesToggle<CR>
    let g:indentLine_color_term = 239 "set indentline color

"=========================================================
"youcompleteme
    set completeopt=longest,menu "same to IDE (refer to VimTip1228)
    " autocmd InsertLeave * if pumvisible() == 0|pclose|endif "shut down window when autocompletion over
    " map keys, otherwise other tab will not work well 
    " inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>" 

    let g:ycm_add_preview_to_completeopt = 0
    let g:ycm_autoclose_preview_window_after_completion = 0
    let g:ycm_autoclose_preview_window_after_insertion = 0

    let g:ycm_min_num_of_chars_for_completion=1 
    let g:ycm_min_num_identifier_candidate_chars = 0
    let g:ycm_max_num_candidates = 30
    let g:ycm_max_num_identifier_candidates = 10

    let g:ycm_confirm_extra_conf=0
    let g:ycm_cache_omnifunc=0
    let g:ycm_seed_identifiers_with_syntax=1
    let g:ycm_complete_in_comments = 1
    let g:ycm_show_diagnostics_ui = 0
    let g:ycm_collect_identifiers_from_comments_and_strings = 1
    let g:ycm_complete_in_strings=1
    let g:ycm_disable_for_files_larger_than_kb = 2000
    highlight PMenu ctermfg=0 ctermbg=242 guifg=black guibg=darkgrey
    highlight PMenuSel ctermfg=242 ctermbg=8 guifg=darkgrey guibg=black
