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
    \['▷ Edit Ctags',
        \'edit ~/.ctags'],
    \['▷ Edit UltiSnips',
        \'edit ~/.vim/UltiSnips/all.snippets'],
    \]
" }}}

"Grepping Using FZF #TODO File With :File: Name  
function! s:escape(path)  
return substitute(a:path, ' ', '\\ ', 'g')  
endfunction  
"TODO Extend To Other Handlers  
 function! AgHandler(line)  
  let parts = split(a:line, ':')  
  let [fn, lno] = parts[0 : 1]  
  execute 'e '. s:escape(fn)  
  execute lno  
  normal! zz  
 endfunction  
function! FZFGrep(pattern, ...)
let filter = a:0 > 0 ? a:1 : '*'
let command = 'ag -i "'.a:pattern.'" '.filter
call fzf#run({
  \ 'source': command,
  \ 'sink': function('AgHandler'),
  \ 'options': '+m'
  \ })
endfunction
command! -nargs=* FZFGrep call FZFGrep(<f-args>)
