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
Plugin 'rust-lang/rust.vim' " Syntax highlight
Plugin 'phildawes/racer'    " Code completion

" Solarized color scheme
Plugin 'altercation/vim-colors-solarized'

" Autoclose delimiters
Plugin 'Raimondi/delimitMate'

" Snippets, tab-insert
"Plugin 'msanders/snipmate.vim'

" EditorConfig
Plugin 'editorconfig/editorconfig-vim'

" Syntastic (syntax checker)
"Plugin 'scrooloose/syntastic'

" Tabular, indenting stuff with style
Plugin 'godlygeek/tabular'

" Markdown syntax hightlight
Plugin 'plasticboy/vim-markdown'

" Git wrapper
Plugin 'tpope/vim-fugitive'

" Git - shows changes in editor
Plugin 'airblade/vim-gitgutter'

" OpenCL
Plugin 'petRUShka/vim-opencl'

" Unicode
"Plugin 'chrisbra/unicode.vim'

" Arduino
Plugin 'jplaut/vim-arduino-ino' " Ino wrapper

" Language pack
Plugin 'sheerun/vim-polyglot'

" GLSL addition to Polyglot
Plugin 'tikhomirov/vim-glsl'

" LLVM
"Plugin 'garious/vim-llvm'
Plugin 'tommyvagbratt/vim-llvm'

" Goyo (read mode)
Plugin 'junegunn/goyo.vim'

" Encore syntax
Plugin 'Chilinot/vimcore'

" Look inside registers
Plugin 'junegunn/vim-peekaboo'

" Lucius color scheme
Plugin 'jonathanfilip/vim-lucius'

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

" Indicate that we are using a fast terminal that can handle more characters
set ttyfast

" Rebind leader
let mapleader=" "

" Bind escape for all modes
"noremap  ,, <Esc>
"noremap! ,, <Esc>
inoremap ,, <Esc>
vnoremap ,, <Esc>

" Bind Write
noremap <leader>w :w<CR>

" Disable GVIM toolbars etc
set guioptions-=m  "menu bar
set guioptions-=T  "toolbar
set guioptions-=r  "scrollbar

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
set relativenumber
set number

" Theme
set t_Co=256          " Enable 256 colors
syntax enable         " Enable syntax higlight
set background=dark   " Define background brightness
colorscheme lucius
LuciusDarkLowContrast " Define what version of the lucius scheme to use

" Highlight tabs and trailing spaces
set listchars=tab:> ,trail:·
set list

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
nmap <C-L> :tabnext<CR>
nmap <C-H> :tabprevious<CR>

" Kill buffer without closing window layout
command Bd bp | sp | bn | bd

" Encoding
set encoding=utf8
setglobal fileencoding=utf8

" Airline
set laststatus=2
let g:airline#extensions#tabline#enabled = 1

" Fonts
if has("gui_running")
  set guifont=Hack\ 9
endif

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

" Toggle gundo (visual undo tree)
nnoremap <leader>u :GundoToggle<CR>

" Folding
nmap <C-F>i :setlocal fdm=indent<CR>
nmap <C-F>s :setlocal fdm=syntax<CR>
nmap ff zA

" Kill current buffer without closing window
nmap <F3> :Bd<CR>

" Reload the current file
nmap <F4> :e<CR>

" Window keybinds:
" - Increase window width
nmap <Right> <C-W>>
" - Decrease window width
nmap <Left> <C-W><
" - Increase window height
nmap <Up> :resize +1<CR>
" - Decrease window height
nmap <Down> :resize -1<CR>

" Syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:airline_powerline_fonts = 1

" - Disable automatic checking and map manual check
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': [] }
nnoremap <leader>c :SyntasticCheck<CR>
nnoremap <leader>s :SyntasticToggleMode<CR>

" - Enable c++11 support
let g:syntastic_cpp_compiler = 'g++'
let g:syntastic_cpp_compiler_options = ' -std=c++11'

" - Define c++ syntax checker
"let g:syntastic_cpp_checkers = ['clang_tidy']

" Split vertically as default (used for cscope)
set splitright

" Polyglot-pack ignores these files
let g:polyglot_disabled = ['rust']

" Enable persistent undo-trees, creates a new file "file.txt.un~" besides the
" edited file that contains the tree.
set undofile

" Crap command used for fast pushing to garbage repo
nmap <leader>p :!git commit -a -m "testing" && git push <cr><cr>
