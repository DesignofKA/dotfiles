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
    \['▷ Edit UltiSnips',
        \'edit ~/.vim/UltiSnips/all.snippets'],
    \]
" }}}
