" ----------------------------------------------------------------------------
" BTags
" ----------------------------------------------------------------------------
function! s:align_lists(lists)
  let maxes = {}
  for list in a:lists
    let i = 0
    while i < len(list)
      let maxes[i] = max([get(maxes, i, 0), len(list[i])])
      let i += 1
    endwhile
  endfor
  for list in a:lists
    call map(list, "printf('%-'.maxes[v:key].'s', v:val)")
  endfor
  return a:lists
endfunction

function! s:btags_source()
  let lines = map(split(system(printf(
    \ 'ctags -f - --sort=no --fields=nKs --excmd=pattern --language-force=%s %s',
    \ &filetype, expand('%:S'))), "\n"), 'split(v:val, "\t")')
  if v:shell_error
    throw 'failed to extract tags'
  endif
  return map(s:align_lists(lines), 'join(v:val, "\t")')
endfunction

function! s:btags_sink(line)
  let lines = split(a:line, "\t")
  for line in lines
      let arr = split(line, ":")
      if arr[0] == "line"
          exec arr[-1]
      endif
  endfor
  sil! norm! zvzz
endfunction

function! s:btags()
  try
    call fzf#run({'source':  s:btags_source(),
                 \'down':    '50%',
                 \'options': '+m -d "\t" --with-nth 4,1',
                 \'sink':    function('s:btags_sink')})
  catch
    echohl WarningMsg
    echom v:exception
    echohl None
  endtry
endfunction

command! BTags call s:btags()
