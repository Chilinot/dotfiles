"dein Scripts-----------------------------
" This conditional block is for regular Vim
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/home/user/.config/nvim/dein/repos/github.com/Shougo/dein.vim

" Required:
call dein#begin('/home/user/.config/nvim/dein')

" Let dein manage dein
" Required:
call dein#add('Shougo/dein.vim')

" Add or remove your plugins here:
"call dein#add('Shougo/neosnippet.vim')
"call dein#add('Shougo/neosnippet-snippets')

" You can specify revision/branch/tag.
"call dein#add('Shougo/neosnippet-snippets')

" Begin Tools ===================================

" Tagbar, list ctags in separate window
call dein#add('majutsushi/tagbar')

" Wakatime, time logger/management
call dein#add('wakatime/vim-wakatime')

" mundo (fork of gundo with better stuff added aswell as support for neovim)
call dein#add('simnalamburt/vim-mundo')

" NerdTree
call dein#add('scrooloose/nerdtree')

" Airline
call dein#add('bling/vim-airline')

" Autoclose delimiters
call dein#add('Raimondi/delimitMate')

" Tabular, indenting stuff with style
call dein#add('godlygeek/tabular')

" Git wrapper
call dein#add('tpope/vim-fugitive')

" Git - shows changes in editor
call dein#add('airblade/vim-gitgutter')

" Look inside registers
call dein#add('junegunn/vim-peekaboo')

" Vimwiki - todonotes and such
call dein#add('vimwiki/vimwiki')

" Session manager
call dein#add('xolox/vim-misc')    " Required for the plugin
call dein#add('xolox/vim-session') " The actual plugin

" Easymotion
call dein#add('easymotion/vim-easymotion')

" EditorConfig
call dein#add('editorconfig/editorconfig-vim')
" End Tools =====================================

" Begin Colorschemes ============================
" Lucius
call dein#add('jonathanfilip/vim-lucius')

" DespaciO
call dein#add('alessandroyorba/despacio')
" End Colorschemes ==============================

" Begin Syntax Plugins ==========================
" Syntastic, awesome syntax checker.
call dein#add('vim-syntastic/syntastic')

" Encore
call dein#add('thegrandmother/vimcore')

" Rust
call dein#add('rust-lang/rust.vim')

" Slim, a template language for Rails
call dein#add('slim-template/vim-slim')

" CoffeScript
call dein#add('vim-coffee-script')
" End Syntax Plugins== ==========================

" Required:
call dein#end()

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------

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
LuciusLightHighContrast  " Define what version of the lucius scheme to use

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
"nnoremap J j
"nnoremap K k
" Use j and k with visual movement
nnoremap j gj
nnoremap k gk

" Toggle mundo (visual undo tree)
nnoremap <leader>u :MundoToggle<CR>

" Folding
nmap <C-F>i :setlocal fdm=indent<CR>
nmap <C-F>s :setlocal fdm=syntax<CR>
nmap ff za
nmap FF zA

" Toggle tagbar window
nmap <F2> :TagbarToggle<CR>

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
set undodir=~/.config/nvim/undofiles

" Crap command used for fast pushing to garbage repo
"nmap <leader>p :!git commit -a --no-gpg-sign -m "testing" && git push <cr><cr>

" Editorconfig settings
let g:EditorConfig_exec_path = '/rw/usrlocal/bin/editorconfig'
let g:EditorConfig_core_mode = 'external_command'

" neovim terminal
" - Exit insert mode
tnoremap <F12> <C-\><C-n>

" Macro related stuff
" - Replay macro at: q
nnoremap Q @q

" Eclimd:
" - Java: auto import
nnoremap <leader>ji :JavaImport<cr>

" Syntastic:
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" - Disable the plugin for these filetypes
let g:syntastic_disabled_filetypes=['eruby']

" - Disable Eclim integration (should speedup vim)
let g:airline#extensions#eclim#enabled = 0

" - Check syntax
nnoremap <leader>c :SyntasticCheck<CR>

" Enable autosaving of sessions
let g:session_autosave = 'yes'
" Enable autoload of sessions
let g:session_autoload = 'no'
