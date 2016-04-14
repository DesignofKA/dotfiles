" ================ Startup  ======================
set nocompatible              " be iMproved, required
" filetype plugin on

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
Plug 'bling/vim-airline'
Plug 'tpope/vim-commentary' " Comments out code
Plug 'terryma/vim-multiple-cursors'
Plug 'roman/golden-ratio' " Makes current window larger
Plug 'terryma/vim-expand-region'
Plug 'hlissner/vim-multiedit' 
" Plug 'hkupty/nvimux' "Tmux replacement
Plug 'ConradIrwin/vim-bracketed-paste'
Plug 'bronson/vim-visual-star-search'
Plug 'kshenoy/vim-signature'
Plug 'StanAngeloff/php.vim'
Plug 'tpope/vim-haml'
Plug 'tpope/vim-dispatch'
Plug 'mtscout6/vim-tagbar-css' 
Plug 'cakebaker/scss-syntax.vim' " Scss Syntax
Plug 'junegunn/fzf.vim'
Plug 'craigemery/vim-autotag'
Plug 'mattn/webapi-vim' " Needed for Gist to work
Plug 'mattn/gist-vim' " Post a Gist
Plug 'qpkorr/vim-bufkill' " Keep Window Open once buffer is killed
Plug 'bkad/CamelCaseMotion' " Used for Camel Case Motions
Plug 'nathanaelkane/vim-indent-guides' " Shows tabs
Plug 'docunext/closetag.vim'
Plug 'easymotion/vim-easymotion'
Plug 'airblade/vim-gitgutter'
Plug 'phalkunz/vim-ss' " Silverstripe plugin
Plug 'tpope/vim-unimpaired'
Plug 'Valloric/YouCompleteMe'
Plug 'kristijanhusak/vim-hybrid-material'
Plug 'gorodinskiy/vim-coloresque' " Shows colours in css
Plug 'ryanoasis/vim-devicons' " Icons shown in vim
Plug 'SirVer/ultisnips'

" Lazy Loaded Plugins
Plug 'sjl/gundo.vim', { 'on': 'EnterInsertMode' }
" Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'jiangmiao/auto-pairs', { 'on': 'EnterInsertMode' }
Plug 'mattn/emmet-vim', { 'on': 'EnterInsertMode' }
Plug 'tpope/vim-surround', { 'on': 'EnterInsertMode' }
Plug 'AndrewRadev/splitjoin.vim', { 'on': 'EnterInsertMode' } 
Plug 'edsono/vim-matchit', { 'on': 'EnterInsertMode' }
Plug 'wellle/targets.vim', { 'on': 'EnterInsertMode' }
Plug 'tpope/vim-repeat', { 'on': 'EnterInsertMode' }

augroup lazy_load
	autocmd!
	autocmd InsertEnter * silent! EnterInsertMode | autocmd! lazy_load
augroup END

Plug 'neovim/node-host'
" All of your Plugins must be added before the following line
call plug#end()

filetype plugin indent on

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
" set list
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
set splitbelow

" Save Folding
autocmd BufWinLeave .* mkview
autocmd BufWinEnter .* silent loadview 

let mapleader = "\<Space>"

" Quickly edit/reload the vimrc file
" nmap <silent> <leader>ev :vsp ~/.vimrc<CR>
nmap <leader>sv :source $MYVIMRC<CR>

" ================ Airline Configuration  ======================
set encoding=utf8
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

" ================ IndentLine Configuration  ======================
let g:indent_guides_start = 2
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=235
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=237
let g:indent_guides_enable_on_vim_startup = 0

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

let g:gist_use_password_in_gitconfig = 1
let g:gist_post_private = 1
let g:nvimux_prefix='<C-space>'

" ================ Explore Bindings =====================
let g:netrw_liststyle=3

" ================ Ultisnips =====================
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
"
" ================ MultiEdit Includes  ======================
nmap <leader>ma :MultieditAddMark a<CR>
nmap <leader>mi :MultieditAddMark i<CR>
nmap <leader>M :Multiedit<CR>

" ================ Camel Case Motion Settings  ======================
map <silent> w <Plug>CamelCaseMotion_w
map <silent> b <Plug>CamelCaseMotion_b
map <silent> b <Plug>CamelCaseMotion_b
map <silent> e <Plug>CamelCaseMotion_e
map <silent> ge <Plug>CamelCaseMotion_ge
sunmap w
sunmap b
sunmap e
sunmap ge
