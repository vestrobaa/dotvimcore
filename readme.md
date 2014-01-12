###VIM

My [Vim][1] [configuration][5]


###Install Vim configuration

Install the configuration files from [GitHub][6]

    git clone git://github.com/vestrobaa/dotvimcore.git ~/.vim 
    ln -s ~/.vim/vimrc ~/.vimrc
    ln -s ~/.vim/gvimrc ~/.gvimrc

To install on Windows:

    Configure environment variable home=%userprofile%
    git clone git://github.com/vestrobaa/dotvimcore.git %userprofile%\.vim
    cp $userprofile%\.vim\gvimrc.sample %userprofile%\.vim\gvimrc
    mklink /h _vimrc %userprofile%\.vim\vimrc
    mklink /h _gvimrc %userprofile%\.vim\gvimrc


###Install Vim plugins

    cd ~/.vim
    git submodule init
    git submodule update

Or upgrade to the latest version of each

    git submodule foreach git submodule init
    git submodule foreach git submodule update
    git submodule foreach git pull origin master


###Vim Plugins

I'm using the following Vim plugins:

1. General
    - [CtrlP][20] fuzzy file finder
    - [Unimpaired][22] [easymotion][21] navigation
    - [Mustang][80], [distinguished][81] color schemes
    - [Surround][82] text tagging
    - Must have [Twitter][83]!
1. Version Control
    - [Git][30] [fugitive][31] plugin, [color][32]
    - [Gundo][32] vim undo tree
1. Languages
    - [Markdown][40] [plugin][41], [color][42]. Preview in [Chrome][2]
    - [Python][52] [syntax][50], [style][51]
    - [Ruby][60] on [Rails][61] [plugin][62]. Syntax helpers for [end][63] and [cucumber][64].
    - [SQL][70]
1. External tools
    - [Exuberant Ctags][90]
    - Markdown to html: Put [Markdown.pl][3] in the path or in /usr/local/bin


###Plugin install process with ~/.vim in Git

    cd ~/.vim
    git submodule init
    git submodule add git://whatever.git bundle/whatever
    git commit -m 'Added submodule whatever'
    git push

###Plugin removal process

Remove the plugin files in the bundle subfolder. If you are tracking your Vim configuration in Git, use:

    vim .git/config # remove the submodule x's lines
    vim .gitmodules # remove the submudule x's lines
    rm -rf .git/modules/bundle/x
    git rm --cached bundle/x (no trailing slash, not the right spot in the sequence...)
    rm -rf bundle/x
    Commit


###Usage

CtrlP: `<c-p>`  
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

    :DBPromptForBufferParameters - Connect to the database
    <leader>se[ |l] - SQL execute ( )visual selection, (l)ine, 
    <leader>s[t|T|w|a] - SQL select from (t)able, (T)op from table, from table (w)here, from <(a)sk table name>
    <leader>sd[t|v|p] - SQL describe (t)able, (v)iew, (p)rocedure
    <leader>sl[t|v|p|c] - SQL list (t)able, (v)iew, (p)rocedure, (c)olumn
    <leader>sh - SQL history

Exuberant Ctags:

Generate tags   `ctags -R .`  
Jump to a tag   `<c-]>` or back `<c-t>`  
Code options    `<c-x><c-o>`  
Code completion `<c-x><c-]>`  


[1]: http://www.vim.org/
[5]: https://github.com/vestrobaa/dotvimcore
[2]: https://chrome.google.com/webstore/detail/jmchmkecamhbiokiopfpnfgbidieafmd 
[3]: http://daringfireball.net/projects/markdown/ 
[4]: https://github.com/tpope
[6]: http://github.com
[20]: https://github.com/kien/ctrlp.vim 
[21]: https://github.com/Lokaltog/vim-easymotion
[22]: https://github.com/tpope/vim-unimpaired
[30]: http://http://git-scm.com/
[31]: https://github.com/tpope/vim-fugitive
[32]: https://github.com/tpope/vim-git
[32]: https://github.com/sjl/gundo.vim
[40]: http://daringfireball.net/projects/markdown/ 
[41]: https://github.com/tpope/vim-markdown
[42]: https://github.com/plasticboy/vim-markdown
[50]: https://github.com/scrooloose/syntastic
[51]: https://github.com/vim-scripts/pep8
[52]: http://www.python.org/
[60]: http://www.ruby-lang.org
[61]: http://rubyonrails.org
[62]: https://github.com/tpope/vim-rails
[63]: http://github.com/tpope/vim-endwise
[64]: http://github.com/tpope/vim-cucumber
[70]: https://github.com/vim-scripts/dbext.vim
[80]: https://github.com/croaker/mustang-vim
[81]: https://github.com/Lokaltog/vim-distinguished
[82]: https://github.com/tpope/vim-surround.git
[83]: https://github.com/basyura/TweetVim
[90]: http://ctags.sourceforge.net
