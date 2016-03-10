" escape commands
ino jk <esc>
cno jk <c-c>
vno v <esc> 

" save on enter (normal)
nmap <leader><cr> :write<cr>

nnoremap q <nop>
map q <nop>

noremap <c-j> 5j
noremap <c-k> 5k

" map ctrl-p to end-of-line (insert mode)
nunmap <c-p>
nmap <c-p> $
vunmap <c-p>
vmap <c-p> $
imap <c-p> <esc>$i<right>

" map ctrl-o to beginning-of-line (insert mode)
nunmap <c-o>
nmap <c-o> 0
vunmap <c-o>
vmap <c-o> 0
imap <c-o> <esc>0i

vmap v <plug>(expand_region_expand)
vmap <c-v> <plug>(expand_region_shrink)

map <leader>e <plug>(easymotion-prefix)
map  / <plug>(easymotion-sn)
map <leader>z <plug>(easymotion-sl)
map f <plug>(easymotion-sl)

vmap <leader>y "+y 
vmap <leader>d "+d
nmap <leader>p "+p
nmap <leader>p "+p
vmap <leader>p "+p
vmap <leader>p "+p
vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]

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

" |===============================================================
" | Most Leader Key Bindings	
" |===============================================================

nnoremap <leader>t :FZF<return>
nnoremap <leader>fb :Buffers<return>
nnoremap <leader>ft :Tags<return>
nnoremap <leader>w :w<cr>
nnoremap <leader>W :w !sudo tee % > /dev/null %<return>
nnoremap <leader>q :q<cr>
nnoremap <leader>Q :q!<cr>
nnoremap <leader>v :vsp<cr>
nnoremap <leader>h :sp<cr>
nnoremap <leader>r <c-w>r
nnoremap <leader>x :x<cr>
nnoremap <Leader>l :BLines<return> 
nnoremap <Leader>b :sp<return> 

" searches tags in current buffer
" nmap <leader>t :btags<cr>
" nmap <leader>t :Tags<cr>
" nmap <leader>tb :TagbarToggle<cr><C-w><right>

map <Leader>a :bprev<Return>
map <Leader>s :bnext<Return>
map <Leader>d :BD<Return>

" resize current buffer by +/- 5 
" nnoremap <D-left> :vertical resize -5<cr>
" nnoremap <D-down> :resize +5<cr>
" nnoremap <D-up> :resize -5<cr>
" nnoremap <D-right> :vertical resize +5<cr>

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

noremap <buffer> <silent> 0 g0
noremap <buffer> <silent> $ g$

" Emmet Completion
imap hh <C-Y>,<esc>li

imap <C-j> <Down>
imap <C-k> <Up>
imap <C-h> <Left>
imap <C-l> <Right>

nnoremap gh <C-W><C-H>
nnoremap gj <C-W><C-J>
nnoremap gk <C-W><C-K>
nnoremap gl <C-W><C-L>

" nnoremap <C-H> <C-W><C-H>
" nnoremap <C-L> <C-W><C-L>

nnoremap <silent><Leader>ee :Unite menu:vim -silent<return>
nnoremap <Leader>ed :Dispatch! 
nnoremap <Leader>ec :Dispatch! /usr/local/bin/ctags -R .<return> 
nnoremap <Leader>eo :Copen<cr> 

" Got to command line using Leader ;
nmap <Leader>; :

" Will only work if build folder is at root
function! JumpToSCSS()
  let id_pos = searchpos("id", "nb", line('.'))[1]
  let class_pos = searchpos("class", "nb", line('.'))[1]

  if class_pos > 0 || id_pos > 0
    if class_pos < id_pos
      execute ":vim '#".expand('<cword>')."' ./build/**/*.scss"
    elseif class_pos > id_pos
      execute ":vim '.".expand('<cword>')."' ./build/**/*.scss"
    endif
  endif
endfunction

" Removes Easy Motion Leader Leader Map
nnoremap <silent><leader>j :call JumpToSCSS()<CR>zz

nunmap <leader><leader>
" Enter Visual Mode with Leader x 2
nmap <leader><leader> V

" Either enter number then tab to move to window, or press tab twice to go to new window, or enter tab then direction 
nnoremap <tab> <c-w>
nnoremap <tab><tab> <c-w><c-w>

" gi - goes to the last edit location
