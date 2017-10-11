noremap Q @q
vnoremap Q :norm @q<cr>

" escape commands
" ino jk <esc>

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

" Sort lines in alphabetical order based on selection
vmap <Leader>s :sort<cr>

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

map <C-[> <esc>

" nmap <S-h> ^
" nmap <S-l> $
" vmap <S-h> ^
" vmap <S-l> $h

" vmap $ $h

nmap <Left> <<
nmap <Right> >>

vmap <Left> <gv
vmap <Right> >gv

" |===============================================================
" | Line Indentation
" |===============================================================
"
nnoremap <C-h> ^
nnoremap <C-l> $
vmap <C-h> ^
vmap <C-l> $h

" Jump between lines

" Paste to system clipboard
vmap <leader>y "*y 

" Reload Vimrc
nmap <leader>sv :source $MYVIMRC<CR>

" Open FZF

" Save on enter (normal)
autocmd VimEnter * noremap <leader><leader> V
map <script> <leader>d :BD<CR>
nnoremap <Leader>i :Ag 
nnoremap <Leader>o :Buffers<return> 
nnoremap <leader>W :w!<cr>
nnoremap <leader>q <silent>:call powerclose#close()<CR>
nnoremap <leader>t :FZF<return>
nnoremap <leader>v :vsp<cr><c-w><c-w>
nnoremap <leader>w :w<cr>
nnoremap <leader>x :x<cr>

" Tabs
noremap <S-l> gt
noremap <S-h> gT

" Change to Colon
nnoremap ; :
nnoremap : ;
vnoremap ; :
vnoremap : ;

" Vim Fugative Bindings
nmap <leader>gs :Gstatus<CR>gg 
nmap <leader>gc :Gcommit<cr>
nmap <leader>ga :Gwrite<cr>
nmap <leader>gl :Glog<cr>
nmap <leader>gd :Gdiff<cr>
nmap <leader>gp :Gpush<cr>
nmap <leader>gm :!Git commit -m "
nmap <leader>gA :!Git add -A<cr>
nmap <leader>G :!Git 

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

" Removes Hightlights from search
noremap <esc> :noh<return><esc>
"
imap hh <C-Y>,<esc>li

" |===============================================================
" | Movement in Insert mode 
" |===============================================================
" imap <C-k> <C-o><up>
" imap <C-j> <C-o><down>
imap <C-h> <C-o>h
imap <C-l> <C-o>l

" |===============================================================
" | Dialog Boxes    
" |===============================================================
nnoremap <silent><Leader>e :Unite menu:vim -silent -start-insert -ignorecase -direction=botright<return>

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

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Move cursor to the bottom of the yank selection once yanked 
vmap y y`]

" |===============================================================
" | To Do List
" |===============================================================
" Test Suite
" nmap <silent> <leader>t :TestNearest<CR>
" nmap <silent> <leader>T :TestFile<CR>
" nmap <silent> <leader>a :TestSuite<CR>
" nmap <silent> <leader>l :TestLast<CR>
" nmap <silent> <leader>g :TestVisit<CR>
