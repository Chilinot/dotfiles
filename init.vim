" Bind leader to space
let mapleader=" "

" Bind escape for all modes
inoremap ,, <Esc>
vnoremap ,, <Esc>

" Bind Write
noremap <leader>s :w<CR>

" Disable GVIM toolbars etc
set guioptions-=m  "menu bar
set guioptions-=T  "toolbar
set guioptions-=r  "scrollbar

" Line numbers
set relativenumber
set number

" Theme
syntax enable          " Enable syntax higlight
colorscheme lucius
LuciusDarkLowContrast  " Define what version of the lucius scheme to use

" Highlight tabs and trailing spaces
set listchars=tab:\| ,trail:·
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
nnoremap <leader>n :nohlsearch<CR> " Remove highlight

" Better insert of new line
nmap <C-K> O<Esc>
nmap <C-J> o<Esc>

" NERDTree
nmap <F1> :NERDTree<CR>

" Change buffer
nmap <C-L> :tabnext<CR>
nmap <C-H> :tabprevious<CR>
nmap <S-L> :bnext<CR>
nmap <S-H> :bprevious<CR>

" Kill buffer without closing window layout
command Bd bp | sp | bn | bd

" Encoding
set encoding=utf8
setglobal fileencoding=utf8

" Airline
set laststatus=2
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

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

" Use J and K as regular movement
nnoremap J j
nnoremap K k
" Use j and k with visual movement
nnoremap j gj
nnoremap k gk

" Toggle gundo (visual undo tree)
nnoremap <leader>u :GundoToggle<CR>

" Folding
nmap <C-F>i :setlocal fdm=indent<CR>
nmap <C-F>s :setlocal fdm=syntax<CR>
nmap ff za
nmap FF zA

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

" Split vertically as default (used for cscope)
set splitright

" Enable persistent undo-trees, creates a new file "file.txt.un~" besides the
" edited file that contains the tree.
set undofile
set undodir=~/.vim/undofiles

" Crap command used for fast pushing to garbage repo
nmap <leader>p :!git commit -a -m "testing" && git push <cr><cr>
