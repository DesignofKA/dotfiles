filetype off                  " required
filetype plugin on

if has('vim_starting')
   if &compatible
     set nocompatible               " Be iMproved
   endif

		" Required
		set runtimepath+=~/.vim/bundle/neobundle.vim/
		set rtp^=~/.vim/bundle/vim-airline
		set rtp+=~/.fzf
 endif

" Required
 call neobundle#begin(expand('~/.vim/bundle/'))

 " Let NeoBundle manage NeoBundle
" Required
 NeoBundleFetch 'Shougo/neobundle.vim'

 " My Bundles here:
 " Refer to |:NeoBundle-examples|.

NeoBundle 'tpope/vim-fugitive'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'tsukkee/unite-tag'
NeoBundle 'mhinz/vim-signify'
NeoBundle 'bling/vim-airline'
NeoBundle 'tpope/vim-commentary'
NeoBundle 'sjl/gundo.vim'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'SirVer/ultisnips'
NeoBundle 'jiangmiao/auto-pairs'
NeoBundle 'terryma/vim-multiple-cursors'
NeoBundle 'StanAngeloff/php.vim'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'junegunn/fzf.vim'
NeoBundle 'Valloric/YouCompleteMe'
NeoBundle 'ervandew/supertab'
NeoBundle 'docunext/closetag.vim'
NeoBundle 'edsono/vim-matchit'

NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'tpope/vim-haml'
NeoBundle 'vim-scripts/BusyBee'
NeoBundle 'kristijanhusak/vim-hybrid-material'
NeoBundle 'gorodinskiy/vim-coloresque' " Shows colours in css
NeoBundle 'ryanoasis/vim-devicons' " Icons shown in vim

 call neobundle#end()

" Required
 filetype plugin indent on

 " If there are uninstalled bundles found on startup,
 " this will conveniently prompt you to install them.
 NeoBundleCheck

" ================ General Configuration  ======================

" Auto Refresh Vimrc when saved
autocmd! bufwritepost .vimrc source %

:set laststatus=2
:set number
:set backspace=2
:set cursorline
:set mouse=a
set tabstop=2 softtabstop=0 noexpandtab shiftwidth=2
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set list
set noswapfile
set relativenumber "Prefer relative line numbering?
set hidden "Switch between buffers without saving
set foldenable "Enable code folding
set lbr
set tw=500 " Linebreak on 500 characters
set so=7 " Set 7 lines to the cursor - when moving vertically using j/k
set history=1000         " remember more commands and search history
set undolevels=1000      " use many muchos levels of undo
set title                " change the terminal's title
set lazyredraw          " redraw only when we need to.
set incsearch           " search as characters are entered
set hlsearch            " highlight matches
set visualbell           " don't beep
set noerrorbells         " don't beep
set autoread " Set to auto read when a file is changed from the outside



let mapleader = ","
nmap <space> :

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :vsp ~/.nvimrc<CR>
nmap <leader>sv :source $MYVIMRC<CR>

" Airline status bar config
set encoding=utf8
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=3
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4

" ================ Completion =====================
set wildmode=list:longest
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif
 
"testing source files
source ~/.vim/setup/btags.vim
source ~/.vim/setup/unite.vim
source ~/.vim/setup/style.vim
source ~/.vim/setup/bindings.vim
set timeoutlen=500

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
"let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

let g:multi_cursor_use_default_mapping=0
" Default mapping
let g:multi_cursor_next_key='<S-q>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
" let g:multi_cursor_quit_key='<esc>'

