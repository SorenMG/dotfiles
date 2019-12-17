"""""" Plugin manager """"""
call plug#begin(stdpath('data') . '/plugged')

" VIM git integration
Plug 'tpope/vim-fugitive'

" Autocompletion
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" Shows file tree
Plug 'scrooloose/nerdtree'

" Surround
Plug 'tpope/vim-surround'

" Rust
Plug 'rust-lang/rust.vim'

" VIM Tabline
Plug 'itchyny/lightline.vim'

" Syntax and linting
Plug 'dense-analysis/ale'

" Firenvim
Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }

" Shared clipboard
"Plug 'svermeulen/vim-easyclip'
"

Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install' }


" Commentation
Plug 'scrooloose/nerdcommenter'

" Retro theme
Plug 'dikiaap/minimalist'

call plug#end()

""""""Basic""""""
let mapleader="\<SPACE>"

set path=$PWD/**

set mouse=a " Enable mouse interaction

" auto wrap for markdown files
au BufRead,BufNewFile *.md setlocal textwidth=80

" Show hidden files in NERD
let NERDTreeShowHidden=1

" Enable deoplete
let g:deoplete#enable_at_startup = 1
call deoplete#custom#option('smart_case', v:true)

" Write file
nnoremap <Leader>w :w<CR>
" Quit file
nnoremap <leader>q :q<cr>
" Open NERD
nnoremap <leader>t :NERDTreeToggle<cr>
" Indent shortcut
nnoremap <F6> gg=G<C-o><C-o>
" Stop buffer from opening
map q: :q

" Learn it the hard way - disable arrowkeys
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

set hls " Highlight search

set noshowmode " Hide status
set nu " Show line numbers
set cursorline " Highlight cursor line
set smartcase " Case sensitive

set smartindent " Indent according to syntax
set autoread " Read changed files
set expandtab " Insert space characters instead of tab
set tabstop=4 " Insert 4 spaces as tab
set shiftwidth=4 " Spaces for each indent
set softtabstop=4 " Amount of whitespace to insert and delete
set noerrorbells " Remove error flashes
set nojoinspaces " Do not add join spaces when joining lines with J
set clipboard=unnamed " Sync OSX clipboard

set splitbelow " Open a new window below current
set encoding=utf-8

" Undo options
set undofile
set undolevels=1000
set backupdir=~/.config/undo/
set directory=~/.config/undo/
set undodir=~/.config/undo/

""""""Python""""""
let g:python_host_prog = '/usr/local/bin/python3'
let g:python3_host_prog = '/usr/local/bin/python3'

""""""Trailing whitespace""""""
" display tabs and trailing spaces
set list listchars=tab:▷⋅,trail:⋅,nbsp:⋅"

""""""Neoformat""""""
" Enable alignment
"let g:neoformat_basic_format_align = 1

" Enable tab to spaces conversion
"let g:neoformat_basic_format_retab = 1

" Enable trimmming of trailing whitespace
"let g:neoformat_basic_format_trim = 1

""""""Syntax Checking""""""
"let g:ale_echo_msg_error_str = 'E'
"let g:ale_echo_msg_warning_str = 'W'
"let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

"let g:ale_sign_error = ''
"let g:ale_sign_warning = ''

""""""Functions""""""
" http://vi.stackexchange.com/questions/454/whats-the-simplest-way-to-strip-trailing-whitespace-from-all-lines-in-a-file
"Remove all trailing whitespace by pressing F5
nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

" Colors, Fonts, and Syntax.
filetype plugin indent on
syntax enable
set t_Co=256
set encoding=utf-8
set guifont=Hack
colorscheme minimalist
