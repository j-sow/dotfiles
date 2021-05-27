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
Plug 'lambdalisue/suda.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'yuki-yano/fzf-preview.vim', { 'branch': 'release/rpc' }
Plug 'mcchrish/nnn.vim'
Plug 'ap/vim-buftabline'
" Color schema
Plug 'dracula/vim'
" status bar
Plug 'itchyny/lightline.vim'
" Language stuff
Plug 'sheerun/vim-polyglot'
" Language server
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'liuchengxu/vista.vim'
Plug 'jackguo380/vim-lsp-cxx-highlight'
Plug 'rhysd/vim-clang-format'
" Git plugins
Plug 'airblade/vim-gitgutter'
Plug 'zivyangll/git-blame.vim'
" Debugging
"Plug 'chmanie/termdebugx.nvim'
" File exploring
"Plug '/usr/local/opt/fzf'
"Plug 'chmanie/fzf.vim'
"Plug 'tpope/vim-vinegar'
" Auto close parens
Plug 'jiangmiao/auto-pairs'
"Plug 'tpope/vim-surround'
" Add comments using gcc and gc
Plug 'tpope/vim-commentary'
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

set signcolumn=yes

" Whitespace
"  set wrap
"  set textwidth=80
set formatoptions=tcqrn1
set tabstop=4
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

nnoremap <C-N> :bnext<CR>
nnoremap <C-P> :bprev<CR>

"c++ syntax highlighting
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g_cpp_class_decl_highlight = 1


" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
"nnoremap <silent> K :call CocActionAsync('doHover')<CR>
nnoremap <silent> <leader>h :call CocActionAsync('doHover')<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Use <tab> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <S-TAB> <Plug>(coc-range-select-backword)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

" nnn.vim settings
" Disable default mappings
let g:nnn#set_default_mappings = 0

" Set personalized mappings
" nnoremap <silent> <leader>nn :NnnPicker<CR>


" OR override
" Start n³ in the current file's directory
nnoremap <leader>n :NnnPicker %:p:h<CR>

" Floating window (neovim latest and vim with patch 8.2.191
let g:nnn#layout = { 'window': { 'width': 0.9, 'height': 0.6, 'highlight': 'Debug' } }

" to start n³ in detail mode:
let g:nnn#command = 'nnn -d'

syntax enable
colorscheme dracula
let g:lightline = {
      \ 'colorscheme': 'dracula',
      \ }
