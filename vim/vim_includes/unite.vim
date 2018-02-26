let g:unite_source_menu_menus = {}

" vim menu {{{
let g:unite_source_menu_menus.vim = {
	\ 'description' : '            Edit Config Files
        \                                                   ',
    \}
let g:unite_source_menu_menus.vim.command_candidates = [
    \['▷  Open Terminal',
        \'term'],
    \['▷  Edit Vimrc/Nvimrc',
        \'edit $MYVIMRC'],
    \['▷  Edit Key Bindings',
        \'edit ~/.vim/setup/bindings.vim'],
    \['▷  Edit Vim-Unite-FZF',
        \'edit ~/.vim/setup/unite.vim'],
    \['▷  Edit Vim-Styling',
        \'edit ~/.vim/setup/style.vim'],
    \['▷  Edit Aliases (Zsh)',
        \'edit ~/.aliases.zsh'],
    \['▷  Edit Zsh',
        \'edit ~/.zshrc'],
    \['▷  Edit Tmux',
        \'edit ~/.tmux.conf'],
    \['▷  Edit HyperTerm',
        \'edit ~/.hyper.js'],
    \['▷  Edit All Snippets (UltiSnips)',
        \'edit ~/.vim/UltiSnips/all.snippets'],
    \['▷  Edit CSS Snippets (UltiSnips)',
        \'edit ~/.vim/UltiSnips/css.snippets'],
    \['▷  Edit PHP Snippets (UltiSnips)',
        \'edit ~/.vim/UltiSnips/php.snippets'],
    \['▷  Edit HTM Snippets (UltiSnips)',
        \'edit ~/.vim/UltiSnips/htm.snippets'],
	\['▷  Edit JS Snippets (UltiSnips)',
		\'edit ~/.vim/UltiSnips/javascript.snippets'],
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
