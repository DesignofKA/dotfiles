nnoremap <Leader>b :Buffers<return>
nnoremap <Leader>l :BLines<return>
nnoremap <Leader>m :History<return>

" Snippets
nnoremap <Leader>i :Snippets<return>
inoremap <Leader>i <ESC>:Snippets<return>

let g:unite_source_menu_menus = {}

" vim menu {{{
let g:unite_source_menu_menus.vim = {
	\ 'description' : '            Edit Vimrc
        \                                                   ',
    \}
let g:unite_source_menu_menus.vim.command_candidates = [
    \['▷ Edit Vimrc',
        \'edit $MYVIMRC'],
    \['▷ Edit Key Bindings',
        \'edit ~/.vim/setup/bindings.vim'],
    \['▷ Edit Vim-Unite-FZF',
        \'edit ~/.vim/setup/unite.vim'],
    \['▷ Edit Vim-Style',
        \'edit ~/.vim/setup/style.vim'],
    \['▷ Edit Zsh',
        \'edit ~/.zshrc'],
    \['▷ Edit Tmux',
        \'edit ~/.tmux.conf'],
    \]
nnoremap <silent><Leader>t :Unite menu:vim -silent<return>
" }}}
