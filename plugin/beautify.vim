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

