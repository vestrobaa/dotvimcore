# Crypto Instructions

From [Grok Vim](http://stackoverflow.com/questions/1218390/what-is-your-most-productive-shortcut-with-vim)

I am a member of the American Cryptogram Association. The bimonthly magazine includes over 100 cryptograms of various sorts. Roughly 15 of these are "cryptarithms" - various types of arithmetic problems with letters substituted for the digits. Two or three of these are sudokus, except with letters instead of numbers. When the grid is completed, the nine distinct letters will spell out a word or words, on some line, diagonal, spiral, etc., somewhere in the grid.

Rather than working with pencil, or typing the problems in by hand, I download the problems from the members area of their website.

When working with these sudokus, I use vi, simply because I'm using facilities that vi has that few other editors have. Mostly in converting the lettered grid into a numbered grid, because I find it easier to solve, and then the completed numbered grid back into the lettered grid to find the solution word or words.

The problem is formatted as nine groups of nine letters, with -s representing the blanks, written in two lines. The first step is to format these into nine lines of nine characters each. There's nothing special about this, just inserting eight linebreaks in the appropriate places.

The result will look like this:

```
T-O-----C  
-E-----S-  
--AT--N-L  
---NASO--  
---E-T---  
--SPCL---  
E-T--OS--  
-A-----P-  
S-----C-T  
```

So, first step in converting this into numbers is to make a list of the distinct letters. First, I make a copy of the block. I position the cursor at the top of the block, then type :y}}p. : puts me in command mode, y yanks the next movement command. Since } is a move to the end of the next paragraph, y} yanks the paragraph. } then moves the cursor to the end of the paragraph, and p pastes what we had yanked just after the cursor. So y}}p creates a copy of the next paragraph, and ends up with the cursor between the two copies.

Next, I to turn one of those copies into a list of distinct letters. That command is a bit more complex:

:!}tr -cd A-Z | sed 's/\(.\)/\1\n/g' | sort -u | tr -d '\n'
: again puts me in command mode. ! indicates that the content of the next yank should be piped through a command line. } yanks the next paragraph, and the command line then uses the tr command to strip out everything except for upper-case letters, the sed command to print each letter on a single line, and the sort command to sort those lines, removing duplicates, and then tr strips out the newlines, leaving the nine distinct letters in a single line, replacing the nine lines that had made up the paragraph originally. In this case, the letters are: ACELNOPST.

Next step is to make another copy of the grid. And then to use the letters I've just identified to replace each of those letters with a digit from 1 to 9. That's simple: :!}tr ACELNOPST 0-9. The result is:

```
8-5-----1  
-2-----7-  
--08--4-3  
---4075--  
---2-8---  
--7613---  
2-8--57--  
-0-----6-  
7-----1-8  
```

This can then be solved in the usual way, or entered into any sudoku solver you might prefer. The completed solution can then be converted back into letters with :!}tr 1-9 ACELNOPST.

There is power in vi that is matched by very few others. The biggest problem is that only a very few of the vi tutorial books, websites, help-files, etc., do more than barely touch the surface of what is possible.
