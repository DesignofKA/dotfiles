noremap Q @q
vnoremap Q :norm @q<cr>

" Removes Hightlights from search
nnoremap <esc> :noh<return><esc>

noremap <c-j> 5j
noremap <c-k> 5k

" For use with vim-textobj plugin
xmap q iq
omap q iq

" Center search matches
nnoremap N Nzz
nnoremap n nzz

" Open File in FZF using Ctrl + o
tnoremap <C-o> <cr>

inoremap <C-e> <C-o>A

" Use Ctrl-p to move to matching bracket
noremap <c-p> %

noremap <buffer> <silent> 0 g0
noremap <buffer> <silent> $ g$

vmap t it

" |===============================================================
" | Easy Motion 
" |===============================================================
" map \ <Plug>(easymotion-prefix)
" map  / <plug>(easymotion-sn)
" map  n <Plug>(easymotion-next)
" map  N <Plug>(easymotion-prev)
map f <plug>(easymotion-sl)
vmap f <plug>(easymotion-sl)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

nmap <Left> <<
nmap <Right> >>

vmap <Left> <gv
vmap <Right> >gv

nnoremap <C-h> ^
nnoremap <C-l> $

vmap <C-h> ^
vmap <C-l> $h

" Paste to system clipboard
vmap <leader>y "*y 

" Open FZF

map <script> <leader>d :BD<CR>
nnoremap <Leader>i :Ag 
nnoremap <Leader>o :Buffers<return> 
nnoremap <leader>W :w!<cr>
nnoremap <leader>q <silent>:call powerclose#close()<CR>
" nnoremap <leader>t :Tags<return>
nnoremap <leader>t :TagbarToggle<return>
" nnoremap <leader>rt :!ctags -R --fields=+aimlS --languages=php<return>
" nnoremap <leader>rt :!ctags -R --PHP-kinds=cfi<return>
" nnoremap <leader>rt :!ctags -R --PHP-kinds=cfi<return>
nnoremap <leader>rt :!ctags --recurse=yes --tag-relative=yes --exclude=.git --exclude=composer.phar --exclude='*.js' --exclude='*.vim' --langmap=php:.engine.inc.module.theme.install.php --PHP-kinds=+cfi-vj<return>
" nnoremap <leader>rt :!ctags -R --fields=+aimS --php-kinds=cdfint --languages=php --extras=+q --tag-relative=yes --exclude=".git" --exclude="vendor" \ --exclude="node_modules" --exclude="composer.phar" --totals=yes<return>

" ctags --recurse --tag-relative --languages=-javascript,sql \
"     --exclude=.git \
"     --sort=yes --append \
"     --PHP-kinds=+cf \
"     --regex-PHP='/abstract class ([^ ]*)/\1/c/' \
"     --regex-PHP='/interface ([^ ]*)/\1/c/' \
"     --regex-PHP='/(public |static |abstract |protected |private )+function ([^ (]*)/\2/f/' \


nnoremap <leader>v :vsp<cr><c-w><c-w>
nnoremap <leader>w :w<cr>
nnoremap <leader>x :x<cr>
nnoremap <leader>cm :%s///g<cr>
autocmd VimEnter * noremap <leader><leader> :FZF<return>

" Tabs
nnoremap <S-l> :bnext<return>
nnoremap <S-h> :bprevious<return>

" Change to Colon
nnoremap ; :
nnoremap : ;
vnoremap ; :
vnoremap : ;

" Vim Fugative Bindings
nnoremap <leader>gs :Gstatus<CR>gg 
nnoremap <leader>gc :Gcommit<cr>
nnoremap <leader>ga :Gwrite<cr>
nnoremap <leader>gl :Glog<cr>
nnoremap <leader>gd :Gdiff<cr>
nnoremap <leader>gp :Gpush<cr>
nnoremap <leader>gm :!Git commit -m "
nnoremap <leader>gA :!Git add -A<cr>
nnoremap <leader>G :!Git 

" Enter to end, Backspace to top
nnoremap <CR> G
nnoremap <BS> gg
vnoremap <CR> G
vnoremap <BS> gg

" Terminal escape
tnoremap jk <C-\><C-n>

" Forces < and > movement in normal & visual mode
" noremap <Up> <Nop>
" noremap <Down> <Nop>
" nnoremap <Left> <Nop> 
" nnoremap <Right> <Nop>

" Tab bindings
nnoremap tt :tabnew<CR>
nnoremap tc :tabclose<CR>

" |===============================================================
" | Vim Impaired
" |===============================================================

" Move content up
nmap <Up> [e
vmap <Up> [egv

" Move content up
nmap <Down> ]e
vmap <Down> ]egv

" |===============================================================
" | Commentary  
" |===============================================================
vmap <C-\> <plug>Commentary
nmap <C-\> <plug>CommentaryLine

imap hh <C-Y>,<esc>li

" |===============================================================
" | Movement in Insert mode 
" |===============================================================
imap <C-h> <C-o>h
imap <C-l> <C-o>l

" |===============================================================
" | Unite Menus    
" |===============================================================
nnoremap <silent><Leader>e :Unite menu:vim -buffer-name=menu -silent -start-insert -ignorecase -direction=botright<return>

" |===============================================================
" | Window Navigation
" |===============================================================

" Navigate between windows using g + direction
nnoremap <nowait> gg <C-W><C-W>
nnoremap gh <C-W><C-H>
nnoremap gj <C-W><C-J>
nnoremap gk <C-W><C-K>
nnoremap gl <C-W><C-L>

" if Markdown, allow livedown toggle binding
nmap gm :LivedownToggle<CR>

" Keeps current paste register in tact whilst replacing words
vnoremap <leader>p "_dP
vnoremap Y "+y
vnoremap P "+p

" change search result using cs then . to repeat
vnoremap <silent> s //e<c-r>=&selection=='exclusive'?'+1':''<cr><cr>
            \:<c-u>call histdel('search',-1)<bar>let @/=histget('search',-1)<cr>gv
omap s :normal vs<cr>

" function! IPhpInsertUse()
"     call PhpInsertUse()
"     call feedkeys('a',  'n')
" endfunction
" autocmd FileType php inoremap <Leader>u <Esc>:call IPhpInsertUse()<CR>
" autocmd FileType php noremap <Leader>u :call PhpInsertUse()<CR>

:map <F1> :set wrap!<CR>
:map <F2> :set nopaste<CR>

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" Move cursor to the bottom of the yank selection once yanked 
" vmap y y`]

" Search
map /  <Plug>(incsearch-forward)
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)

map z/ <Plug>(incsearch-fuzzy-/)

nnoremap <c-]> :call fzf#vim#tags(expand('<cword>'), {'options': '--exact --select-1 --exit-0'})<CR>

" Reload Vimrc
nmap <leader>sv :source $MYVIMRC<CR>

" PHP Namespace
function! IPhpInsertUse()
    call PhpInsertUse()
    call feedkeys('a',  'n')
endfunction
autocmd FileType php noremap <Leader>u :call PhpInsertUse()<CR>
autocmd FileType php noremap <Leader>re :call PhpExpandClass()<CR>
autocmd FileType php noremap <Leader>s :call PhpSortUse()<CR>

nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
" nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>
