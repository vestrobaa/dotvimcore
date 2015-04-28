# CSV bulk load and custom configuration OTM load

## General

- Use VIM's CSV syntax https://github.com/vim-scripts/csv.vim.git
- Show lines start with `/^` 

### Format HTML export to CSV

Note: Use argdo instead of bufdo

Find -- in comments `/--` 
Delete header html info `:bufdo normal ggndgg` 
Delete footer html info `:bufdo normal GNdG` 
Delete "select * from" `:bufdo normal ggd3w` 
Delete SQL after table name `:bufdo normal gg0eld$` 
Make the table name CAPS `:bufdo normal gg0V$gU` 
Save all `:wa` 

### Fix CSV layout

Drop ^M characters `:bufdo %s/<Ctrl-V><Ctrl-M>//ge` 
Fix spanning lines `:bufdo normal ,csj` 
Drop the auditing columns `:bufdo normal ,cs4` 
Fix the terminator on the last line `:bufdo normal Gofqdd` 
Go to top of each file `:argdo normal gg` 
• Start Vim with all the CSV files loaded

### Fix XML in CSV Layout

Drop "" at the start of the line. Different for each table, see tables below
Drop "" at the end of the line. Different for each table, see tables below
Replace the " `:set list!` and `:bufdo %s/"/$/g` 
Change the leading and trailing " back `:bufdo normal G0f$r"$F$r"` 

### Alternative way to fix CSV Layout

Delete the XML column, put the XML in register x `0f<T,v$F>t,"xd` 
Remove the " characters `:s/"//g` 
Add the XML column back, with XML from register x `$F,"xP0` 

## Identify replacement text

Verify two " per line `:lvimgrep /\"/g *.csv` 
Check domain specific data `:lvimgrep /trd403/g *.csv` 
Check URL `:lvimgrep /http/g *.csv` 

## Manager Layout Processing

Number of leading "" to drop 5 `:bufdo normal G0f"ds"` 
Number of trailing "" to drop 10 `:bufdo normal G$bds"bbds"bbds"bbds"bbds"bbds"bbds"bbds"bbbbds"` 
Macro a `qa 0t"ds"` 
Delete 5 "" sets  `5@a` 
Plan B  Delete all the " before ,"<?xml
  `:bufdo normal 0vt<hT" :'<,'> s/"//g` 
  
Take care, not all files have the same amount of leading "" pairs

## Finder Set Processing

Number of leading "" to drop 4 `:bufdo normal G0f"ds"` 
Number of trailing "" to drop 1 `:bufdo normal G$bds"` 

User Menu Layout Processing
Number of leading "" to drop 2 `:bufdo normal G0f"ds"` 
Number of trailing "" to drop 1 `:bufdo normal G$bds"` 

## Clear data as necessary, example 

Domain replacement `% s/trd403/prd500/g` `:% s/DOW\/POC/DOW\/NRD103/g` 
External systems URLs 
    `:% s/service=OTM_BSRV/service=OTM_NEA_D/g` 
    `:% s/service=OTM_POC/service=OTM_NEA_D/g` 
Prod URL replacement `% s/http\:\/\/preview-otm\.jvservices\.com\:15732/https\:\/\/otm\.dow\.com/g` 

## Log files

Filter Agent lines `v/agent\s\+/d` 

## Nice to haves

- Syntax highlighting `git clone https://github.com/vestrobaa/syntax-otmlog.git` 
- Folding `:set foldmethod=indent` 
- Tags
- Text Objects for Agents and Processes
  
## XML result files

Check counts 
 `:g/count>` 
 `:v/count>\|<datafilename/d` 
 `:g/count>0</d` 

Need better color scheme for the summary
- Red for error counts
- Green for all records processed
- Orange for skipped

 ## Compare two SQL queries

- Copy the first SQL statement, paste in new buffer `:n t1.sql` 
- Copy the second SQL statement, paste in new vertical `:vsplit t2.sql` 

Scrub the queries 

- Remove whitespace `:% s/\s*$//ge` 
- Normalize `:% s/ /\r/ge` 
Compare `:diffthis` for each

## General

Highlight SQL parameters /`:\w*[^\s()\]]` 
