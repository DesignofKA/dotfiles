" ================ Startup  ====================== 
set nocompatible "be iMproved, required
let g:python3_host_prog = $PY_PATH

" ================ Vim-Plug Includes  ======================
call plug#begin('~/.vim/plugged')

source ~/.config/nvim/plugins/syntax.vim
source ~/.config/nvim/plugins/language.vim
source ~/.config/nvim/plugins/file-browsing.vim
source ~/.config/nvim/plugins/navigation.vim
source ~/.config/nvim/plugins/file-editing.vim
source ~/.config/nvim/plugins/snippets.vim
source ~/.config/nvim/plugins/theme.vim

call plug#end()

filetype plugin indent on

augroup lazy_load
    autocmd!
    autocmd InsertEnter * silent! EnterInsertMode | autocmd! lazy_load
augroup END

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
autocmd BufNewFile,BufRead *.blade.php set ft=html | set ft=phtml | set ft=blade | set ft=php 

source ~/.config/nvim/configs/general.vim

" Save Folding
autocmd BufWinLeave .* mkview
autocmd BufWinEnter .* silent loadview

let mapleader = "\<Space>"
map <lf> <cr>

" ================ Source Files =====================
source ~/.config/nvim/configs/unite.vim
source ~/.config/nvim/configs/style.vim
source ~/.config/nvim/configs/bindings.vim
source ~/.config/nvim/configs/dirvish.vim

" ================ Explore Bindings =====================
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:startify_change_to_dir = 0

" better key bindings for UltiSnipsExpandTrigger
" Add Unite Yank Source
let g:unite_source_history_yank_enable = 1
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
au BufNewFile,BufRead *.blade.php set filetype=php.html

" cronjob
au BufEnter /private/tmp/crontab.* setl backupcopy=yes

let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.blade.php,*.php,*.js,*.vue,*.htm"
autocmd FileType dart setlocal sw=4 ts=1 sts=1 expandtab

" ================ DirvishMapping  ======================
"""

hi link EasyMotionTarget ErrorMsg
hi link EasyMotionShade  Comment

" ================ Camel Case Motion Settings  ======================
source ~/.config/nvim/configs/camel-motion.vim

" ================ Vim AutoTags ======================
let g:autotagTagsFile=".tags"

" ================ ALE ======================
let g:ale_sign_column_always = 1
let g:airline#extensions#ale#enabled = 1
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

" Indent Line
let g:indentLine_char = '┊'
let g:indentLine_color_gui = '#a8a8a8'

" For Vim Markdown
" let g:vim_markdown_folding_disabled = 1
" let g:markdown_enable_spell_checking = 0

let g:tagbar_left = 1
let g:tagbar_autoclose = 1

let g:incsearch#auto_nohlsearch = 1

function! s:goyo_enter()
    set wrap
endfunction

function! s:goyo_leave()
    set nowrap
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

autocmd FileType php setlocal commentstring=\/\/\ %s

set hidden

let g:LanguageClient_serverCommands = {
    \ 'php': ['php', $HOME . '/.composer/vendor/bin/php-language-server.php'],
    \ }

 " enable ncm2 for all buffers
autocmd BufEnter * call ncm2#enable_for_buffer()
autocmd BufEnter menu call ncm2#disable_for_buffer()

" IMPORTANT: :help Ncm2PopupOpen for more information
set completeopt=noinsert,menuone,noselect

augroup custom_term
    autocmd!
    autocmd TermOpen * setlocal bufhidden=hide
augroup END

let g:lsc_auto_map = v:true
