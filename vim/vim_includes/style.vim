syntax enable
" set t_Co=256
set background=dark
colorscheme one 
highlight Normal ctermbg=NONE
highlight nonText ctermbg=NONE
set cursorline
highlight CursorLine cterm=NONE ctermbg=Black guibg=Black
set listchars=tab:▸\ ,eol:¬
let g:airline_theme="wombat"
let g:enable_bold_font = 1
au BufNewFile,BufRead *.ss      setf xhtml
