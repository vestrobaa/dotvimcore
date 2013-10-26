# Mind map XML to plain text

See Derek Wyatt's [Globals, Command Line and Functions ][1]

Start with a mind map xml document like


    <map version="0.9.0">
    <!-- To view this file, download free mind mapping software FreeMind from http://freemind.sourceforge.net -->
    <node CREATED="1382744410035" ID="ID_1800611232" MODIFIED="1382744751890" TEXT="Diablo 3">
    <node CREATED="1382744766041" ID="ID_804494775" MODIFIED="1382744805667" POSITION="right" TEXT="by Blizzard. See blizzard.com"/>
    <node CREATED="1382744447747" ID="ID_1777566961" MODIFIED="1382744801586" POSITION="right" TEXT="Guides">
    <node CREATED="1382744511678" ID="ID_883683852" MODIFIED="1382744522196" TEXT="New player"/>
    <node CREATED="1382744524401" ID="ID_512929338" MODIFIED="1382744531501" TEXT="Efficient farming"/>
    <node CREATED="1382744649493" ID="ID_1832613477" MODIFIED="1382744653558" TEXT="Hardcore"/>
    </node>
    <node CREATED="1382744556598" ID="ID_1990130143" MODIFIED="1382744561403" POSITION="right" TEXT="Classes">
    <node CREATED="1382744563195" ID="ID_1340067678" MODIFIED="1382744567111" TEXT="Barbarian">
    <node CREATED="1382744720053" ID="ID_1126146710" MODIFIED="1382744723733" TEXT="Info">
    <node CREATED="1382744737119" ID="ID_994958834" MODIFIED="1382744741873" TEXT="Barbarians are savage wanderers who never flinch from close-quarters combat. Mighty ground stomps, leaping attacks and dual-wielded slashes leave a barbarian&#x2019;s enemies dead in their boots and send any survivors fleeing for cover.  Thanks to their size and strength, barbarians can dominate a melee with nearly any combination of weapon and approach, though they tend towards massive and imposing weaponry. Barbarians are no strangers to the pains of battle, and often fare better in the midst of several opponents, taking and giving cuts, than when attempting to chase down single targets.  Barbarians&#x2019; attacks are primarily melee focused. Their quick weapon swings whittle down the number of weaker foes in seconds, while their slower, ground-shaking slams and stomps can send approaching hordes reeling and crack the armor of mightier foes. "/>
    </node>
    <node CREATED="1382744727636" ID="ID_729200517" MODIFIED="1382744729639" TEXT="Skills">
    <node CREATED="1382744840653" ID="ID_1680688144" MODIFIED="1382744844794" TEXT="Bash Primary  Generate: 8 Fury per attack  Brutally smash an enemy for 165% weapon damage with a 20% chance to Knockback."/>
    </node>
    <node CREATED="1382744730538" ID="ID_96551036" MODIFIED="1382744732603" TEXT="Strategy"/>
    </node>
    <node CREATED="1382744568294" ID="ID_809229996" MODIFIED="1382744569713" TEXT="Monk">
    <node CREATED="1382744852707" ID="ID_492798462" MODIFIED="1382744856433" TEXT="Skills"/>
    <node CREATED="1382744857382" ID="ID_1492164970" MODIFIED="1382744859316" TEXT="Info"/>
    <node CREATED="1382744859855" ID="ID_1712265971" MODIFIED="1382744863214" TEXT="Strategy"/>
    </node>
    <node CREATED="1382744570660" ID="ID_1253811520" MODIFIED="1382744573233" TEXT="Wizard"/>
    <node CREATED="1382744574359" ID="ID_1299640229" MODIFIED="1382744578404" TEXT="Demon Hunter"/>
    <node CREATED="1382744579070" ID="ID_357536731" MODIFIED="1382744596538" TEXT="Witch Doctor">
    <node CREATED="1382744872798" ID="ID_1009687086" MODIFIED="1382744874690" TEXT="Info"/>
    <node CREATED="1382744875608" ID="ID_968926513" MODIFIED="1382744877071" TEXT="Skills"/>
    <node CREATED="1382744877473" ID="ID_1476918119" MODIFIED="1382744879723" TEXT="Strategy"/>
    <node CREATED="1382744880146" ID="ID_1366557267" MODIFIED="1382744881266" TEXT="Pets"/>
    </node>
    </node>
    <node CREATED="1382744484259" ID="ID_1411950393" MODIFIED="1382744488508" POSITION="right" TEXT="Gameplay">
    <node CREATED="1382744536701" ID="ID_1075308915" MODIFIED="1382744549856" TEXT="Solo ">
    <node CREATED="1382744889323" ID="ID_1038263595" MODIFIED="1382744893509" TEXT="For noobs"/>
    </node>
    <node CREATED="1382744550798" ID="ID_1409439532" MODIFIED="1382744553150" TEXT="Groups">
    <node CREATED="1382744897744" ID="ID_842180238" MODIFIED="1382744902865" TEXT="For the rest"/>
    </node>
    </node>
    </node>
    </map>

## Pretty print the xml to get the indent formatting

Toggle word wrapping. (textwidth, nowrap)

    set textwidth=78
    set wrap
    set nowrap
    ggVG=g " Autoformat the file

## Keep the indenting, and the values of the <TEXT> nodes

Substitute a line with the leading spaces and the text between quotes

    %s/^\(\s*\).*TEXT="\([^"]*\)".*$/\1- \2/g

Delete all lines that does not begin with optional whitespace and a dash

    v/^\s*-/d

Tidy up the XML escape sequences

    %s/&apos;/'/g
    %s/&quot;/"/g
    %s/&#x2019;/'/g

#### Wrap the text paragraphs

Switch to no file type. 

    set ft=           " Set the file type to none
    set tw=78         " Set the text width to 78
    normal gggqG      " format the whole file (gg to G), format with gq

#### Strip the dash (-) from the header nodes

For all lines that start with a dash, then remove the dash and space after it.
Note that the command is a nested substitute

    g/^-/s/- //

#### Underline the header node

For all lines that start with a word character, duplicate the line with dots. Replace the dots with the underline character (=)

    g/^\w/t.|s/./=/g

#### Undindent one level

Delete four spaces at the start of a line

    %s/^\s\{4}//

#### Vertically space the bullets

For all lines with a dash as first non white space, insert a line above

    g/^\s*-/normal O

Change the dash at the start of a line with an o

    %s/^-/o

Find eight spaces at the start of a line. Then start from here (\zs) and substitute dashes with hashes
Note: See \zs and ze to start at end

    %s/^\s\{8}\zs-/#/


## Generate a script from the previous commands

Create a script file

    e ~/.vim/script/<name>.vim

#### Paste the commands

Pull the commands from the history into the buffer

    history : -20,

Redirect the history to register a

    redir @a>
    history : -20,
    redir END

Paste register a

    "ap

Now clean up the commands to be sourcable. See freemindtotext.vim

## Use the FreemindToText Command

1. Open a freemind xml document.
1. Source freemindtotext.vim
1. set ft=xml
1. indent the xml: gg=G
1. FreemindToText
1. Output should now be in the bulleted text format


[1]: http://vimeo.com/15443936



Notes:

Replicate, but change to markdown instead of text

