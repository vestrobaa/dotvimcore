[Vim][1] [configuration][5]
====================

From [GitHub][6]

    git clone git://github.com/vestrobaa/dotvimcore.git ~/.vim 
    ln -s ~/.vim/vimrc ~/.vimrc
    ln -s ~/.vim/gvimrc ~/.gvimrc
    cd ~/.vim
    git submodule init
    git submodule update

On Windows

    Configure environment variable home=%userprofile%
    git clone git://github.com/vestrobaa/dotvimcore.git %userprofile%\vimfiles
    cp $userprofile%\.vim\gvimrc.sample %userprofile%\vimfiles\gvimrc
    mklink /h _vimrc %userprofile%\vimfiles\vimrc
    mklink /h _gvimrc %userprofile%\vimfiles\gvimrc
    cd %userprofile%\vimfiles
    git submodule init
    git submodule update


Plugins
-------

- [CtrlP][20] fuzzy file finder
- [Unimpaired][22] navigation
- [Capslock][83] soft caps
- [Goyo][110] focus
- [Surround][82] text markup
- [Metarw][120], [git][122] and [gdrive][121] virtual paths
- [Paper][100], [bad wolf][102] and [base16][101] colors
- [Syntastic][50] syntax checker
- ...


Tools
-----

- [Pandoc][91] universal document converter
- [Exuberant Ctags][90] variable tagger


Usage
=====

Keyboard

    let mapleader = ","
    let g:mapleader = ","
    inoremap fq <esc>
    inoremap FQ <esc>
    inoremap <esc> <nop>
    map <Left> :echo repeat('←', winwidth(0)/4)<cr>
    map <Right> :echo repeat('→', winwidth(0)/4)<cr>
    map <Up> :echo repeat('↑', winwidth(0)/4)<cr>
    map <Down> :echo repeat('↓', winwidth(0)/4)<cr>

Files

-   Open file `<leader>fr`
-   Open buffer `<leader>fb`
-   History `<leader>g`

Format

-   Custom CSV `<leader>cs`
-   XML `<leader>fx`
-   Indent `G=`

Diff

-   Put `dp`
-   Get `do`
-   Next chunk `]c`
-   Previous chunk `[c`

Surround text  

-   cs<from><to>, cs"', cst<to> - Change surrounding character, string or <tag> combination  
-   ds" - Delete surrounding "  
-   ysiw] - Yank and surround the inner word with ]. Use [{( or ]}) to include a space
-   yss" - Yank and surround the line with "  
-   ys$" - Yank and surround the rest of the line with "  
-   <visual>S" - Surround makred text with "

DbExt

-   :DBPromptForBufferParameters - Connect to the database
-   <leader>se[ |l] - SQL execute ( )visual selection, (l)ine, 
-   <leader>s[t|T|w|a] - SQL select from (t)able, (T)op from table, from table (w)here, from <(a)sk table name>
-   <leader>sd[t|v|p] - SQL describe (t)able, (v)iew, (p)rocedure
-   <leader>sl[t|v|p|c] - SQL list (t)able, (v)iew, (p)rocedure, (c)olumn
-   <leader>sh - SQL history

Exuberant Ctags
---------------

-   Generate tags in root folder `<leader>tf`
-   Generate tags in git folder `<leader>tg`
-   Generate tags manually `ctags -R .`
-   Jump to a tag   `<c-]>` or back `<c-t>`
-   Code options    `<c-x><c-o>`
-   Code completion `<c-x><c-]>`


Python-mode
-----------

-   Lint toggle `PymodeLintToggle`
-   Rope toggle         `RopeToggle`
-   Run code            `<leader>r`
-   Breakpoint          `<leader>b`
-   Text object Method  `M`, and `[[, [M, ]M, ]]`
-   Text object Class   `C`, and `[[, [C, ]C, ]]`

Completion
----------

-   Previous match `<c-p>`
-   Next match `<c-n>`
-   Complete with tag           `<c-x><c-]>`
-   Complete with file          `<c-x><c-f>`
-   Complete with Omnicomplete  `<c-x><c-o>`
-   Complete with line          `<c-x><c-l>`


Sub modules
-----------

Upgrade

    git submodule foreach git pull origin master
    git submodule foreach git submodule init
    git submodule foreach git submodule update

Add

    cd ~/.vim
    git submodule init
    git submodule add git://github.com:/author/whatever.git bundle/whatever
    git commit -m 'Added submodule whatever'
    git push

Remove

    vim .git/config # remove the submodule x's lines
    vim .gitmodules # remove the submudule x's lines
    rm -rf .git/modules/bundle/x
    git rm --cached bundle/x
    rm -rf bundle/x
    git commit

[1]: http://www.vim.org/
[5]: https://github.com/vestrobaa/dotvimcore
[2]: https://chrome.google.com/webstore/detail/jmchmkecamhbiokiopfpnfgbidieafmd 
[3]: http://daringfireball.net/projects/markdown/ 
[4]: https://github.com/tpope
[6]: http://github.com
[20]: http://kien.github.io/ctrlp.vim/
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
[63]: http://github.com/tpope/vim-endwise
[64]: http://github.com/tpope/vim-cucumber
[70]: https://github.com/vim-scripts/dbext.vim
[80]: https://github.com/croaker/mustang-vim
[81]: https://github.com/Lokaltog/vim-distinguished
[82]: https://github.com/tpope/vim-surround.git
[83]: https://github.com/tpope/vim-capslock.git
[90]: http://ctags.sourceforge.net
[91]: http://pandoc.org/
[92]: http://cscope.sourceforge.net/cscope_vim_tutorial.html
[93]: http://opengrok.github.io/OpenGrok/
[100]: https://github.com/NLKNguyen/papercolor-theme.git
[101]: https://github.com/chriskempson/base16-vim.git
[102]: https://github.com/sjl/badwolf.git
[110]: https://github.com/junegunn/goyo.vim.git
[120]: https://github.com/kana/vim-metarw.git
[121]: https://github.com/mattn/vim-metarw-gdrive.git
[122]: https://github.com/kana/vim-metarw-git.git
[123]: https://github.com/tpope/vim-vinegar.git
