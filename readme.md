###VIM

My [Vim][1] [configuration][5]

###Installation

    git clone git://github.com/vestrobaa/dotvimcore.git ~/.vim 

###Configuration

    ln -s ~/.vim/vimrc ~/.vimrc
    ln -s ~/.vim/gvimrc ~/.gvimrc

###Windows configuration

    Configure environment variable home=%userprofile%
    git clone target: %userprofile%\.vim or %userprofile%\vimfiles
    cp $userprofile%\.vim\gvimrc.sample %userprofile%\.vim\gvimrc
    mklink /h _vimrc %userprofile%\.vim\vimrc
    mklink /h _gvimrc %userprofile%\.vim\gvimrc

###Install/upgrade plugins

    cd ~/.vim
    git submodule init
    git submodule update
    git submodule foreach git submodule init
    git submodule foreach git pull origin master

###Optional plugin steps

Browser markdown support

- Chrome [Markdown preview][2]. Enable the option Allow access to file URLs. Note, check option to disable autorefresh.
- Firefox ...
- Markdown to html: Put [Markdown.pl][3] in the path or in /usr/local/bin


###Submodules installed

Beware of too many or unsupported plugins. Most plugins replicate default Vim behaviour in non-Vim conventions. Yes, and [Tim Pope][4] is the Vim plugin king.

1. General
    - [CtrlP][20] fuzzy file finder
    - [Easymotion][21] navigation
1. Version Control
    - [Git][30] [fugitive][31] plugin, [color][32]
    - [Gundo][32] vim undo tree
1. Languages
    - [Markdown][40] [plugin][41], [color][42]
    - Python [syntax][50], [style][51]
    - [Ruby][60] on [Rails][61] [plugin][62]
    - [SQL][70]
1. Color schemes: [mustang][80], [distinguished][81]


###Plugin removal process

    vim .git/config and remove the submodule lines
    vim .gitmodules and remove the submudule lines
    rm -rf .git/modules/bundle/x
    git rm --cached bundle/x (no trailing slash, not the right spot in the sequence...)
    rm -rf bundle/x
    Commit


###Plugin usage

CtrlP fuzzy file search: `<c-p>`  
Easymotion: `<leader><leader>movement`, `,,w`  
Markdown html expand: `<leader>md`  
Gundo file histroy: `<leader>g`  
Taglist: `<leader>.`  
Surround text:  

    cs<from><to>, cs"', cst<to> - Change surrounding character, string or <tag> combination  
    ds" - Delete surrounding "  
    ysiw] - Yank and surround the inner word with ]. Use [{( or ]}) to unclude a space
    yss" - Yank and surround the line with "  
    ys$" - Yank and surround the rest of the line with "  

DbExt:

    <leader>se[ |l] - SQL execute ( )visual selection, (l)ine, 
    <leader>s[t|T|w|a] - SQL select from (t)able, (T)op from table, from table (w)here, from <(a)sk table name>
    <leader>sd[t|v|p] - SQL describe (t)able, (v)iew, (p)rocedure
    <leader>sl[t|v|p|c] - SQL list (t)able, (v)iew, (p)rocedure, (c)olumn
    <leader>sh - SQL history

###TODO

1. Installation specific gvimrc. gvimrc settings for a good looking gvim is different on each computer
1. Get an autogenerated markdown version of the settins and plugins for one stop documentation 
1. Get standard tagging and ctags to work
1. Git a git branch indicator
1. Get standard spelling to work
[1]: http://www.vim.org/
[5]: https://github.com/vestrobaa/dotvimcore
[2]: https://chrome.google.com/webstore/detail/jmchmkecamhbiokiopfpnfgbidieafmd 
[3]: http://daringfireball.net/projects/markdown/ 
[4]: https://github.com/tpope

[20]: https://github.com/kien/ctrlp.vim 
[21]: https://github.com/Lokaltog/vim-easymotion
[30]: http://http://git-scm.com/
[31]: https://github.com/tpope/vim-fugitive
[32]: https://github.com/tpope/vim-git
[32]: https://github.com/sjl/gundo.vim
[40]: http://daringfireball.net/projects/markdown/ 
[41]: https://github.com/tpope/vim-markdown
[42]: https://github.com/plasticboy/vim-markdown
[50]: https://github.com/scrooloose/syntastic
[51]: https://github.com/vim-scripts/pep8
[62]: https://github.com/tpope/vim-rails
[70]: https://github.com/vim-scripts/dbext.vim
[80]: https://github.com/croaker/mustang-vim
[81]: https://github.com/Lokaltog/vim-distinguished
