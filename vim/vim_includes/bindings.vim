" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :vsp ~/.vimrc<CR>
nmap <leader>sv :source $MYVIMRC<CR>

" Escape using jj
ino jk <esc>
cno jk <c-c>

" Window Navigation Within Vim
nnoremap <S-J> <C-W><C-J>
nnoremap <S-K> <C-W><C-K>
nnoremap <S-L> <C-W><C-L>
nnoremap <S-H> <C-W><C-H>

nnoremap Q <nop>
map q <Nop>

noremap <C-H> ^
noremap <C-L> g_
noremap <C-J> 5j
noremap <C-K> 5k

"ctrl + D will delete current line and go into insert mode
noremap <c-d> <esc>ddi

nnoremap <leader>f :FZF<return>
nnoremap <leader>w :w<CR>
nnoremap <leader>W :w !sudo tee % > /dev/null %<return>
nnoremap <leader>q :q<CR>
nnoremap <leader>Q :q!<CR>

" : now becomes ; - much easier
" nnoremap ; :

map <Leader>a :bprev<Return>
map <Leader>s :bnext<Return>
map <Leader>d :bd<Return>

" tab navigation
nnoremap <C-S-tab> :tabprevious<CR>
nnoremap <C-tab>   :tabnext<CR>
nnoremap <C-t>     :tabnew<CR>

"Show hidden files in NerdTree
let NERDTreeShowHidden=1
map <silent> <C-n> :NERDTreeToggle<CR>
nnoremap <leader>n :NERDTreeToggle<CR>

" Forces < and > movement in normal & visual mode
noremap <Up> <Nop>
noremap <Down> <Nop>
nnoremap <Left> <Nop> 
nnoremap <Right> <Nop>

nmap < <<
nmap > >>
vmap < <gv
vmap > >gv

" Gundo Toggle
nnoremap <leader>u :GundoToggle<Return>
" Comments toggle
map <c-_> :Commentary<cr>

" Removes Hightlights from search
nnoremap <esc> :noh<return><esc>

noremap <buffer> <silent> k gk
noremap <buffer> <silent> j gj
noremap <buffer> <silent> 0 g0
noremap <buffer> <silent> $ g$

" Disable default key bindings
let g:simple_todo_map_keys = 0

" Emmet Completion
imap hj <C-Y>,<esc>li

" Insert Hash Quickly
imap hh <a-3>
