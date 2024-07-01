
Instructions for running the toy compiler:
    1) flex cucu.l
    2) bison -d cucu.y
    3) gcc lex.yy.c cucu.tab.c -o compiler 
    4) ./compiler

After running these above 3 commands the following files will be generated in your current directory:
    i) lexer.txt
    ii) parser.txt
    iii) lex.yy.c 
    iv) cucu.tab.c
    v) cucu.tab.h

[cucu.l] 
    i) In this file all the tokenized numbers,variables,keywords,special characters will be situated
    ii) output will be written in the lexer.txt file 

[cucu.y]
    i) The BNF grammer rules will be situated in this file
    ii) output will be wriiten in the parser.txt file
    iii) if there is any errors then "Error" message will printed on the terminal

[sample1.cu, Sample2.cu]
    i) its a test files for our toy compiler
