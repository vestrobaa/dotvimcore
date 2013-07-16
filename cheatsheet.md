###Vim Cheat Sheet

'Learning:'

Verfiy that I know all the single key commands

####General

Insert control character: <c-v><c-w>

####Visual


####Format


==  - Auto format line
ggVG=  - Auto format document

####Windows 

<c-w>[movement]
<c-w>[Movement]
<c-w>o  - Only window
<c-w>c  - Close window

####Navigation

`.  - Last change
E   - Man for word under the cursor

####Folding

ggzi - Unfold all

####???
gggqG

####Tags

Just comments, need to work out the taggins system

1. Project root: `ctags -R`  
1. Jump: `c-]`
1. Back: `c-T`
1. Go to tag: `ta`
1. List: `tl`
1. t - (l)ist, (f)irst, (l)ast, (n)ext, (p)revious


####Spelling

tbd


##Debugging

:verbose set foldmethod
:scriptnames

Override path to vimrc and gvimrc
vim -u NONE -U NONE
Now source individual plugins
:so plugin/fugitive.vim

Get a startup log
vim +q --startuptime startuptime.txt

Check features
if has("spell")
    nnoremap <leader>s :set spell!<CR>
endif

Check an option
if exists("&foldenable")
    set foldenable
endif

Check special features
if has("unix")
    set guifont=Inconsolata\ 14
else
    set guifont=Consolas:h12
endif
