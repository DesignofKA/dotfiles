" Escape commands
ino jk <esc>
cno jk <c-c>
vno v <esc> 

" Save on Enter (Normal)
nmap <leader><cr> :write<cr>

nnoremap Q <nop>
map q <Nop>

noremap <C-H> ^
noremap <C-L> g_
noremap <C-J> 5j
noremap <C-K> 5k

" Enter Visual Mode with Leader x 2
nmap <leader><leader> V

vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

map <Leader>e <Plug>(easymotion-prefix)
map  / <Plug>(easymotion-sn)

vmap <Leader>y "+y 
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P
vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]

" vp doesn't replace paste buffer
function! RestoreRegister()
	let @" = s:restore_reg
	return ''
endfunction
function! s:Repl()
	let s:restore_reg = @"
	return "p@=RestoreRegister()\<cr>"
endfunction
vmap <silent> <expr> p <sid>Repl()

" Change search result using cs then . to repeat
vnoremap <silent> s //e<C-r>=&selection=='exclusive'?'+1':''<CR><CR>
			\:<C-u>call histdel('search',-1)<Bar>let @/=histget('search',-1)<CR>gv
omap s :normal vs<CR>

nnoremap <leader>f :FZF<return>
nnoremap <leader>w :w<CR>
nnoremap <leader>W :w !sudo tee % > /dev/null %<return>
nnoremap <leader>q :q<CR>
nnoremap <leader>Q :q!<CR>
nnoremap <leader>v :vsp<CR>
nnoremap <leader>x :x<CR>

map <Leader>a :bprev<Return>
map <Leader>s :bnext<Return>
map <Leader>d :bd<Return>

" Enter to end, Backspace to top
nnoremap <CR> G
nnoremap <BS> gg
vnoremap <CR> G
vnoremap <BS> gg

nmap \ :Ag

" tab navigation
" nnoremap <C-S-tab> :tabprevious<CR>
" nnoremap <C-tab>   :tabnext<CR>
" nnoremap <C-t>     :tabnew<CR>
" nmap <Leader>ta :tabprevious<CR>
" nmap <Leader>ts :tabnext<CR>
" nmap <Leader>tn :tabnew<CR>

"Show hidden files in NerdTree
let NERDTreeShowHidden=0
nnoremap <leader>n :NERDTreeToggle<CR>

" Forces < and > movement in normal & visual mode
noremap <Up> <Nop>
noremap <Down> <Nop>
nnoremap <Left> <Nop> 
nnoremap <Right> <Nop>

nmap < <<
nmap <Left> <<
nmap > >>
nmap <Right> >>
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

nnoremap <Leader>b :Buffers<return> 
nnoremap <Leader>l :BLines<return> 
nmap <Leader>mh <C-w><left>
nmap <Leader>ml <C-w><right>

nnoremap <silent><Leader>ee :Unite menu:vim -silent<return>
nnoremap <Leader>ed :Dispatch! 
nnoremap <Leader>ec :Dispatch! /usr/local/bin/ctags -R .<return> 
nnoremap <Leader>eo :Copen<cr> 

" Got to command line using Leader ;
nmap <Leader>; :

" Searches tags in current buffer
nmap <Leader>T :BTags<cr>
nmap <leader>t :Tags<cr>
" nmap <leader>tb :TagbarToggle<cr><C-w><right>

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

nnoremap <silent><leader>j :call JumpToSCSS()<CR>zz
