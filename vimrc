" ~/.vimr
" vim:set ft=vim tw=78 sw=2 foldmethod=marker:


" Pathogen {{{1
filetype off
execute pathogen#infect()
syntax on
filetype plugin indent on


" General {{{1

set nocompatible                " Choose no compatibility with legacy vi
syntax enable                   " <enable> use color scheme, <on> overrides with default colors
set encoding=utf-8
set showcmd                     " Display incomplete commands

set scrolloff=10                " Scroll when 10 lines from top/bottom
set sidescrolloff=10            " Scroll when 10 columns from left/right

set number                      " Line numbers in the left margin. Hide with set number!
set relativenumber              " Relative numbering
set cursorline                  " Highlight the cursor line
set autoread
set hidden
set smartindent
set vb t_vb="
set textwidth=0                 " No annoying word wrapping
set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<
set list                        " Show non-space whitespaces with set list!
set smarttab                    " Be smart when using tabs
set t_Co=256

" Whitespace
set nowrap                      " Don't wrap lines
set tabstop=4 shiftwidth=4      " A tab is two spaces (or set this to 4)
set softtabstop=4
set expandtab                   " Use spaces, not tabs (optional)
set backspace=2

" Searching
set hlsearch                    " Highlight matches
set incsearch                   " Incremental searching
set ignorecase                  " Searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter

" Text folding                  " :help fold-commands 
set foldmethod=syntax

" File, backup and undo
set noswapfile
set nobackup
set nowritebackup
set autoindent


" Cross platform support - http://stackoverflow.com/questions/10612362/setting-up-gvim-on-windows
scriptencoding utf-8
let g:my_vim_dir=expand("$HOME/.vim")
if has("win32") || has("win64")
  execute "set rtp^=".g:my_vim_dir
  execute "set rtp+=".g:my_vim_dir."\\after"
  let &rtp=substitute(&rtp,"[/]","\\","g")
  if &shell=~#'bash$'
    set shell=$COMSPEC " sets shell to correct path for cmd.exe
  endif
endif

" Custom {{{1

let mapleader = ","
let g:mapleader = ","
inoremap jk <esc>
inoremap <esc> <nop>
map <Left> :echo '<<<'<cr>
map <Right> :echo '>>>'<cr>
map <Up> :echo '^^^'<cr>
map <Down> :echo '___'<cr>

" Testing
set statusline=%<%f\ %h%m%r%q\ %{fugitive#statusline()}%=\ char(%b,0x%B)\ %l,%v\ [%p%%]b%n
set laststatus=2            " Always put a status line in, even if only one window
set ch=2                    " Command line height
set guioptions=cg           " was egmLt
set virtualedit=all         " move over imaginary spaces on empty lines
set wildmenu
map <leader>fx :1,%s/>\s*</>\r</g<CR>gg=G
nmap <leader>csv :%s/\s\+$//g<cr>:%le<cr>:4,$ v/^"/normal kA jkJ/g<cr>

highlight Pmenu ctermbg=238 gui=bold

colorscheme molokai


" Plugin hotkeys {{{1

map <leader>g :GundoToggle<cr>
nmap <leader>md :%!/usr/local/bin/Markdown.pl --html4tags<cr> 

" csv {{{2

let g:csv_nomap_j = 1
let g:csv_nomap_k = 1
let g:csv_nomap_cr = 1

" TweetVim  {{{2


nnoremap <silent> s  :<C-u>TweetVimSay<CR>
nnoremap <silent> t  :TweetVimHomeTimeline<CR>
nnoremap <silent> tm :TweetVimMentions<CR>


" Filetype handling {{{1

autocmd FileType python set sw=4 sts=4 omnifunc=pythoncomplete#Complete
autocmd FileType ruby,haml,eruby,yaml,html,javascript,sass,cucumber set ai sw=2 sts=2
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP


" Database connections {{{1
" Add environment specific database to ~/.vimdb.local

let g:dbext_default_profile_django_book = 'type=MYSQL:user=WebDevUser:passwd=WebDevUser:dbname=WebDev:extra=-t'
let g:dbext_default_profile_mysql_test = 'type=MYSQL:user=WebDevUser:passwd=WebDevUser:dbname=test:extra=-t'
let g:dbext_default_profile_sqlexpress = 'type=SQLSRV:integratedLogin=1:srvname=<see Connection Properties, Server Name>:dbname=AdventureWorks:extra=-t'
if filereadable(glob("~/.vimdb.local"))
    " Add this file to a security repository
    source ~/.vimdb.local
endif
