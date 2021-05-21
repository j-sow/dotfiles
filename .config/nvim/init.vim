" Don't try to be vi compatible
set nocompatible

" Helps force plugins to load correctly when it is turned back on below
filetype off

" Plugins
call plug#begin('~/.local/share/nvim/site/plugged')

" @TODO Install those extensions via vim-plug
" See https://github.com/neoclide/coc.nvim/wiki/Using-coc-extensions#use-vims-plugin-manager-for-coc-extension
" * coc-prettier 1.1.17 ~/.config/coc/extensions/node_modules/coc-prettier
" * coc-eslint 1.2.7 ~/.config/coc/extensions/node_modules/coc-eslint
" * coc-diagnostic 0.3.0 ~/.config/coc/extensions/node_modules/coc-diagnostic
" * coc-tsserver 1.5.1 ~/.config/coc/extensions/node_modules/coc-tsserver

" Properly navigate splits when in tmux
Plug 'christoomey/vim-tmux-navigator'  
" Color schema
"Plug 'connorholyday/vim-snazzy'
Plug 'dracula/vim'
"Plug 'joshdick/onedark.vim'
"Plug 'whatyouhide/vim-gotham'
"Plug 'srcery-colors/srcery-vim'
" status bar
"Plug 'itchyny/lightline.vim'
" Language stuff
"Plug 'sheerun/vim-polyglot'
" Language server
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'jackguo380/vim-lsp-cxx-highlight'
Plug 'rhysd/vim-clang-format'
" Debugging
"Plug 'chmanie/termdebugx.nvim'
" File exploring
"Plug '/usr/local/opt/fzf'
"Plug 'chmanie/fzf.vim'
"Plug 'tpope/vim-vinegar'
" Auto close parens
"Plug 'jiangmiao/auto-pairs'
"Plug 'tpope/vim-surround'
" Add comments using gcc and gc
"Plug 'tpope/vim-commentary'
"Plug 'suy/vim-context-commentstring'
" Wiki / notes
"Plug 'vimwiki/vimwiki'
"Plug 'alok/notational-fzf-vim'
" Open marked (macOS only)
"Plug 'itspriddle/vim-marked'
" Paste images from clipboard into markdown
"Plug 'ferrine/md-img-paste.vim'
" Color CSS colors
"Plug 'chrisbra/Colorizer'
" Emoji!!!
" Plug 'junegunn/vim-emoji'

call plug#end()

" Turn on syntax highlighting
syntax on

" For plugins to load correctly
filetype plugin indent on

let mapleader = ","

" Security
set modelines=0

" Show line numbers
set number

" Blink cursor on error instead of beeping (grr)
set visualbell

" Encoding
set encoding=utf-8

" TextEdit might fail if hidden is not set.
set hidden

" Automatically detect file changes
set autoread
" Reload the file when enterin buffer
au FocusGained,BufEnter * :silent! !

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

set signcolumn=no

" Whitespace
set wrap
set textwidth=80
set formatoptions=tcqrn1
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set noshiftround

" Cursor motion
set scrolloff=3
set backspace=indent,eol,start 
set matchpairs+=<:> " use % to jump between pairs

" Move up/down editor lines
nnoremap j gj
nnoremap k gk

" Rendering
set ttyfast

" Regex engine
set re=2

" Status bar
" Give more space for displaying messages (might otherwise require CR to
" continue)
set cmdheight=2
set laststatus=2
set noshowmode " we have the mode in the status bar
" Last line
set showcmd

" Searching
set hlsearch
set incsearch
set noignorecase
set smartcase
set showmatch
map <leader><space> :let @/=''<cr> " clear search

"c++ syntax highlighting
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g_cpp_class_decl_highlight = 1

syntax enable
colorscheme dracula
