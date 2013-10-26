function! FreemindToTextFunction()
    silent! set ft=
    silent! set tw=78
    silent! % s/^\(\s*\).*TEXT="\([^"]*\)".*$/\1- \2/g
    silent! v/^\s*-/d
    silent! %s/&apos;/'/g
    silent! %s/&quot;/"/g
    silent! %s/&#x2019;/'/g
    silent! normal gggqG
    silent! g/^-/s/- //
    silent! g/^\w/t.|s/./=/g
    silent! % s/^\s\{4}//
    silent! % s/^-/o
    silent! g/^\s*-/normal O
    silent! % s/\s\{8}\zs-/#/
    silent! normal gg
endfunction

command! FreemindToText call FreemindToTextFunction()
