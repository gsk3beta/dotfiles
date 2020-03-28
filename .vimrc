set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'tikhomirov/vim-glsl'
Plugin 'davidhalter/jedi-vim'
Plugin 'w0rp/ale'
Plugin 'Yggdroot/indentLine'
Plugin 'posva/vim-vue'
Plugin 'leafoftree/vim-vue-plugin'

call vundle#end()            " required
filetype plugin indent on    " required

"clangd
let g:ycm_clangd_uses_ycmd_caching = 0
let g:ycm_clangd_binary_path = exepath("clangd")

"vim-glsl
autocmd! BufNewFile,BufRead *.vs,*.fs,*.glslinc set ft=glsl

"ale
let g:ale_linters = {'cpp': ['clangd']}
let g:ale_fixers = {'python': ['autopep8']}

"jedi-vim
let g:jedi#auto_initialization = 1
let g:jedi#force_py_version = 3
autocmd FileType python setlocal completeopt-=preview
let g:jedi#completions_enabled = 0 "use YCM

nnoremap j gj
nnoremap k gk
set incsearch
set ignorecase
set smartcase
set hlsearch
nnoremap <ESC><ESC> :nohl<RETURN>
set expandtab
"set shiftwidth=4
  "set tabstop=4
noremap y "+y
set visualbell
inoremap jj <ESC>

autocmd! BufNewFile,BufRead *.html setl filetype=htmldjango shiftwidth=2

if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

autocmd! BufNewFile,BufRead *.md inoremap <ESC> <ESC>:w<RETURN><C- >>

autocmd! BufNewFile,BufRead *.py set shiftwidth=4
autocmd! BufNewFile,BufRead *.vue set shiftwidth=2

let g:vim_vue_plugin_load_full_syntax = 1
