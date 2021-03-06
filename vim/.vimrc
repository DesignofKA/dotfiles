" ================ Startup  ======================
set nocompatible              " be iMproved, required
filetype off                  " required
filetype plugin on

" ================ Vim-Plug Includes  ======================
" Set runtime path to Vundle
set rtp^=~/.vim/bundle/vim-airline
set rtp+=~/.fzf
call plug#begin('~/.vim/plugged')
"
" let Vundle manage Vundle, required
Plug 'tpope/vim-fugitive'
Plug 'Shougo/unite.vim'
Plug 'tsukkee/unite-tag'
Plug 'mhinz/vim-signify'
Plug 'bling/vim-airline'
Plug 'tpope/vim-commentary'
Plug 'terryma/vim-multiple-cursors'
Plug 'terryma/vim-expand-region'
Plug 'hlissner/vim-multiedit' 
Plug 'StanAngeloff/php.vim'
Plug 'tpope/vim-repeat', 
Plug 'majutsushi/tagbar', 
Plug 'mtscout6/vim-tagbar-css', 
Plug 'junegunn/fzf.vim'
Plug 'ervandew/supertab'
Plug 'docunext/closetag.vim'
Plug 'edsono/vim-matchit'
Plug 'vim-scripts/repeat-motion'
Plug 'easymotion/vim-easymotion'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-haml'
Plug 'Valloric/YouCompleteMe',
Plug 'vim-scripts/BusyBee'
Plug 'NLKNguyen/papercolor-theme'
Plug 'gorodinskiy/vim-coloresque' " Shows colours in css
Plug 'ryanoasis/vim-devicons' " Icons shown in vim
Plug 'SirVer/ultisnips'

" Lazy Loaded Plugins
Plug 'sjl/gundo.vim', { 'on': 'EnterInsertMode' }
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'tpope/vim-surround', { 'on': 'EnterInsertMode' }
Plug 'AndrewRadev/splitjoin.vim', { 'on': 'EnterInsertMode' } 
augroup lazy_load
	autocmd!
	autocmd InsertEnter * silent! EnterInsertMode | autocmd! lazy_load
augroup END

" All of your Plugins must be added before the following line
call plug#end()

filetype plugin indent on    " required


" ================ General Configuration  ======================

" Auto Refresh Vimrc when saved
autocmd! bufwritepost .vimrc source %

" Set Configurations
:set laststatus=2
:set number
:set backspace=2
:set cursorline
:set mouse=a
:set nowrap
set selection=inclusive
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
set autoindent
set cindent
set tags+=tags;$HOME

" Save Folding
autocmd BufWinLeave .* mkview
autocmd BufWinEnter .* silent loadview 

let mapleader = "\<Space>"

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :vsp ~/.vimrc<CR>
nmap <leader>sv :source $MYVIMRC<CR>

" ================ Airline Configuration  ======================
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
 
" ================ Source Files =====================
source ~/.vim/setup/btags.vim
source ~/.vim/setup/unite.vim
source ~/.vim/setup/style.vim
source ~/.vim/setup/bindings.vim
set timeoutlen=500

" ================ Ultisnips =====================
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
"let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsEditSplit="vertical" " If you want :UltiSnipsEdit to split your window.

" ================ MultiEdit Includes  ======================
nmap <leader>ma :MultieditAddMark a<CR>
nmap <leader>mi :MultieditAddMark i<CR>
nmap <leader>M :Multiedit<CR>

