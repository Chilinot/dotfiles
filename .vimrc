"set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Gundo (Visual undo tree)
Plugin 'sjl/gundo.vim'

" NerdTree
Plugin 'scrooloose/nerdtree'

" Airline
Plugin 'bling/vim-airline'

" Rust
Plugin 'rust-lang/rust.vim'
Plugin 'phildawes/racer' " Code completion

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Racer
set hidden

if has('win32') || has('win64')
  let g:racer_cmd = 'C:/Users/Lucas/.vim/bundle/racer/target/release.exe'
  let $RUST_SRC_PATH = "C:/Users/Lucas/Git/rust/src"
else
  let g:racer_cmd = "~/.vim/bundle/racer/target/release"
  let $RUST_SRC_PATH = "~/git/rust/src"
endif

" Line numbers
set nu

" Theme
syntax enable
"set background=dark
colorscheme desert
set t_Co=16

" Autoindent according to line above
set autoindent

" Display cursor position
set ruler

" Show currently entered command
set showcmd

" Searching
set incsearch " Search as you type
set hlsearch " Highlights matchers
nnoremap <leader><space> :nohlsearch<CR> " Remove highlight

" Better insert of new line
nmap <C-K> O<Esc>
nmap <C-J> o<Esc>

" NERDTree
nmap <F1> :NERDTree<CR>

" Change buffer
nmap <C-L> :bnext<CR>
nmap <C-H> :bprevious<CR>

" Kill buffer without closing window layout
command Bd bp | sp | bn | bd

" Encoding
set encoding=utf8
setglobal fileencoding=utf8

" Airline
set laststatus=2

" Fonts
"if has("gui_running")
"  set guifont=Hack:h9:cANSI
"endif

" Backspace fix
set backspace=2

" Auto complete filenames MENU
set wildmenu

" Improve performance
set lazyredraw

" Move down visually instead of by real lines (more intuitive moves for long
" lines)
nnoremap j gj
nnoremap k gk

" Rebind leader
let mapleader=","

" Rebind Escape
inoremap jk <esc>

" Toggle gundo (visual undo tree)
nnoremap <leader>u :GundoToggle<CR>