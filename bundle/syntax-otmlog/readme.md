# vim-otmlog 

## View OTM log files in Vim

Vim-otmlog is a [Vim](http://www.vim.org/) plugin that handles basic filetype settings for [Oracle Transportation Management (OTM)](http://www.oracle.com/us/products/applications/ebusiness/logistics/018756.htm) log files.

OTM log files will automatically be detected, and set to the appropriate syntax coloring and configuration

## Installation

I recommend using [pathogen.vim](https://github.com/tpope/vim-pathogen) for installation, and [Git](http://git-scm.com/) for version control

    cd ~/.vim
    git submodule add git://github.com/vestrobaa/vim-otmlog.git bundle/syntax-otmlog

If you are not using Git, rather use:

    cd ~/.vim/bundle
    git clone git://github.com/vestrobaa/vim-otmlog.git


## FAQ

> Do I need to rename the OTM log file extension for the plugin to work?

Nope, vim-otmlog looks at the standard OTM log file extension (text), and check if the content is in OTM log file format


## TODO

1. Add some screencasts

## Other Vim plugins that works well with OTM

1. Use a CSV plugin for OTM CSV Export / Load. I'm using [csv.vim](https://github.com/vim-scripts/csv.vim)


## License

- vim-otmlog is distributed under the same terms as Vim itself. See `:help license`
- Oracle Transportation Management is copyrighted by [Oracle](http://www.oracle.com/)

