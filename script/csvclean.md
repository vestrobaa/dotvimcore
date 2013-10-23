## CSV cleanup commands

Run the following VIM commands to clean up an OTM exported CSV file

    %s/\s\+$//g
    :%le
    :4,$ v/^"/normal kA jkJ/g

Script strips off the trailing and then the leading white space. Then join the spanning lines, as follows:

#### Range

For all lines after the header lines (3)

#### Pattern

Lines not starting with a "

#### Action

1. 	Up (k)
1. 	Insert after end of line (A)
1. 	Space ( )
1. 	Exit insert mode (jk)
1. 	Join line (J)

#### Command

Note the g (globally) is not necessary in this case

###Macro version

nmap <leader>csv :%s/\s\+$//g<cr>:%le<cr>:4,$ v/^"/normal kA jkJ/g<cr>
