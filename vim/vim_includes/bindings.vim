" escape commands
ino jk <esc>
cno jk <c-c>
" vno v <esc> 

" save on enter (normal)
nmap <leader><cr> :write<cr>

" Stop macro recording - Practise this 
" nnoremap q <nop>
" map q <nop>

noremap <c-j> 5j
noremap <c-k> 5k

" Use underscore to clear searchs
nnoremap <silent> - :nohl<CR>

noremap <buffer> <silent> 0 g0
noremap <buffer> <silent> $ g$

map \ <Plug>(easymotion-prefix)
vmap v <plug>(expand_region_expand)
vmap <c-v> <plug>(expand_region_shrink)

" |===============================================================
" | Easy Motion	
" |===============================================================
map  / <plug>(easymotion-sn)
nmap s <plug>(easymotion-s2)
nmap f <plug>(easymotion-sl)

" Paste to clipboard
vmap <leader>y "+y 
vmap <leader>d "+d
nmap <leader>p "+p
nmap <leader>p "+p
vmap <leader>p "+p
vmap <leader>p "+p
vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]

" Got to command line using Leader ;
nmap <Leader>; :
vmap <leader>; :

nmap <leader><leader> V
nnoremap <leader>t :FZF<return>
map <Leader>d :BD<Return>
nnoremap <leader>w :w<cr>
nnoremap <leader>W :w!<cr>
nnoremap <leader>wf :w !sudo tee % > /dev/null %<return>
nnoremap <leader>q :q<cr>
nnoremap <leader>Q :q!<cr>
nnoremap <leader>v :vsp<cr>
nnoremap <leader>h :sp<cr>
nnoremap <leader>r <c-w>r
nnoremap <leader>x :x<cr>
nnoremap <Leader>l :BLines<return> 
nnoremap <leader>u :GundoToggle<Return>
nnoremap <Leader>B :Buffers<return> 
nnoremap <Leader>ag :Ag<return> 

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

" nmap <leader>t :tabnew<cr>
" nmap <leader>th :tabnext<cr>
" nmap <leader>tl :tabprev<cr>
" nmap <leader>tc :tabclose<cr>

" Enter to end, Backspace to top
nnoremap <CR> G
nnoremap <BS> gg
vnoremap <CR> G
vnoremap <BS> gg

"Show hidden files in NerdTree
let NERDTreeShowHidden=0
" nnoremap <leader>n :NERDTreeToggle<CR>
map <leader>n :Explore<CR>
map <leader>k :Explore<CR>

" Forces < and > movement in normal & visual mode
noremap <Up> <Nop>
noremap <Down> <Nop>
nnoremap <Left> <Nop> 
nnoremap <Right> <Nop>

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

nmap <Left> [b
nmap <Right> ]b
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
map gc <plug>Commentary
nmap gcc <plug>CommentaryLine

" Removes Hightlights from search
noremap <esc> :noh<return><esc>
"
" Emmet Completion
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
nnoremap <silent><Leader>e :Unite menu:vim -silent<return>
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

" FZF jump to tag - Requires Ctags
fu! FzfTagsCurrWord()
	call fzf#vim#tags({'options': '-q '.shellescape(expand('<cword>')), 'down': '~20%'})
endfu
nnoremap <silent><leader>j :call FzfTagsCurrWord()<CR>

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
