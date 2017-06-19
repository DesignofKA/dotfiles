noremap Q @q
vnoremap Q :norm @q<cr>


" escape commands
ino jk <esc>

noremap <c-j> 5j
noremap <c-k> 5k

" Center search matches
nnoremap N Nzz
nnoremap n nzz

" Open File in FZF using Ctrl + o
tnoremap <C-o> <cr>

inoremap <C-e> <C-o>A

noremap <buffer> <silent> 0 g0
noremap <buffer> <silent> $ g$

vmap v <plug>(expand_region_expand)
vmap <C-v> <plug>(expand_region_shrink)


" |===============================================================
" | Easy Motion	
" |===============================================================
map \ <Plug>(easymotion-prefix)
map  / <plug>(easymotion-sn)
map f <plug>(easymotion-sl)
vmap f <plug>(easymotion-sl)
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)

map <C-[> <esc>
nmap <C-h> ^
nmap <C-l> $
vmap <C-l> $h

" Jump between lines
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

" Paste to system clipboard
vmap <leader>y "*y 

" Reload Vimrc
nmap <leader>sv :source $MYVIMRC<CR>

" Save on enter (normal)
nmap <leader><leader> V
nnoremap <leader>t :FZF<return>
map <script> <leader>d :BD<CR>
nnoremap <leader>w :w<cr>
nnoremap <leader>W :w!<cr>
nnoremap <leader>wf :w !sudo tee % > /dev/null %<return>
nnoremap <leader>q <silent>:call powerclose#close()<CR>
nnoremap <leader>v :vsp<cr><c-w><c-w>
nnoremap <leader>r :term<cr>
nnoremap <leader>x :x<cr>
nnoremap <Leader>i :Ag 
nnoremap <Leader>o :Buffers<return> 
nnoremap <silent><Leader>\ :e ~/Documents/FseSites/

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
nmap <leader>gx :Dispatch! git push && phploy<cr>
nmap <leader>G :!Git 

" Enter to end, Backspace to top
nnoremap <CR> G
nnoremap <BS> gg
vnoremap <CR> G
vnoremap <BS> gg

" Terminal escape
tnoremap jk <C-\><C-n>

" Forces < and > movement in normal & visual mode
noremap <Up> <Nop>
noremap <Down> <Nop>
nnoremap <Left> <Nop> 
nnoremap <Right> <Nop>

nnoremap tn :tabnext<CR>
nnoremap tp :tabprev<CR>
nnoremap tt :tabnew<CR>
nnoremap td  :tabclose<CR>

" |===============================================================
" |	Vim Impaired
" |===============================================================

" Move current link up
nmap <Up> [e
vmap <Up> [egv

" Move current link down
nmap <Down> ]e
vmap <Down> ]egv

nmap <Left> [b
nmap <Right> ]b

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
imap <C-j> <Down>
imap <C-k> <Up>
imap <C-h> <Left>
imap <C-l> <Right>

" |===============================================================
" | Dialog Boxes	
" |===============================================================
nnoremap <silent><Leader>e :Unite menu:vim -silent -start-insert -ignorecase -direction=botright<return>

" |===============================================================
" |	Window Navigation
" |===============================================================

" Navigate between windows using g + direction
nnoremap <nowait> gg <C-W><C-W>
nnoremap gh <C-W><C-H>
nnoremap gj <C-W><C-J>
nnoremap gk <C-W><C-K>
nnoremap gl <C-W><C-L>

" Keeps current paste resiter in tacts whilst replacing words
vnoremap <leader>p "_dP

" change search result using cs then . to repeat
vnoremap <silent> s //e<c-r>=&selection=='exclusive'?'+1':''<cr><cr>
			\:<c-u>call histdel('search',-1)<bar>let @/=histget('search',-1)<cr>gv
omap s :normal vs<cr>

" |===============================================================
" |	Line Indentation
" |===============================================================
nnoremap < <<
nnoremap > >>
vmap < <gv
vmap > >gv

" function! IPhpInsertUse()
"     call PhpInsertUse()
"     call feedkeys('a',  'n')
" endfunction
" autocmd FileType php inoremap <Leader>u <Esc>:call IPhpInsertUse()<CR>
" autocmd FileType php noremap <Leader>u :call PhpInsertUse()<CR>

:map <F11> :set wrap!<CR>
:map <F12> :set nopaste<CR>

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" |===============================================================
" |	To Do List
" |===============================================================
" Test Suite
" nmap <silent> <leader>t :TestNearest<CR>
" nmap <silent> <leader>T :TestFile<CR>
" nmap <silent> <leader>a :TestSuite<CR>
" nmap <silent> <leader>l :TestLast<CR>
" nmap <silent> <leader>g :TestVisit<CR>
