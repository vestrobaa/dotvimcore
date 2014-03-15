if has("unix")
    set guifont=Ubuntu\ Mono\ 14

    let g:fullscreen_colorscheme = "iawriter"
    let g:fullscreen_font = "Ubuntu\ Mono\ 12"
    let g:normal_colorscheme= g:colors_name
    let g:normal_font=&guifont

    "let g:seoul256_background = 233
    "colo seoul256
    let g:seoul256_background = 256
    colo seoul256-light

elseif has("win32") ||  has("win64")
    set guifont=Consolas:h10:cANSI

    if &background == "dark"
        hi normal guibg=black
    endif

    set guioptions -=T
    set guioptions -=r
    set guioptions -=l
    set guioptions -=b

    let g:seoul256_background = 256
    colo seoul256-light

elseif has("macunix")
    set guifont=Menlo\ Regular:h12

    winpos 60 60
    winsize 80 50

    set guioptions -=T
    set guioptions -=r
    set guioptions -=l
    set guioptions -=b

    colo badwolf

else
    colo molokai
endif
