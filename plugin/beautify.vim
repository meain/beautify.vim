" Auto pep8
augroup autopep8
    autocmd!
    autocmd Filetype python command! Beautify :normal! :%! autopep8 %<cr>
augroup END

" File beautify on for html, css, js
augroup jsbeautify
    autocmd!
    autocmd Filetype html,css,javascript,json command! Beatify :normal! :%! js-beautify %<cr>
augroup END

function! g:CSScomb(count, line1, line2)
    let content = getline(a:line1, a:line2)
    let tempFile = tempname() . '.' . &filetype
    call writefile(content, tempFile)
    let systemOutput = system('csscomb ' . shellescape(tempFile))
    if len(systemOutput)
        echoerr split(systemOutput, "\n")[1]
    else
        let lines = readfile(tempFile)
        call setline(a:line1, lines)
    endif
endfunction
augroup jsbeautify
    autocmd!
    autocmd Filetype css command! -nargs=? -range=% CSScomb :call g:CSScomb(<count>, <line1>, <line2>, <f-args>)
augroup END
