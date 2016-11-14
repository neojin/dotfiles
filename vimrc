set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree.git'
Plugin 'tpope/vim-fugitive'
Plugin 'nanotech/jellybeans.vim'
Plugin 'itchyny/lightline.vim'
Plugin 'scrooloose/syntastic.git'
Plugin 'nathanaelkane/vim-indent-guides.git'
Plugin 'mileszs/ack.vim'
Plugin 'tomtom/tcomment_vim'
Plugin 'easymotion/vim-easymotion'
Plugin 'airblade/vim-gitgutter'
Plugin 'sjl/gundo.vim'

Plugin 'tpope/vim-rails'
Plugin 'elixir-lang/vim-elixir.git'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" terminal
set term=screen-256color
setglobal fileencoding=utf-8
set encoding=utf-8
set lazyredraw

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

" jellybeans
set background=dark
colorscheme jellybeans

" lightline
set noshowmode " dont show default -- INSERT -- line
let g:lightline = {
  \ 'colorscheme': 'jellybeans',
  \ }

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

" Key Bindings
let mapleader = "\<Space>"
" turn off search highlight
nnoremap <leader><backspace> :nohlsearch<CR>
" toggle gundo
nnoremap <leader>u :GundoToggle<CR>
