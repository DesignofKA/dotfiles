syntax enable
" set t_Co=256
" set background=dark
colorscheme hybrid_material 
highlight Normal ctermbg=NONE
highlight nonText ctermbg=NONE
hi CursorLine guibg=Grey40
set listchars=tab:▸\ ,eol:¬
let g:airline_theme="hybrid"
let g:enable_bold_font = 1
au BufNewFile,BufRead *.ss      setf xhtml

