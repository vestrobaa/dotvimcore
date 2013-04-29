Toggle word wrapping. (textwidth, nowrap)
    Set textwidth=78
    Set wrap
    Set nowrap
Autoformat: ggVG  =g


%s/.*TEXT="\([^"]*\)".*$/\1/g 
%s/^\(\s*\).*TEXT="\([^"]*\)".*$/\1- \2/g    "%s/ beginning of line, remember ( optional set of spaces ), skip chars until TEXT=", remember
                                             " ( not" chars ) chars till end of line  /  remember(1)- remember(2) / globally
v/^\s*-/d                "v/  beginning of line, optional set of spaces, - /delete
%s/&apos;/'/g
%s/&quot;/"/g

Switch to no file type. 
set ft=           " Set the file type to none
set tw=78         " Set the text width to 78
set wrap          " Set word wrap
normal gggqG      " format the whole file (gg to G), format with gq


g/^-/s/- //       " globally select lines with - at the beginning, then substitute -(space) with nothing

g/^\w/t.|s/./=/g  " globally select lines with a word character at the beginning, (t.) copy the line?!?!
                    then operate on the result: subsitute each character with a =
                    Do it for all occurences on the line.

%s/^\s\{4}//      " substitute four space characters at the beginning of the line with nothing

g/^\s*-/normal O  " search for all lines with spaces at the beginning followed by a -
                    Then run the normal command O (insert line above)


%s/^-/o           " replace - char at the beginning of the line with an o


%s/^\s\{8}\zs-/#/ " find 8 spaces at the beginning of the line, then from here (\zs) replace the - with a #
                    Also see \ze to start at end



