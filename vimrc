filetype off
"Vundle setup 
set rtp+=~/.vim/bundle/Vundle.vim
"call vundle#rc()
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Bundle 'gmarik/vundle'

"load all bundles form Github.
"Install or update all bundles do :BundleInstall

Bundle 'vim-scripts/ack.vim'
Bundle 'Raimondi/delimitMate'
Bundle 'scrooloose/nerdtree'
Bundle 'tomtom/tcomment_vim'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'sickill/vim-pasta'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-fugitive'
Bundle 'Valloric/YouCompleteMe'
Bundle 'SirVer/ultisnips'
Bundle 'honza/vim-snippets'
Bundle 'sheerun/vim-polyglot'
Bundle 'Lokaltog/vim-powerline'
Bundle 'majutsushi/tagbar'

"syntax highliter 
Bundle 'scrooloose/syntastic'
Bundle 'nvie/vim-flake8'

" color schemes
Bundle 'daylerees/colour-schemes', { 'rtp': 'vim/' }
Bundle 'nanotech/jellybeans.vim'
Bundle 'altercation/vim-colors-solarized'
Bundle 'vim-scripts/vilight.vim'
Bundle 'walm/jshint.vim'

call vundle#end()
"call pathogen#runtime_append_all_bundles()
"call pathogen#incubate()
"call pathogen#helptags()
filetype plugin indent on

"Enable filetypes
filetype on
filetype plugin on
filetype indent on

syntax on


"turn of vi compatibility
set nocompatible

"prevents security exploits dealing with modelines in files
set modelines=0

"expands tabs to 4 spaces, etc
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

"indentation rules
set autoindent

"changing smartindent for python editing getting anoying with comments. 
"set smartindent
set cindent

"UTF-* text encoding by default
set encoding=utf-8

" Show TextMate-like whitespace chars for tab and end of line
set list
set listchars=tab:▸\ ,eol:¬


set scrolloff=3
set showmode
set visualbell
set cursorline
set ttyfast
set backspace=indent,eol,start

"show command in botton right portion of the screen
set showcmd

"switch between buffers without saving
set hidden

"more useful command-line-like tab completion
set wildmenu

"auto-completion menu
set wildmode=list:longest

"display current cursor position in lower right corner
set ruler

"always show status line
set laststatus=2

" create a <filename>.un~ file that contain undo information
"set undofile

" If searching all lowercase, search case-insensitive.
" If any characters are uppercase, search case-sensitive.
set ignorecase
set smartcase

" Remaps / search key to use standard regex instead of vim regex
nnoremap / /\v
vnoremap / /\v

" %s/foo/bar/ will assume %s/foo/bar/g
set gdefault

" Highlight results as you search
set incsearch
set showmatch
set hlsearch

" Clear a search by typing ,<space>
nnoremap <leader><space> :noh<cr>

"Line-wrapping options
set wrap
set textwidth=79
set formatoptions=qrn1
set colorcolumn=85


" Remap jj to do same thing as <ESC> when in insert mode
 inoremap jj <ESC>

" Disables arrow keys in normal mode to enforce use of hjkl
 nnoremap <up> <nop>
 nnoremap <down> <nop>
 nnoremap <left> <nop>
 nnoremap <right> <nop>
 inoremap <up> <nop>
 inoremap <down> <nop>
 inoremap <left> <nop>
 inoremap <right> <nop>
 nnoremap j gj
 nnoremap k gk

"vim-powerline settings
let g:Powerline_symbols = 'unicode'

" speed up Vim some
  set ttyfast
  set ttyscroll=3
  set lazyredraw " to avoid scrolling problems

" set linespacing 
set linespace=5

" Sets color scheme for MacVim to jellybeans
" (https://github.com/nanotech/jellybeans.vim)
      if has("gui_running")
          colorscheme jellybeans
          " colorscheme vilight
          highlight SpellBad term=underline gui=undercurl guisp=Orange
      endif

", nt toggles NERDTree open/close
let mapleader =","
nmap <leader>n :NERDTreeToggle<CR>

":command NT NERDTreeToggle 
 let NERDTreeIgnore=['\.pyc$', '^\.git$', '^node_modules$']

"NERDTree leader shortcut for some of my often-use paths
"Hide macvim's GUI task bar on load.
 if has("gui_running")
     set guioptions=egmrt
endif

"Remaping f8 to e tagbar.
":nnoremap <F8> :setl noai nocin nosi inde=<cr>
nmap <F8> :TagbarToggle<CR>

"Adding git branch name to status bar in vim.
":set statusline=%{GitBranchInfoString}

" Centralize backups, swapfiles and undo history
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
if exists("&undodir")
   set undodir=~/.vim/undo
   endif

" Automaticly fold code base on indents.
set foldmethod=indent

" Setting indent guides plugin. 
let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 2

"Syntax coloring lines that are to long.
set synmaxcol=128

"Automatic reload when closing .vimrc
autocmd! bufwritepost .vimrc source %

"Using the mouse press ALT and click (MAC)
"set mouse =a

"using repeat option in a more powerful way.
silent! call repeat#set("\<Plug>MyWonderfulMap", v:count)

"syntastit will check buffers an first loaded.
let g:syntastic_check_on_open=1

"addint simbols to the error
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'

"status line syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

"Resize splits when windows is resized
au VimResized * exe "normal! \<c-w>="

"Configuring powerline
set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim

"set noshowmode
set t_Co=256
set guifont=Menlo\ Regular\ for\ Powerline:h15

"Quick validation for Jshint
"folder
let jshint2_command = '/usr/local/share/npm/lib/node_modules/jshint'
"Lint files after reading it and saving.
let jshint2_read = 1
let jshint2_save = 1 

"maping keys for jshint
nnoremap <silent><F1> :JSHint<CR>
inoremap <silent><F1> :JSHint<CR>
vnoremap <silent><F1> :JSHint<CR>
cnoremap <F1> JSHint

"Lint JavaScript after opening and  before saving. 
"autocmd! BufWinEnter * if &filetype == "javascript" | silent JSHint | endif
"autocmd! BufWritePost * if &filetype == "javascript" | silent JSHint | endif

"regular expressions turn magic on
set magic

"Don't show the intro message when starting vim
set shortmess=atI

"Show file name in window titlebar
set title

