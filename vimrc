set clipboard=exclude:.* "speed vim startup"
set nocompatible
call plug#begin('~/.vim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'itchyny/lightline.vim'
Plug 'liuchengxu/space-vim-dark'
Plug 'scrooloose/nerdcommenter', {'keys': ['<Leader>cc', '<Leader>cu']}
Plug 'Yggdroot/LeaderF', {'do': ':LeaderfInstallCExtension'}
call plug#end()

" filetype
filetype plugin indent on

" cursor and ruler
set cursorline ruler showcmd backspace=2 t_Co=256 encoding=utf-8 laststatus=2

" tab
set expandtab tabstop=4 shiftwidth=4 softtabstop=4 autoindent shiftround copyindent

"backup
set nobackup autoread nowrap noswapfile

"search 
set hlsearch incsearch smartcase showmatch ignorecase timeoutlen=800
set shm+=I "close the startup window

"undo, and you can undo even file reopen
set undofile undodir=$HOME/.dotfiles/vim/vimundo

let g:mapleader = " "
nnoremap <Leader>j <c-w>j
nnoremap <Leader>k <c-w>k
nnoremap <Leader>h <c-w>h
nnoremap <Leader>l <c-w>l
nnoremap <Leader>w <c-w>w
nnoremap <Leader>n :set invnumber <CR>
nnoremap <Leader>p :set invpaste <CR>
nnoremap <Leader>z <c-z>
nnoremap <Leader>s :w <CR>
nnoremap <Leader>x :x <CR>
nnoremap <Leader>q :q <CR>
nnoremap <silent><Leader>/ :nohls<CR>
nnoremap <Leader>t :%retab! <CR>

" colorscheme desert
colorscheme space-vim-dark

let g:lightline = {'colorscheme': 'wombat','active': {'left': [ [ 'mode', 'paste' ], [ 'readonly', 'filename', 'modified']]}}

" LeaderF 
let g:Lf_WindowPosition = 'popup'
let g:Lf_ShortcutF = "<leader>fe"
nnoremap <leader>ff :LeaderfFunction<cr>
nnoremap <leader>fm :LeaderfMru<cr>
nnoremap <leader>ft :LeaderfBufTag<cr>
nnoremap <leader>fs :LeaderfSelf<cr>
nnoremap <leader>fl :LeaderfLine<cr>
nnoremap <leader>fb :LeaderfBuffer<cr>
nnoremap <leader>fw :LeaderfWindow<cr>

" NerdCommenter 
let g:NERDSpaceDelims = 1  " add space 

" coc-vim 
let g:coc_global_extensions = ['coc-python']
set updatetime=300
set signcolumn=yes
nmap <silent><nowait> [g <Plug>(coc-diagnostic-prev)
nmap <silent><nowait> ]g <Plug>(coc-diagnostic-next)
nmap <silent> <leader>cf  <Plug>(coc-format)
autocmd CursorHold * silent call CocActionAsync('highlight')
inoremap <silent><expr> <TAB> coc#pum#visible() ? coc#pum#next(1):CheckBackspace() ? "\<Tab>":coc#refresh()
