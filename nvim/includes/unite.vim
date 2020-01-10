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
        \'edit ~/.config/nvim/bindings.vim'],
    \['▷  Edit Vim-Unite-FZF',
        \'edit ~/.config/nvim/unite.vim'],
    \['▷  Edit Vim-Styling',
        \'edit ~/.config/nvim/style.vim'],
    \['▷  Edit Aliases (Zsh)',
        \'edit ~/.aliases.zsh'],
    \['▷  Edit Zsh',
        \'edit ~/.zshrc'],
    \['▷  Edit Tmux',
        \'edit ~/.tmux.conf'],
    \['▷  Edit HyperTerm',
        \'edit ~/.hyper.js'],
    \['▷  All Snippets (UltiSnips)',
        \'edit ~/.vim/UltiSnips/all.snippets'],
    \['▷  CSS Snippets (UltiSnips)',
        \'edit ~/.vim/UltiSnips/css.snippets'],
    \['▷  PHP Snippets (UltiSnips)',
        \'edit ~/.vim/UltiSnips/php.snippets'],
    \['▷  Dart Snippets (UltiSnips)',
        \'edit ~/.vim/UltiSnips/dart.snippets'],
    \['▷  HTM Snippets (UltiSnips)',
        \'edit ~/.vim/UltiSnips/htm.snippets'],
	\['▷  JS Snippets (UltiSnips)',
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

" Reverse the layout to make the FZF list top-down
let $FZF_DEFAULT_OPTS='--layout=reverse'

" Using the custom window creation function
let g:fzf_layout = { 'window': 'call FloatingFZF()' }

" Function to create the custom floating window
function! FloatingFZF()
  " creates a scratch, unlisted, new, empty, unnamed buffer
  " to be used in the floating window
  let buf = nvim_create_buf(v:false, v:true)

  " 90% of the height
  let height = float2nr(&lines * 0.9)
  " 60% of the height
  let width = float2nr(&columns * 0.6)
  " horizontal position (centralized)
  let horizontal = float2nr((&columns - width) / 2)
  " vertical position (one line down of the top)
  let vertical = 1

  let opts = {
        \ 'relative': 'editor',
        \ 'row': vertical,
        \ 'col': horizontal,
        \ 'width': width,
        \ 'height': height
        \ }

  " open the new window, floating, and enter to it
  call nvim_open_win(buf, v:true, opts)
endfunction

