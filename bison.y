%{
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
//Extern from Flex
extern FILE *yyin;
extern int yylex();
extern int yylineno;
extern char *yytext;
void yyerror(const char *message);
int MAX_ERRORS=5;
int error_count=0;
int flag_err_type=0;
int scope=0;
%}
//TOKENS
%define parse.error verbose
7
%
t
o
k
e
n
T
_
P
R
O
G
"
P
R
O
G
R
A
M
"
%
t
o
k
e
n
T
_
S
M
A
I
N
"
S
T
A
R
T
M
A
I
N
"
%
t
o
k
e
n
T
_
E
M
A
I
N
"
E
N
D
M
A
I
N
"
%
t
o
k
e
n
T
_
V
A
R
S
"
V
A
R
S
"
%
t
o
k
e
n
T
_
C
H
A
R
"
C
H
A
R
"
%
t
o
k
e
n
T
_
I
N
T
E
G
E
R
"
I
N
T
E
G
E
R
"
%
t
o
k
e
n
T
_
S
T
R
U
C
T
"
S
T
R
U
C
T
"
%
t
o
k
e
n
T
_
E
N
D
S
T
R
U
C
T
"
E
N
D
S
T
R
U
C
T
"
%
t
o
k
e
n
T
_
F
U
N
C
T
"
F
U
N
C
T
I
O
N
"
%
t
o
k
e
n
T
_
E
N
D
F
U
N
C
"
E
N
D
_
F
U
N
C
T
I
O
N
"
%
t
o
k
e
n
T
_
T
Y
P
E
D
E
F
"
T
Y
P
E
D
E
F
"
%
t
o
k
e
n
T
_
P
R
I
N
T
"
P
R
I
N
T
"
%
t
o
k
e
n
T
_
I
F
"
I
F
"
%
t
o
k
e
n
T
_
E
N
D
I
F
"
E
N
D
I
F
"
%
t
o
k
e
n
T
_
W
H
I
L
E
"
W
H
I
L
E
"
%
t
o
k
e
n
T
_
E
N
D
W
H
I
L
E
"
E
N
D
W
H
I
L
E
"
%
t
o
k
e
n
T
_
E
L
S
E
"
E
L
S
E
"
%
t
o
k
e
n
T
_
E
L
S
E
I
F
"
E
L
S
E
I
F
"
%
t
o
k
e
n
T
_
F
O
R
"
F
O
R
"
%
t
o
k
e
n
T
_
I
N
"
I
N
"
%
t
o
k
e
n
T
_
T
O
"
T
O
"
%
t
o
k
e
n
T
_
S
T
E
P
"
S
T
E
P
"
%
t
o
k
e
n
T
_
E
N
D
F
O
R
"
E
N
D
F
O
R
"
%
t
o
k
e
n
T
_
R
E
T
U
R
N
"
R
E
T
U
R
N
"
%
t
o
k
e
n
T
_
S
W
I
T
C
H
"
S
W
I
T
C
H
"
%
t
o
k
e
n
T
_
C
A
S
E
"
C
A
S
E
"
%
t
o
k
e
n
T
_
D
E
F
"
D
E
F
A
U
L
T
"
%
t
o
k
e
n
T
_
E
S
W
I
T
C
H
"
E
N
D
S
W
I
T
C
H
"
%
t
o
k
e
n
T
_
B
R
E
A
K
"
B
R
E
A
K
"
%
t
o
k
e
n
T
_
T
H
E
N
"
T
H
E
N
"
%
t
o
k
e
n
T
_
A
N
D
"
A
N
D
"
%
t
o
k
e
n
T
_
O
R
"
O
R
"
%
t
o
k
e
n
T
_
O
R
O
P
"||"
%
t
o
k
e
n
T
_
A
N
D
O
P
"
&
&
"
%
t
o
k
e
n
T
_
E
Q
U
A
L
"
=
=
"
%
t
o
k
e
n
T
_
P
L
U
S
"
+
"
%
t
o
k
e
n
T
_
M
I
N
U
S
"
-
"
%
t
o
k
e
n
T
_
M
U
L
T
I
P
L
Y
"
*
"
%
t
o
k
e
n
T
_
D
I
V
I
D
E
"
/
"
%
t
o
k
e
n
T
_
P
O
W
E
R
"
^
"
%
t
o
k
e
n
T
_
N
O
T
"!"
%
t
o
k
e
n
T
_
L
E
P
A
R
E
N
T
H
"
(
"
%
t
o
k
e
n
T
_
R
I
P
A
R
E
N
T
H
"
)
"
%
t
o
k
e
n
T
_
S
E
M
I
C
O
L
"
;
"
%
t
o
k
e
n
T
_
D
O
T
"
.
"
%
t
o
k
e
n
T
_
C
O
M
M
A
"
,
"
%
t
o
k
e
n
T
_
A
S
S
I
G
N
"
=
"
8
%token T_METH "::"
%token T_COL ":"
%token T_LEBRACKET "["
%token T_RIBRACKET "]"
%token T_REFER "&"
%token T_LEBRACE "{"
%token T_RIBRACE "}"
%token T_INP ">>"
%token T_OUT "<<"
%token T_GREATER ">"
%token T_SMALLER "<"
%token T_NOTEQUAL "!="
%token T_NEWLINE "NEWLINE"
%token T_ID "ID"
%token T_PERCENT "%"
%token T_TONE "'"
%token T_NUMBER "NUMBER"
%token T_TAB "TAB"
%token T_EOF 0 "End Of File"
%%
program: T_PROG T_ID newline varexp struct function
main T_EOF
;
newline: T_NEWLINE
|T_NEWLINE newline
;
struct: struct_type struct newline
|%empty
;
struct_type: T_STRUCT T_ID newline varexp T_ID T_ENDSTRUCT
|T_TYPEDEF T_STRUCT T_ID newline varexp T_ID
T_ENDSTRUCT
;
function: T_FUNCT T_ID T_LEPARENTH var T_RIPARENTH
newline varexp functionbody return T_ENDFUNC newline
|function function
|%empty
;
varexp: T_VARS vartype var T_SEMICOL newline
|varexp varexp
|%empty
;
vartype: T_CHAR
|T_INTEGER
9
;
var: T_ID
|T_ID T_COMMA var
|%empty
;
functionbody: command
|functionbody command
|%empty
;
command: assignment newline
|loop newline
|check newline
|print newline
|break newline
;
assignment: T_ID T_ASSIGN expression
|T_ID T_ASSIGN expression T_SEMICOL
;
expression: literal
|T_ID T_LEPARENTH var T_RIPARENTH
|T_ID T_LEBRACKET T_NUMBER T_RIBRACKET
|operation
;
operation: literal noperator literal
|operation noperator operation
|operation noperator literal
|literal noperator operation
|T_LEPARENTH operation T_RIPARENTH
;
literal: T_NUMBER
|T_ID
;
noperator: T_PLUS
|T_MINUS
|T_POWER
|T_MULTIPLY
|T_DIVIDE
|T_ASSIGN
|T_PERCENT
;
loop: forloop
|whileloop
;
forloop: T_FOR T_ID T_ASSIGN T_NUMBER T_TO T_NUMBER
T_STEP T_NUMBER newline functionbody T_ENDFOR
;
whileloop: T_WHILE T_LEPARENTH condition T_RIPARENTH
newline functionbody T_ENDWHILE
10
;
condition: literal operators literal
;
operators: loperator
|coperator
;
loperator: T_GREATER
|T_SMALLER
|T_EQUAL
|T_NOTEQUAL
;
coperator: T_AND
|T_OR
;
check: checkif
|checkcase
;
checkif: T_IF T_LEPARENTH condition T_RIPARENTH
T_THEN newline functionbody T_ENDIF
|T_IF T_LEPARENTH condition T_RIPARENTH
T_THEN newline functionbody T_ELSE newline functionbody T_ENDIF
|T_IF T_LEPARENTH condition T_RIPARENTH
T_THEN newline functionbody elseif T_ELSE newline functionbody T_ENDIF
;
elseif: T_ELSEIF newline functionbody
|elseif elseif
;
checkcase: T_SWITCH T_LEPARENTH expression T_RIPARENTH
newline case default T_ESWITCH
;
case: T_CASE T_LEPARENTH expression T_RIPARENTH
T_COL newline functionbody
|case case
;
default: T_DEF T_COL newline functionbody
|%empty
;
print: T_PRINT T_LEPARENTH T_TONE message T_TONE
T_COMMA T_LEBRACKET var T_RIBRACKET T_RIPARENTH T_SEMICOL
|T_PRINT T_LEPARENTH T_TONE message T_TONE
T_RIPARENTH T_SEMICOL
;
message: literal
|literal message
|%empty
;
break: T_BREAK T_SEMICOL
;
11
return: T_RETURN literal T_SEMICOL newline
;
main: T_SMAIN newline varexp functionbody T_EMAIN
;
%%
int main(int argc, char* argv[]){
int token;
if(argc>1){
yyin=fopen(argv[1], "r");
if(yyin==NULL)
{
perror("Error opening file");
return -1;
}
}
yyparse();
fclose(yyin);
return 0;
}
void yyerror(const char *message)
{
error_count++;
if(flag_err_type==0){
printf("-> ERROR at line %d caused by %s : %s\n", yylineno, yytext,
message);
}else if(flag_err_type==1){
printf("-> ERROR at line %d %s\n", yylineno, message);
}
flag_err_type = 0;
if(MAX_ERRORS <= 0) return;
if(error_count == MAX_ERRORS){
printf("Max errors (%d) detected.\n", MAX_ERRORS);
exit(-1);
}
}
