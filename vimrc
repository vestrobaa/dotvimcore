" ~/.vimr
" vim:set ft=vim tw=78 sw=2 foldmethod=marker:


" Pathogen {{{1
set nocompatible
set runtimepath+=~/.vim
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

set number                      " Actual number show for the current line, realivenumber is too slow
set cursorline                  " Highlight the cursor line
set autoread
set hidden
set smartindent
set vb t_vb="
set textwidth=0
set list                        " Show non-space whitespaces with set list!
set smarttab                    " Be smart when using tabs
set t_Co=256
set guioptions=cg           " was egmLt
set wildmenu
set cmdheight=2
set laststatus=2
set autoindent

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

" Speed up processing long lines
set synmaxcol=120

" Custom {{{1

let mapleader = ","
let g:mapleader = ","
inoremap fq <esc>
inoremap FQ <esc>
inoremap <esc> <nop>


" Testing {{{1
" Complete {{{2
" Add spell completion, if in spell mode
set complete=.,w,b,u,t,kspell

" Python {{{2

" Need mappings for the standard unittest

" List characters {{{2

if has("multi_byte") 
  if !(has("win32") || has("win64"))
    " Symbol theme
    set listchars=eol:✔,extends:↪,precedes:↩,tab:✖⋅
    " Math theme
    "set listchars=eol:∫,extends:⋯,precedes:⋯,tab:∞⋅,trail:⋅
  else
    set listchars=eol:˺,extends:»,precedes:«,tab:˻\ 
    set fillchars=vert::,fold:\ ,stl:\ ,stlnc::
  endif

  map <Left> :echo repeat('←', winwidth(0)/4)<cr>
  map <Right> :echo repeat('→', winwidth(0)/4)<cr>
  map <Up> :echo repeat('↑', winwidth(0)/4)<cr>
  map <Down> :echo repeat('↓', winwidth(0)/4)<cr>
else
  set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<
  map <Left> :echo repeat('<', winwidth(0)/4)<cr>
  map <Right> :echo repeat('>', winwidth(0)/4)<cr>
  map <Up> :echo repeat('^', winwidth(0)/4)<cr>
  map <Down> :echo repeat('_', winwidth(0)/4)<cr>
endif



" Windows {{{2

" Font size change for Windows
" From http://vim.wikia.com/wiki/Change_font_size_quickly
nnoremap <C-Up> :silent! let &guifont = substitute(
 \ &guifont,
 \ ':h\zs\d\+',
 \ '\=eval(submatch(0)+1)',
 \ '')<CR>
nnoremap <C-Down> :silent! let &guifont = substitute(
 \ &guifont,
 \ ':h\zs\d\+',
 \ '\=eval(submatch(0)-1)',
 \ '')<CR>


" Status bar {{{2

fun! IgnoreCustomSpell()
  syn match CamelCase /\<[A-Z][a-z]\+[A-Z].\{-}\>/ contains=@NoSpell transparent
  syn match UpperCase /\<[A-Z]\+.\{-}\>/ contains=@NoSpell transparent
  syn cluster Spell add=CamelCase
  syn cluster Spell add=UpperCase
endfun

set statusline=%<%f\ %h%m%r%q\ %{fugitive#statusline()}%=\ %a\ %{getline('.')[col('.')-1]}:%b:0x%B\ @\ %v,%l/%Lb%n


" Mappings {{{2

" Fix XML (pretty print)
map <leader>fx :1,%s/>\s*</>\r</g<cr>gg=G

" Old csv fix macro
nmap <leader>csv :%s/\s\+$//g<cr>:%le<cr>:4,$ v/^"/normal kA jkJ/g<cr>
" Join lines in CSV data section that does not start with a quote to the previous line
nmap <leader>csj :4,$ v/^"/normal kJ/g<cr>
" Trim last 4 csv fields
nmap <leader>cs4 :% s/\v(,[^,]*){4}$//ge<cr>

" Change directory to that of the current file
nmap <silent><Leader>cd :lcd %:h<cr>:pwd<cr>

" Agent matching
nmap <leader>af :search('\([0-9]*\)[ \t]debug[ \t]*agent[ /t ]*starting agent[ /t]*\([^(]*\)(\([^)]*\))[^=]*=\(\w[^/.]*\/\w[^/.]*\)\.\(\w[^,]*\)')

" Insert file name
imap <Leader>fn <c-r>=expand('%:t:r')<cr>

" Keep search matches in the middle of the window {{{2
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap g* g*zzzv
nnoremap g# g#zzzv

" Colors {{{2

if has("win32") || has("win64")
  colorscheme otaku
elseif has("unix")
  colorscheme badwolf
elseif has("macunix")
  colo distinguished
else
  colo molokai
endif

" cscope {{{2

if has('cscope')
  set cscopetag cscopeverbose

  if has('quickfix')
    set cscopequickfix=s-,c-,d-,i-,t-,e-
  endif

  cnoreabbrev csa cs add
  cnoreabbrev csf cs find
  cnoreabbrev csk cs kill
  cnoreabbrev csr cs reset
  cnoreabbrev css cs show
  cnoreabbrev csh cs help

  command -nargs=0 Cscope cs add $VIMSRC/src/cscope.out $VIMSRC/src
endif

" Plugin settings and mapped keys {{{1

" GUndo {{{2

map <leader>g :GundoToggle<cr>

" csv {{{2

let g:csv_nomap_j = 1
let g:csv_nomap_k = 1
let g:csv_nomap_cr = 1


" CtrlP {{{2

let g:ctrlp_match_window = 'max:30'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.%(git|hg|svn|venv|__pycache__)$',
  \ 'file': '\v\.%(exe|so|dll|class|o|png|jpg|jpeg|bmp|tar|jar|tgz|deb|zip|zipx|pyc)$',
  \ }
let g:ctrlp_switch_buffer = 'E'
let g:ctrlp_working_path_mode = 'rc'
let g:ctrlp_root_markers = ['readme.md']
let g:ctrlp_open_multiple_files = '2vjr'
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files']

map <leader>fb :CtrlPBuffer<cr>
map <leader>fr :CtrlP .<cr>
map <leader>fc :CtrlPClearAllCaches<cr>


" ctags {{{2

nnoremap <leader>tf :!ctags -R --exclude=*.git --tag-relative=yes *<cr>
nnoremap <leader>tg :!ctags -R -f ./.git/tags --tag-relative=yes --exclude=*.git *<cr>

" python-mode {{{2

" Add check to use python3 if it's in versions and installed
let g:pymode_virtualenv = 1
let g:pymode_options = 1
let g:pymode_folding = 1
let g:pymode_options_colorcolumn = 0
let g:pymode_lint_cwindow = 0
let g:pymode_quickfix_minheight = 6
let g:pymode_quickfix_maxheight = 3
let g:pymode_rope_complete_on_dot = 0
let g:pymode_rope_completion = 0
command RopeToggle let g:pymode_rope = g:pymode_rope ? 0 : 1

" syntastic {{{2

let g:syntastic_mode_map = {
  \ "mode": "active",
  \ "active_filetypes": [],
  \ "passive_filetypes": ["python"] }

" airline {{{2

" simple: let g:airline_section_z = ':%b:%B@%v,%lof%Lon%n'
" Note that the unicode code point is in %b and %B
" let g:airline_section_z = '%{getline(''.'')[col(''.'')-1]}:%b:%B@%v,%lof%Lon%n'
let g:airline_section_z = '%{getline(''.'')[col(''.'')-1]}:%b:%B@%v,%l/%Lb%n'
let g:airline#extensions#whitespace#enabled = 0

" table-mode {{{2

let g:table_mode_corner_corner="+"
let g:table_mode_header_fillchar="="

" Filetype handling {{{1

if has("autocmd")
  " Highlight characters past column 120
  " autocmd FileType python highlight Excess ctermbg=DarkGrey guibg=Black
  " autocmd FileType python match Excess /\%120v.*/
  " autocmd FileType python set foldmethod=indent foldlevel=99
  autocmd FileType python set shiftwidth=4 softtabstop=4 tabstop=4 expandtab shiftround omnifunc=pythoncomplete#Complete
  autocmd FileType ruby,haml,eruby,yaml,html,javascript,sass,cucumber set ai sw=2 sts=2
  autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
  autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
  autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
  autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
  autocmd FileType css set omnifunc=csscomplete#CompleteCSS
  autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
  autocmd FileType php set omnifunc=phpcomplete#CompletePHP
  let pandoc_pipeline  = "pandoc --from=html --to=markdown"
  let pandoc_pipeline .= " | pandoc --from=markdown --to=html"
  autocmd FileType html let &formatprg=pandoc_pipeline
  autocmd FileType otmlog set sw=2 tw=200
endif


" Database connections {{{1
" Add environment specific database to ~/.vimdb.local

let g:dbext_default_profile_django_book = 'type=MYSQL:user=WebDevUser:passwd=WebDevUser:dbname=WebDev:extra=-t'
let g:dbext_default_profile_mysql_test = 'type=MYSQL:user=WebDevUser:passwd=WebDevUser:dbname=test:extra=-t'
let g:dbext_default_profile_sqlexpress = 'type=SQLSRV:integratedLogin=1:srvname=<see Connection Properties, Server Name>:dbname=AdventureWorks:extra=-t'
if filereadable(glob("~/.vimdb.local"))
    " Secure this file
    source ~/.vimdb.local
endif
