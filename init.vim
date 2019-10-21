"""""" Plugin manager """"""
call plug#begin(stdpath('data') . '/plugged')

" Easy alignment
Plug 'junegunn/vim-easy-align'

" Shows git diff in gutter
Plug 'airblade/vim-gitgutter'

" Shows file tree
Plug 'scrooloose/nerdtree'

" VIM Tabline
Plug 'itchyny/lightline.vim'

" Syntax and linting
Plug 'dense-analysis/ale'

" Shared clipboard
"Plug 'svermeulen/vim-easyclip'

" Commentation
Plug 'scrooloose/nerdcommenter'

" Retro theme
Plug 'morhetz/gruvbox'

call plug#end()

""""""Basic""""""
let mapleader="\<SPACE>"

set path=$PWD/**

set mouse=a

let g:tex_flavor = "latex"

" auto wrap for markdown files
au BufRead,BufNewFile *.md setlocal textwidth=80

" Open nerd tree when opening empty vim
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Write file
nnoremap <Leader>w :w<CR>
" Quit file
nnoremap <leader>q :q<cr>

"nnoremap <up> <nop>
"nnoremap <down> <nop>
"nnoremap <left> <nop>
"nnoremap <right> <nop>
"nnoremap j gj
"nnoremap k gk

set noshowmode
set nu
set cursorline

set autowrite
set autoindent
set smartindent
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set noerrorbells
set nojoinspaces

set splitbelow
set splitright
set shiftround    " round indent to multiple of 'shiftwidth'

set autoread
set encoding=utf-8

set undofile
set undolevels=1000
set backupdir=~/.config/undo/
set directory=~/.config/undo/
set undodir=~/.config/undo/

"inoremap jk <esc>

""""""Python""""""
let g:python_host_prog = '/usr/local/bin/python3'
let g:python3_host_prog = '/usr/local/bin/python3'

""""""Trailing whitespace""""""
" display tabs and trailing spaces
set list listchars=tab:▷⋅,trail:⋅,nbsp:⋅"

""""""Status line""""""
let g:lightline = {
            \ 'colorscheme': 'gruvbox',
            \ 'active': {
            \   'left': [['mode', 'paste'], ['readonly', 'filename', 'modified']],
            \   'right': [['lineinfo'], ['percent'], ['filetype', 'fileencoding', 'fileformat'], ['linter_warnings', 'linter_errors', 'linter_ok']]
            \ },
            \ 'component_expand': {
            \   'linter_warnings': 'LightlineLinterWarnings',
            \   'linter_errors': 'LightlineLinterErrors',
            \   'linter_ok': 'LightlineLinterOK'
            \ },
            \ 'component_type': {
            \   'readonly': 'error',
            \   'linter_warnings': 'warning',
            \   'linter_errors': 'error'
            \ },
            \ }
function! LightlineLinterWarnings() abort
    let l:counts = ale#statusline#Count(bufnr(''))
    let l:all_errors = l:counts.error + l:counts.style_error
    let l:all_non_errors = l:counts.total - l:all_errors
    return l:counts.total == 0 ? '' : printf('%d ', all_non_errors)
endfunction
function! LightlineLinterErrors() abort
    let l:counts = ale#statusline#Count(bufnr(''))
    let l:all_errors = l:counts.error + l:counts.style_error
    let l:all_non_errors = l:counts.total - l:all_errors
    return l:counts.total == 0 ? '' : printf('%d ', all_errors)
endfunction
function! LightlineLinterOK() abort
    let l:counts = ale#statusline#Count(bufnr(''))
    let l:all_errors = l:counts.error + l:counts.style_error
    let l:all_non_errors = l:counts.total - l:all_errors
    return l:counts.total == 0 ? '✓ ' : ''
endfunction

" Update and show lightline but only if it's visible (e.g., not in Goyo)
autocmd User ALELint call s:MaybeUpdateLightline()
function! s:MaybeUpdateLightline()
    if exists('#lightline')
        call lightline#update()
    end
endfunction

""""""Neoformat""""""
" Enable alignment
let g:neoformat_basic_format_align = 1

" Enable tab to spaces conversion
let g:neoformat_basic_format_retab = 1

" Enable trimmming of trailing whitespace
let g:neoformat_basic_format_trim = 1

""""""Syntax Checking""""""
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

let g:ale_sign_error = ''
let g:ale_sign_warning = ''

""""""Functions""""""
" http://vi.stackexchange.com/questions/454/whats-the-simplest-way-to-strip-trailing-whitespace-from-all-lines-in-a-file
"Remove all trailing whitespace by pressing F5
nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

""""""Color scheme""""""
set background=dark
colorscheme gruvbox
set termguicolors
