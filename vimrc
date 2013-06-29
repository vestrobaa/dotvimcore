""""""""""""""""""""""""""""""""""""""""""
" General settings
""""""""""""""""""""""""""""""""""""""""""
set nocompatible                " Choose no compatibility with legacy vi
syntax enable                   " <enable> use color scheme, <on> overrides with default colors
set encoding=utf-8
set showcmd                     " Display incomplete commands
filetype plugin indent on       " Load file type plugins + indentation

set scrolloff=7                 " Set 7 lines to the cursor. Try 999 to keep cursor in the middle of the screen.
set number                      " Line numbers in the left margin. Hide with set number!
set ruler                       " Show cursor coordinates
set autoread
set hidden
set smartindent
set vb t_vb="
set textwidth=0                 " No annoying word wrapping
set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<
set list                        " Show non-space whitespaces with set list!
set smarttab                    " Be smart when using tabs

" Whitespace
set nowrap                      " Don't wrap lines
set tabstop=4 shiftwidth=4      " A tab is two spaces (or set this to 4)
set expandtab                   " Use spaces, not tabs (optional)
set backspace=indent,eol,start ",2  " Backspace through everything in insert mode

" Searching
set hlsearch                    " Highlight matches
set incsearch                   " Incremental searching
set ignorecase                  " Searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter

" Text folding                  " :help fold-commands 
set foldmethod=indent
set foldlevel=99

" File, backup and undo
set noswapfile
set nobackup
set nowritebackup
set autoindent
set softtabstop=4


" Cross platform support - http://stackoverflow.com/questions/10612362/setting-up-gvim-on-windows
scriptencoding utf-8
let g:my_vim_dir=expand("$HOME/.vim")
if has("win16") || has("win32") || has("win64")
  execute "set rtp^=".g:my_vim_dir
  execute "set rtp+=".g:my_vim_dir."\\after"
  let &rtp=substitute(&rtp,"[/]","\\","g")
  if &shell=~#'bash$'
    set shell=$COMSPEC " sets shell to correct path for cmd.exe
  endif
endif

" Pathogen plugin isolation
filetype off
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

" Set Mapleader
let mapleader = ","
let g:mapleader = ","

" Custom
:inoremap jk <esc>
:inoremap <esc> <nop>
map <Left> :echo '<<<<'<cr>
map <Right> :echo '>>>>'<cr>
map <Up> :echo '^^^^'<cr>
map <Down> :echo '____'<cr>

" Testing
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P

""""""""""""""""""""""""""""""""""""""""""
" Plugin hotkeys
""""""""""""""""""""""""""""""""""""""""""
map <leader>g :GundoToggle<cr>
let g:pep8_map='<leader>8'             " sudo pip install pep8
nmap <leader>md :%!/usr/local/bin/Markdown.pl --html4tags<cr> 

autocmd FileType python set sw=4 sts=4 omnifunc=pythoncomplete#Complete
autocmd FileType ruby,haml,eruby,yaml,html,javascript,sass,cucumber set ai sw=2 sts=2
"autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
"autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP

set t_Co=256                    "Theme for terminal vim
colorscheme distinguished

if has("autocmd")
    filetype plugin indent on
endif

""""""""""""""""""""""""""""""""""""""""""
" Database connections
""""""""""""""""""""""""""""""""""""""""""
let g:dbext_default_profile_django_book = 'type=MYSQL:user=WebDevUser:passwd=WebDevUser:dbname=WebDev:extra=-t'
let g:dbext_default_profile_mysql_test = 'type=MYSQL:user=WebDevUser:passwd=WebDevUser:dbname=test:extra=-t'
let g:dbext_default_profile_sqlexpress = 'type=SQLSRV:integratedLogin=1:dbname=AdventureWorks:extra=-t'

