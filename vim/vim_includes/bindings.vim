noremap Q @q
vnoremap Q :norm @q<cr>

" escape commands
ino jk <esc>
cno jk <c-c>

noremap <c-j> 5j
noremap <c-k> 5k

" Center search matches
nnoremap N Nzz
nnoremap n nzz

" Open File in FZF using Ctrl + o
tnoremap <C-o> <cr>

noremap <buffer> <silent> 0 g0
noremap <buffer> <silent> $ g$

vmap v <plug>(expand_region_expand)
vmap <C-v> <plug>(expand_region_shrink)

nmap <silent> <leader>sv :so $MYVIMRC<CR>

" |===============================================================
" | Easy Motion	
" |===============================================================
map \ <Plug>(easymotion-prefix)
map  / <plug>(easymotion-sn)
" nmap s <plug>(easymotion-s3)
map f <plug>(easymotion-sl)
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)

" Jump between lines
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

" Paste to clipboard
vmap <leader>y "+y 
" vmap <leader>d "+d
nmap <leader>p "+p
nmap <leader>p "+p
vmap <leader>p "+p
vmap <leader>p "+p
vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]

map <C-[> <esc>
" save on enter (normal)
nmap <leader><cr> :write<cr>
nmap <C-h> ^
nmap <C-l> $h
nmap <leader><leader> V
nnoremap <leader>t :FZF<return>
map <silent> <Leader>d :BD<CR>
nnoremap <leader>w :w<cr>
nnoremap <leader>W :w!<cr>
nnoremap <leader>wf :w !sudo tee % > /dev/null %<return>
nnoremap <leader>q :q<return>
nnoremap <leader>Q :q!<cr>
nnoremap <leader>v :vsp<cr><c-w><c-w>
nnoremap <leader>h :sp<cr>
nnoremap <leader>r <c-w>r
nnoremap <leader>x :x<cr>
" nnoremap <Leader>l :BLines<return> 
nnoremap <Leader>o :Buffers<return> 
" nnoremap <Leader>a :tabnext<return> 
nnoremap <Leader>\ :e ~/Documents/FseSites/

" Tabs
noremap <S-l> gt
noremap <S-h> gT

" Change to Colon
nnoremap ; :
nnoremap : ;

" Vim Fugative Bindings
nmap <Leader>gs :Gstatus<CR>gg 
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

" tab switching  
" nmap <Leader>tnn :tabnew<cr>  
" map <C-l> :tabnext<CR>  
" map <C-h> :tabprev<CR> 

" |===============================================================
" |	Line Indentation
" |===============================================================

nnoremap < <<
nnoremap > >>
vmap < <gv
vmap > >gv

" |===============================================================
" |	Change Buffer using Left and Right Arrow Keys
" |===============================================================

nmap <C-p> ]b
nmap <C-n> [b
vmap <Left> [b
vmap <Right> ]b

" |===============================================================
" |	Vim Impaired
" |===============================================================

" Move current link up
nmap <Up> [e
vmap <Up> [egv

" Move current link down
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
" Emmet Completion
" imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")
" let g:user_emmet_leader_key=','
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
nnoremap <Leader>D :Dispatch! 
nnoremap <Leader>Dc :Dispatch! sudo /usr/local/bin/ctags -R .<return> 
nnoremap <Leader>Do :Copen<cr> 


" |===============================================================
" |	Window Navigation
" |===============================================================

" Navigate between windows using g + direction
nnoremap gh <C-W><C-H>
nnoremap gj <C-W><C-J>
nnoremap gk <C-W><C-K>
nnoremap gl <C-W><C-L>

" Either enter number then tab to move to window, or press tab twice to go to new window, or enter tab then direction 
nnoremap <tab> <c-w>w
nnoremap <S-tab> <c-w>W

" |===============================================================
" |	NERD Tree
" |===============================================================
let NERDTreeShowHidden=1
let NERDTreeHijackNetrw=1
let NERDTreeMapJumpNextSibling='/<C-J>'
let NERDTreeMapJumpPrevSibling='/<C-K>'
let NERDTreeMapUpdir="-"
nnoremap - :e %:p:h<CR>
autocmd FileType nerdtree setlocal relativenumber

" Keeps current paste resiter in tacts whilst replacing words
function! Restoreregister()
	let @" = s:restore_reg
	return ''
endfunction
function! s:repl()
	let s:restore_reg = @"
	return "p@=Restoreregister()\<cr>"
endfunction
vmap <silent> <expr> p <sid>repl()

" change search result using cs then . to repeat
vnoremap <silent> s //e<c-r>=&selection=='exclusive'?'+1':''<cr><cr>
			\:<c-u>call histdel('search',-1)<bar>let @/=histget('search',-1)<cr>gv
omap s :normal vs<cr>

" gi - goes to the last edit location
