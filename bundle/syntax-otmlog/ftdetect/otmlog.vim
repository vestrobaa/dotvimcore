" otmlog
autocmd BufNewFile,BufRead *.txt
    \ if getline(1) =~ '^\(\S*\s*\)\{3}\s*\<\(debug\|error\)\>' |
    \   set ft=otmlog |
    \ endif
