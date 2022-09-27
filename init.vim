set nocompatible            " disable compatibility to old-time vi
filetype off

call plug#begin("~/.vim/plugged")
  " Plugin Section
  Plug 'f-person/git-blame.nvim'
  Plug 'itchyny/lightline.vim'
  Plug 'ryanoasis/vim-devicons'
  Plug 'neovim/nvim-lspconfig'
  Plug 'hrsh7th/nvim-cmp'
  Plug 'hrsh7th/cmp-nvim-lsp'
  Plug 'onsails/lspkind.nvim'
  Plug 'scrooloose/nerdtree'
  Plug 'mhinz/vim-startify'
  Plug 'ctrlpvim/ctrlp.vim'
  Plug 'lukas-reineke/indent-blankline.nvim'
  Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
  Plug 'nvim-lua/plenary.nvim'
  Plug 'lewis6991/gitsigns.nvim'
  Plug 'sheerun/vim-polyglot'
  Plug 'psliwka/vim-smoothie'
  Plug 'tomtom/tcomment_vim'
  Plug 'mileszs/ack.vim'
  Plug 'easymotion/vim-easymotion'
  Plug 'github/copilot.vim'
call plug#end()


set encoding=utf8
filetype plugin indent on   "allow auto-indenting depending on file type
let g:airline_powerline_fonts = 1
set mouse=v                 " middle-click paste with 
set relativenumber number   " add current line number and relative numbers
set wildmode=longest,list   " get bash-like tab completions
set cc=80                   " set an 80 column border for good coding style
syntax on                   " syntax highlighting
set mouse=
set clipboard=unnamedplus   " using system clipboard
set cursorline              " highlight current cursorline
set ttyfast                 " Speed up scrolling in Vim
set history=1000
set undolevels=1000
set title
set visualbell
set noerrorbells
set autoread
" set spell                 " enable spell check (may need to download language package)
" set noswapfile            " disable creating swap file
" set backupdir=~/.cache/vim " Directory to store backup files.

" Ack
let g:ack_mappings = { "<C-s>": "<C-W><CR><C-W>K", "<C-v>": "<C-W><CR><C-W>H<C-W>b<C-W>J<C-W>t" }

" tabs and indentation
set autoindent
set copyindent
set smartindent
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set backspace=indent,eol,start

" search
set incsearch " search as characters are entered
set hlsearch " highlight search results
set ignorecase
set smartcase
set showmatch " highlight matching [{()}]

" menu
set wildmenu " visual autocomplete for command menu

" color schemes
if (has("termguicolors"))
  set termguicolors
endif
syntax enable

" theme
colorscheme tokyonight

" git signs
lua require('gitsigns').setup()


" these are so that up and down do not pass over code/text
" that span multiple lines
map j gj
map k gk

" EasyMotion
" s{char}{char} to move to {char}{char}
nmap s <Plug>(easymotion-overwin-f2)

" CtrlP
nnoremap <Leader>o :CtrlP<CR>
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" open new split panes to right and below
set splitright
set splitbelow

" move line or visually selected block - alt+j/k
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" move split panes to left/bottom/top/right
nnoremap <A-h> <C-W>H
nnoremap <A-j> <C-W>J
nnoremap <A-k> <C-W>K
nnoremap <A-l> <C-W>L

" move between panes to left/bottom/top/right
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Press i to enter insert mode, and ii to exit insert mode.
" this is cool but seems to mess up visual block selection
" :inoremap ii <Esc>
" :inoremap jk <Esc>
" :inoremap kj <Esc>
" :vnoremap jk <Esc>
" :vnoremap kj <Esc>

" keep v-line after indenting
xnoremap < <gv
xnoremap > >gv

" open file in a text by placing text and gf
nnoremap gf :vert winc f<cr>
" copies filepath to clipboard by pressing yf
:nnoremap <silent> yf :let @+=expand('%:p')<CR>
" copies pwd to clipboard: command yd
:nnoremap <silent> yd :let @+=expand('%:p:h')<CR>
" Vim jump to the last position when reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif

  " strip whitespace on certain files
  autocmd BufWritePre *.(rb|html|erb|slim) %s/\s\+$//e
endif

lua << EOF
require('lspconfig').pyright.setup{}
-- require('lspconfig').solargraph.setup{}

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<space>f', vim.lsp.buf.formatting, bufopts)
end

local lsp_flags = {
  -- This is the default in Nvim 0.7+
  debounce_text_changes = 150,
}
require('lspconfig')['pyright'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
}
require('lspconfig')['tsserver'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
}
require('lspconfig')['rust_analyzer'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
    -- Server-specific settings...
    settings = {
      ["rust-analyzer"] = {}
    }
}
EOF
