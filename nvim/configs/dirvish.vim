augroup dirvish_mapping
    autocmd!
    autocmd filetype dirvish call DirvishMapping()
augroup END

function! DirvishMapping()
    nmap <buffer> o <CR>
    nmap <buffer> <esc> q
endfunction
