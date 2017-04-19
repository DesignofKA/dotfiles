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
    \['▷  Mount Remote',
        \'Unite menu:mount -silent -start-insert -ignorecase -direction=botright'],
    \['▷  Enter Remote Folder',
        \'Unite menu:remote -silent -start-insert -ignorecase -direction=botright'],
    \['▷  Enter Local Folder',
        \'e ~/Documents/FseSites/'],
    \['▷  Edit Key Bindings',
        \'edit ~/.vim/setup/bindings.vim'],
    \['▷  Edit Vim-Unite-FZF',
        \'edit ~/.vim/setup/unite.vim'],
    \['▷  Edit Vim-Styling',
        \'edit ~/.vim/setup/style.vim'],
    \['▷  Edit Zsh',
        \'edit ~/.zshrc'],
    \['▷  Edit Tmux',
        \'edit ~/.tmux.conf'],
    \['▷  Edit Ctags',
        \'edit ~/.ctags'],
    \['▷  Edit All Snippets (UltiSnips)',
        \'edit ~/.vim/Ultisnips/all.snippets'],
    \['▷  Edit CSS Snippets (UltiSnips)',
        \'edit ~/.vim/Ultisnips/css.snippets'],
    \['▷  Edit PHP Snippets (UltiSnips)',
        \'edit ~/.vim/Ultisnips/php.snippets'],
	\['▷  Edit JS Snippets (UltiSnips)',
			\'edit ~/.vim/Ultisnips/javascript.snippets'],
    \]
" }}}

" vim menu {{{
let g:unite_source_menu_menus.mount = {
	\ 'description' : '            Mount Remote Folder
        \                                                   ',
    \}
let g:unite_source_menu_menus.mount.command_candidates = [
    \['▷  Cygnus',
        \'!sshfs cygnustrust@91.109.4.251:/home/cygnustrust/public_html/ ~/Documents/mnt/cygnus/'],
    \['▷  Lisas Flowers',
        \'!sshfs lisasflowers@91.109.4.251:/home/lisasflowers/public_html/ ~/Documents/mnt/lisasflowers/'],
    \['▷  Wychwood',
        \'!sshfs wychwood@91.109.4.251:/home/wychwood/public_html/ ~/Documents/mnt/wychwood/'],
    \]
" }}}
"
" vim menu {{{
let g:unite_source_menu_menus.remote = {
	\ 'description' : '            Explore Remote Folder
        \                                                   ',
    \}
let g:unite_source_menu_menus.remote.command_candidates = [
    \['▷  Cygnus',
        \'mounter cygnustrust'],
    \['▷  Lisas Flowers',
        \'Explore ~/Documents/mnt/lisasflowers'],
    \['▷  Wychwood',
        \'Explore ~/Documents/mnt/wychwood'],
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
