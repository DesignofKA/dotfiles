" ================ Startup  ====================== 
set nocompatible "be iMproved, required
" let g:python3_host_prog = '/usr/local/opt/python3/bin/python3'
let g:python3_host_prog = '/usr/bin/python3'
" let g:python3_host_prog = '/home/linuxbrew/.linuxbrew/bin/python3'

" ================ Vim-Plug Includes  ======================
" Set runtime path to Vundle
" set rtp^=~/.vim/bundle/vim-airline
call plug#begin('~/.vim/plugged') " File Syntax Highlight & Linting

Plug 'othree/html5.vim'
Plug 'w0rp/ale'
Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'vue'] }
Plug 'lumiliet/vim-twig', { 'for': ['htm','twig'] }
Plug 'posva/vim-vue', { 'for': ['javascript','vue'] }
Plug 'jwalton512/vim-blade', { 'for': 'php' }

Plug 'neomake/neomake'

" File Browsing & Git
Plug 'duggiefresh/vim-easydir'
Plug 'airblade/vim-gitgutter'
Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': 'bash install.sh' }
Plug 'roxma/LanguageServer-php-neovim',  {'do': 'composer install && composer run-script parse-stubs'}
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim', { 'for': 'markdown' }
Plug 'tpope/vim-repeat'
Plug 'qpkorr/vim-bufkill'
Plug 'shime/vim-livedown', { 'for': 'markdown' }
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-startify'
Plug 'arnaud-lb/vim-php-namespace' " Add PHP Namespace to dependancies, requires .tags
Plug 'craigemery/vim-autotag'
Plug 'majutsushi/tagbar'

" File Navigation 
Plug 'bkad/CamelCaseMotion' " Used for Camel Case Motions
Plug 'bronson/vim-visual-star-search' " Searches for visually selected area using *
Plug 'easymotion/vim-easymotion'
Plug 'justinmk/vim-dirvish'
Plug 'kristijanhusak/vim-dirvish-git'
Plug 'kshenoy/vim-signature' " Used for showing marks in gutter
Plug 'shougo/unite.vim'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-eunuch'
Plug 'wellle/targets.vim'
Plug 'kana/vim-textobj-user'
Plug 'beloglazov/vim-textobj-quotes'
Plug 'Julian/vim-textobj-brace'
Plug 'whatyouhide/vim-textobj-xmlattr'
Plug 'jeffkreeftmeijer/vim-numbertoggle', { 'on': 'EnterInsertMode' }
Plug 'haya14busa/incsearch.vim' " Advanced searching
Plug 'haya14busa/incsearch-fuzzy.vim'

" File Editing
Plug 'AndrewRadev/splitjoin.vim'
Plug 'conradIrwin/vim-bracketed-paste' " Automatically sets :set paste on cmd-v paste from clipboard
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/vim-easy-align'
Plug 'tpope/vim-commentary' " Comments out code
Plug 'tpope/vim-surround'

" Auto Complete & Snippets
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'alvan/vim-closetag', { 'on': 'EnterInsertMode' }
Plug 'jceb/emmet.snippets', { 'on': 'EnterInsertMode' }
Plug 'mattn/emmet-vim', { 'on': 'EnterInsertMode' }

" Theme
Plug 'ayu-theme/ayu-vim'
" Plug 'hzchirs/vim-material'
Plug 'jacoborus/tender.vim'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ap/vim-css-color' " Shows colours in css
Plug 'ryanoasis/vim-devicons' " Icons shown in vim
Plug 'Yggdroot/indentLine'


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

autocmd FileType unite imap <buffer> <ESC> <Plug>(unite_exit)

" PHP Syntax Function Stylign
function! PhpSyntaxOverride()
  hi! def link phpDocTags  phpDefine
  hi! def link phpDocParam phpType
endfunction

augroup phpSyntaxOverride
  autocmd!
  autocmd FileType php call PhpSyntaxOverride()
augroup END

"""
function! RefreshUI()
  if exists(':AirlineRefresh')
    AirlineRefresh
  else
    " Clear & redraw the screen, then redraw all statuslines.
    redraw!
    redrawstatus!
  endif
endfunction

" Auto Refresh Vimrc when saved
autocmd! bufwritepost init.vim source % | :call RefreshUI()

" ================ General Configuration  ======================
autocmd BufNewFile,BufRead *.blade.php set ft=html | set ft=phtml | set ft=blade | set ft=php " Fix blade auto-indent Set Configurations

set autoindent
set autoread " Set to auto read when a file is changed from the outside
set backspace=indent,eol,start
set copyindent
set foldenable "Enable code folding
set hidden "Switch between buffers without saving
set history=1000         " remember more commands and search history
set hlsearch            " highlight matches
set incsearch           " search as characters are entered
set laststatus=2
set lazyredraw          " redraw only when we need to.
set lbr
set list
set listchars=tab:>-
set mouse=a
set noerrorbells         " don't beep
set noswapfile
set nowrap
set number
set relativenumber
set selection=inclusive
set so=10 " Set 10 lines to the cursor - when moving vertically using j/k
set splitbelow
" set synmaxcol=128
set tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab
set title                " change the terminal's title
set tw=500               " Linebreak on 500 characters
set undolevels=1000      " use many muchos levels of undo
set visualbell           " don't beep
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
set timeoutlen=500
set encoding=utf8

" Save Folding
autocmd BufWinLeave .* mkview
autocmd BufWinEnter .* silent loadview 

let mapleader = "\<Space>"
" map <Space> <leader>
map <lf> <cr>

" ================ Source Files =====================
source ~/.config/nvim/unite.vim
source ~/.config/nvim/style.vim
source ~/.config/nvim/bindings.vim

" ================ Explore Bindings =====================
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:startify_change_to_dir = 0

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
let g:UltiSnipsSnippetDirectories=[$HOME."/.vim/UltiSnips"]

autocmd FileType less :UltiSnipsAddFiletypes css
autocmd FileType scss :UltiSnipsAddFiletypes css
autocmd FileType scss :UltiSnipsAddFiletypes scss
autocmd FileType less :UltiSnipsAddFiletypes less
autocmd FileType htm :UltiSnipsAddFiletypes htm
autocmd FileType vue :UltiSnipsAddFiletypes javascript
au BufNewFile,BufRead *.htm set filetype=html.htm.php
au BufNewFile,BufRead *.blade.php set filetype=html.php

" cronjob
au BufEnter /private/tmp/crontab.* setl backupcopy=yes

let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.blade.php,*.php,*.js,*.vue,*.htm"

" ================ DirvishMapping  ======================
augroup dirvish_mapping
    autocmd!
    autocmd filetype dirvish call DirvishMapping()
augroup END

function! DirvishMapping()
    nmap <buffer> o <CR>
    nmap <buffer> <esc> q
endfunction
"""

let g:deoplete#enable_at_startup = 1
if !exists('g:deoplete#omni#input_patterns')
  let g:deoplete#omni#input_patterns = {}
endif
let g:deoplete#disable_auto_complete = 0

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

" ================ Vim AutoTags ======================
let g:autotagTagsFile=".tags"

" ================ ALE ======================
let g:ale_sign_column_always = 1

" Indent Line
let g:indentLine_char = '┊'
let g:indentLine_color_gui = '#a8a8a8'

" For Vim Markdown
" let g:vim_markdown_folding_disabled = 1
" let g:markdown_enable_spell_checking = 0

" Add Unite Yank Source
let g:unite_source_history_yank_enable = 1

let g:tagbar_left = 1
let g:tagbar_autoclose = 1

set tags=tags
set path=.

let g:incsearch#auto_nohlsearch = 1

function! s:goyo_enter()
    set wrap
endfunction

function! s:goyo_leave()
    set nowrap
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

set hidden

let g:LanguageClient_serverCommands = {
    \ 'php': ['php', $HOME . '/.composer/vendor/bin/php-language-server.php'],
    \ }


