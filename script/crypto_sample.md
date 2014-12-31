# Sudoku solver steps

1. Start with 9x9 matrix  
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
1. Fix the line endings if necessary `%s/^M/\r/g`. Remember CTRL-Q + CTRL-M

1. Get the distinct characters `!tr cd A-Z | sed 's/\(.\)/\1\n/g' | sort -u | tr -d '\n'`  
```
ACELNOPST
```

1. Swap letters with numbers `!tr ACELNOPST 1-9`  
```
9-6-----2  
-3-----8-  
--19--5-4  
---5186--  
---3-9---  
--8724---  
3-9--68--  
-1-----7-  
8-----2-9  
```

1. Change = to . for the specific solver we're using  
```
9.6.....2  
.3.....8.  
..19..5.4  
...5186..  
...3.9...  
..8724...  
3.9..68..  
.1.....7.  
8.....2.9  
```

1. Make one long string  
```
9.6.....2.3.....8...19..5.4...5186.....3.9.....8724...3.9..68...1.....7.8.....2.9
```

1. Now run it through a sudoku solver, for example:  
```
    http://attractivechaos.github.io/plb/kudoku.html  
    http://attractivechaos.github.io/plb/kudoku.html?q=<long string>  
    http://attractivechaos.github.io/plb/kudoku.html?q=9.6.....2.3.....8...19..5.4...5186.....3.9.....8724...3.9..68...1.....7.8.....2.9
```

1. Returns  
```
    986451732534672981721983564243518697157369428698724153379246815412895376865137249
```

1. Unpack to matrix `9li<cr>`  
```
986451732  
534672981  
721983564  
243518697  
157369428  
698724153  
379246815  
412895376  
865137249  
```

1. Swap numbers with letters `!tr 1-9 ACELNOPST`  
```
TSOLNAPEC  
NELOPCTSA  
PCATSENOL  
CLENASOTP  
ANPEOTLCS  
OTSPCLANE  
EPTCLOSAN  
LACSTNEPO  
SONAEPCLT  
```

1. Compare with original pattern  
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

1. Success!
