set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree.git'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'nanotech/jellybeans.vim'
Plugin 'itchyny/lightline.vim'
Plugin 'scrooloose/syntastic.git'
Plugin 'nathanaelkane/vim-indent-guides.git'
Plugin 'mileszs/ack.vim'
Plugin 'tomtom/tcomment_vim'
Plugin 'easymotion/vim-easymotion'
Plugin 'airblade/vim-gitgutter'
Plugin 'simnalamburt/vim-mundo'
Plugin 'mhinz/vim-startify'

Plugin 'tpope/vim-rails'
Plugin 'pangloss/vim-javascript'
Plugin 'kchmck/vim-coffee-script'
Plugin 'mxw/vim-jsx'
Plugin 'elixir-lang/vim-elixir.git'
Plugin 'slim-template/vim-slim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" terminal
setglobal fileencoding=utf-8
set encoding=utf-8
set lazyredraw
syntax on

" splits
set splitbelow
set splitright

" font
set guifont=Inconsolata:h14

" line
set number " show line numbers
set cursorline " highlight current line

" tabs and indentation
set autoindent
set smartindent
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set backspace=indent,eol,start

" list settings
set list
set listchars=""
set listchars=tab:→\
set listchars+=trail:◦

" search
set incsearch " search as characters are entered
set hlsearch " highlight search results
set ignorecase
set smartcase
set showmatch " highlight matching [{()}]

" menu
set wildmenu " visual autocomplete for command menu

" backups
set backup
set backupdir=~/.vim/backup
set backupskip=/tmp/*
set directory=~/.vim/tmp
set writebackup

" clipboard
set clipboard=unnamed " make yy, D, P work with system clipboard

" jellybeans
set background=dark
colorscheme jellybeans

" lightline
set noshowmode " dont show default -- INSERT -- line
let g:lightline = {
  \ 'colorscheme': 'jellybeans',
  \ 'active': {
  \ 'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'readonly', 'filename', 'modified' ] ]
  \ },
  \ 'component': {
  \   'readonly': '%{&filetype=="help"?"":&readonly?"READONLY":""}',
  \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
  \   'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}'
  \ },
  \ 'component_visible_condition': {
  \   'readonly': '(&filetype!="help"&& &readonly)',
  \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
  \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
  \ }
  \ }

" CtrlP
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Indent Guides
let g:indent_guides_enable_on_vim_startup = 1

" Mundo
" Enable persistent undo so that undo history persists across vim sessions
set undofile
set undodir=~/.vim/undo

" Key Bindings
let mapleader = "\<Space>"
" turn off search highlight
nnoremap <leader><backspace> :nohlsearch<CR>

" toggle gundo
nnoremap <leader>u :MundoToggle<CR>

" open CtrlP
nnoremap <Leader>o :CtrlP<CR>

" unmap IndentGuidesToggle
let g:indent_guides_default_mapping = 0

" PageUp/Down move cursor
map <silent> <PageUp> 1000<C-U>
map <silent> <PageDown> 1000<C-D>
imap <silent> <PageUp> <C-O>1000<C-U>
imap <silent> <PageDown> <C-O>1000<C-D>

" keep v-line after indenting
xnoremap < <gv
xnoremap > >gv

" WARNING - NONSTANDARD KEY MAPPINGS BELOW
" PROCEED AT YOUR OWN RISK

" insert is h. I know that sounds crazy
" but I cannot use hjkl for movement
" I use ijkl, a right hand version of wasd (think FPS games)
" i == up, j == left, k == down, l == right
nnoremap h i
nnoremap j h

" these are so that up and down do not pass over code/text
" that span multiple lines
nnoremap k gj
nnoremap i gk

" bind page up to C-I and page down to C-K
nnoremap <C-I> <C-U>
nnoremap <C-K> <C-D>

" split traversal using Leader + ijkl
nnoremap <Leader>i <C-W><C-K>
nnoremap <Leader>j <C-W><C-H>
nnoremap <Leader>k <C-W><C-J>
nnoremap <Leader>l <C-W><C-L>
