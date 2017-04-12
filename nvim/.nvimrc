" ================ Startup  ======================
set nocompatible              " be iMproved, required
let g:python3_host_prog = '/usr/local/opt/python3/bin/python3.5'

" ================ Vim-Plug Includes  ======================
" Set runtime path to Vundle
set rtp^=~/.vim/bundle/vim-airline
set rtp+=~/.fzf
call plug#begin('~/.vim/plugged')

" File Syntax Highlight & Linting
Plug 'honza/vim-snippets' 
Plug 'othree/html5.vim'
Plug 'kakposoe/vim-ss' " Silverstripe plugin
Plug 'scrooloose/syntastic'
Plug 'pangloss/vim-javascript'
Plug 'evidens/vim-twig'
Plug 'posva/vim-vue'
Plug 'sheerun/vim-polyglot'
Plug 'jwalton512/vim-blade'

" File Browsing & Git
" Plug 'tpope/vim-vinegar'
Plug 'duggiefresh/vim-easydir'
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-repeat', { 'on': 'EnterInsertMode' }
Plug 'tpope/vim-fugitive'
Plug 'qpkorr/vim-bufkill'

" File Navigation 
Plug 'tpope/vim-eunuch'
Plug 'mhinz/vim-startify'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-unimpaired'
Plug 'wellle/targets.vim', { 'on': 'EnterInsertMode' }
Plug 'bkad/CamelCaseMotion' " Used for Camel Case Motions
Plug 'Shougo/unite.vim'
Plug 'kshenoy/vim-signature' " Used for showing marks in gutter
Plug 'bronson/vim-visual-star-search' " Searches for visually selected area using *

" File Editing
Plug 'tpope/vim-surround', { 'on': 'EnterInsertMode' }
Plug 'Raimondi/delimitMate'
Plug 'AndrewRadev/splitjoin.vim', { 'on': 'EnterInsertMode' } 
Plug 'michaeljsmith/vim-indent-object'
Plug 'tpope/vim-commentary' " Comments out code
Plug 'roman/golden-ratio' " Makes current window larger
Plug 'terryma/vim-expand-region' " Every time v is pressed, visual region expands
Plug 'ConradIrwin/vim-bracketed-paste' " Automatically sets :set paste on cmd-v paste from clipboard
Plug 'junegunn/vim-peekaboo'

" Auto Complete & Snippets
Plug 'trevordmiller/nova-vim'
Plug 'arcticicestudio/nord-vim'
Plug 'SirVer/ultisnips'
Plug 'alvan/vim-closetag'
Plug 'mattn/emmet-vim', { 'on': 'EnterInsertMode' }
Plug 'jceb/emmet.snippets', { 'on': 'EnterInsertMode' }

" Theme
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'rakr/vim-one'
Plug 'ap/vim-css-color' " Shows colours in css
Plug 'ryanoasis/vim-devicons' " Icons shown in vim

augroup lazy_load
	autocmd!
	autocmd InsertEnter * silent! EnterInsertMode | autocmd! lazy_load
augroup END

function! DoRemote(arg)
  UpdateRemotePlugins
endfunction
Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }

call plug#end()

filetype plugin indent on

" ================ General Configuration  ======================
" Auto Refresh Vimrc when saved
autocmd! bufwritepost .vimrc source %
autocmd! bufwritepost .vim source %
autocmd BufNewFile,BufRead *.blade.php set ft=html | set ft=phtml | set ft=blade " Fix blade auto-indent

" Set Configurations
set laststatus=2
set number
set backspace=indent,eol,start
set mouse=a
set nowrap
set selection=inclusive
set tabstop=4 softtabstop=0 noexpandtab shiftwidth=4
" Turn backup off, since most stuff is in SVN, git et.c anyway...
" set list
set autoindent
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
set copyindent
set splitbelow

" Save Folding
autocmd BufWinLeave .* mkview
autocmd BufWinEnter .* silent loadview 

let mapleader = "\<Space>"
map <lf> <cr>
" map <Space> <Leader>

" ================ Airline Configuration  ======================
set encoding=utf8
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#whitespace#enabled = 0
let g:airline_left_sep = ''
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_right_sep = ''

" ================ IndentLine Configuration  ======================
let g:indent_guides_start = 2
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=235
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=237
let g:indent_guides_enable_on_vim_startup = 1

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
set autoindent
 
" ================ Source Files =====================
source ~/.vim/setup/btags.vim
source ~/.vim/setup/unite.vim
source ~/.vim/setup/style.vim
source ~/.vim/setup/bindings.vim
set timeoutlen=500

let delimitMate_expand_cr=1

" ================ Explore Bindings =====================
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" ----- scrooloose/syntastic settings -----
let g:syntastic_error_symbol = '✘'
let g:syntastic_warning_symbol = "▲"
augroup mySyntastic
  au!
  au FileType tex let b:syntastic_mode = "passive"
augroup END

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_scss_checkers = [""]
let g:syntastic_ss_checkers = [""]
let g:syntastic_html_checkers = [""]

let g:startify_change_to_dir = 0

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
let g:UltiSnipsSnippetDirectories=[$HOME."/.vim/UltiSnips"]

autocmd FileType scss :UltiSnipsAddFiletypes css
autocmd FileType scss :UltiSnipsAddFiletypes scss
autocmd FileType ss :UltiSnipsAddFiletypes ss
autocmd FileType vue :UltiSnipsAddFiletypes javascript

" cronjob
au BufEnter /private/tmp/crontab.* setl backupcopy=yes

let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.blade.php,*.php,*.js,*.vue"

augroup netrw_mapping
    autocmd!
    autocmd filetype netrw call NetrwMapping()
augroup END

function! NetrwMapping()
    nmap <buffer> o <CR>
endfunction

let g:netrw_banner = 0
let g:netrw_liststyle = 4

let g:deoplete#enable_at_startup = 1
if !exists('g:deoplete#omni#input_patterns')
  let g:deoplete#omni#input_patterns = {}
endif
let g:deoplete#disable_auto_complete = 0
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

" deoplete tab-complete
noremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

hi link EasyMotionTarget ErrorMsg
hi link EasyMotionShade  Comment

" ================ Camel Case Motion Settings  ======================
map <silent> w <Plug>CamelCaseMotion_w
map <silent> b <Plug>CamelCaseMotion_b
map <silent> e <Plug>CamelCaseMotion_e
map <silent> ge <Plug>CamelCaseMotion_ge
sunmap w
sunmap b
sunmap e
sunmap ge

autocmd FileType unite imap <buffer> <ESC> <Plug>(unite_exit)

function! PhpSyntaxOverride()
  hi! def link phpDocTags  phpDefine
  hi! def link phpDocParam phpType
endfunction

augroup phpSyntaxOverride
  autocmd!
  autocmd FileType php call PhpSyntaxOverride()
augroup END

" Add Unite Yank Source
let g:unite_source_history_yank_enable = 1

