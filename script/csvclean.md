## CSV cleanup commands

Run the following VIM commands to clean up an OTM exported CSV file

    %s/\s\+$//g
    %le
    4,$ v/^"/normal kA jkJ/g

Script strips off the trailing and then the leading white space. Then join the spanning lines, as follows:

#### Range

For all lines after the three header lines

#### Pattern

Lines not starting with a "

#### Action

- Up (k)
- Insert after end of line (A)
- Space ( )
- Exit insert mode (jk)
- Join line (J)

#### Command

(g)lobally

### Macro version

nmap <leader>csv :%s/\s\+$//g<cr>:%le<cr>:4,$ v/^"/normal kA jkJ/g<cr>


### Drop the last 4 columns

Drop the last 4 columns if they contain audit info

    g/.*,.*,.*,.*,/normal A jk4F,d$jk0


