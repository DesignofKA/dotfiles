" Fix blade auto-indent Set Configurations
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
set tags=tags
set path=.
