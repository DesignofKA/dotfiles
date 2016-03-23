" escape commands
ino jk <esc>
cno jk <c-c>
vno v <esc> 

" save on enter (normal)
nmap <leader><cr> :write<cr>

" Stop macro recording - Practise this 
" nnoremap q <nop>
" map q <nop>

noremap <c-j> 5j
noremap <c-k> 5k

" Use underscore to clear searchs
nnoremap <silent> _ :nohl<CR>

noremap <buffer> <silent> 0 g0
noremap <buffer> <silent> $ g$

vmap v <plug>(expand_region_expand)
vmap <c-v> <plug>(expand_region_shrink)

map <leader>e <plug>(easymotion-prefix)
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

" |===============================================================
" | Most Leader Key Bindings	
" |===============================================================

nnoremap <leader>t :FZF<return>
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
nnoremap <Leader>b :Buffers<return> 

map <Leader>a :bprev<Return>
map <Leader>s :bnext<Return>
map <Leader>d :BD<Return>

" Enter to end, Backspace to top
nnoremap <CR> G
nnoremap <BS> gg
vnoremap <CR> G
vnoremap <BS> gg

nmap \ :Ag

"Show hidden files in NerdTree
let NERDTreeShowHidden=0
nnoremap <leader>n :NERDTreeToggle<CR>

" Forces < and > movement in normal & visual mode
noremap <Up> <Nop>
noremap <Down> <Nop>
nnoremap <Left> <Nop> 
nnoremap <Right> <Nop>

nmap < <<
nmap <Left> <

nmap > >>
nmap <Right> >

vmap < <gv
vmap <Left> <gv

vmap > >gv
vmap <Right> >gv

nmap <Up> [e
nmap <Down> ]e
vmap <Up> [egv
vmap <Down> ]egv

" Gundo Toggle
nnoremap <leader>u :GundoToggle<Return>

" Comments toggle
imap cc <esc>:Commentary<cr>i
nmap <Leader>c :Commentary<cr>
vmap <Leader>c :Commentary<cr>

" Removes Hightlights from search
noremap <esc> :noh<return><esc>
"
" Emmet Completion
imap hh <C-Y>,<esc>li

imap <C-j> <Down>
imap <C-k> <Up>
imap <C-h> <Left>
imap <C-l> <Right>

nnoremap <silent><Leader>e :Unite menu:vim -silent<return>
nnoremap <Leader>D :Dispatch! 
nnoremap <Leader>Dc :Dispatch! sudo /usr/local/bin/ctags -R .<return> 
nnoremap <Leader>Do :Copen<cr> 

" Got to command line using Leader ;
nmap <Leader>; :
vmap <leader>; :

" Enter Visual Mode with Leader x 2
nmap <leader><leader> V

" |===============================================================
" |	Window Navigation
" |===============================================================

" Navigate between windows using g + direction
nnoremap gh <C-W><C-H>
nnoremap gj <C-W><C-J>
nnoremap gk <C-W><C-K>
nnoremap gl <C-W><C-L>

" Either enter number then tab to move to window, or press tab twice to go to new window, or enter tab then direction 
nnoremap <tab> <c-w>
nnoremap <tab><tab> <c-w><c-w>

" FZF jump to tag - Requires Ctags
fu! FzfTagsCurrWord()
	call fzf#vim#tags({'options': '-q '.shellescape(expand('<cword>')), 'down': '~20%'})
endfu
nnoremap <silent><leader>j :call FzfTagsCurrWord()<CR>

" vp doesn't replace paste buffer
function! Restoreregister()
	let @" = s:restore_reg
	return ''
endfunction
function! s:repl()
	let s:restore_reg = @"
	return "p@=restoreregister()\<cr>"
endfunction
vmap <silent> <expr> p <sid>repl()

" change search result using cs then . to repeat
vnoremap <silent> s //e<c-r>=&selection=='exclusive'?'+1':''<cr><cr>
			\:<c-u>call histdel('search',-1)<bar>let @/=histget('search',-1)<cr>gv
omap s :normal vs<cr>


" gi - goes to the last edit location
