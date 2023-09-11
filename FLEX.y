%{
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include "bison.tab.h"
int lineno = 1; /* that means that we start to count lines from 1*/
%}
/* reads only one file*/
%option noyywrap
/* shows the current inout line*/
%option yylineno
%x C_COMMENT
CHARACTER [a-zA-Z]
DIGIT [0-9]
NUMBER [0-9][0-9]*
ID [a-z][a-z0-9]*
NEWLINE \n
TAB \t
/* -----TRANSLATION RULES ---- */
%%
"PROGRAM" {printf("Start the program \n"); return T_PROG;}
"STARTMAIN" {printf("Start of main \n"); return T_SMAIN;}
"CHAR" {printf("Character \n"); return T_CHAR;}
"INTEGER" {printf("Integer \n");return T_INTEGER;}
"VARS" {printf("Vars \n"); return T_VARS;}
"PRINT" {printf("Print \n"); return T_PRINT;}
"STRUCT" {printf("This is a struct \n"); return T_STRUCT;}
"ENDSTRUCT" {printf("End of struct \n"); return T_ENDSTRUCT;}
"FUNCTION" {printf("Start of function \n"); return T_FUNCT;}
"END_FUNCTION" {printf("The end of function \n"); return T_ENDFUNC;}
"TYPEDEF" {printf("Typedef \n"); return T_TYPEDEF;}
"BREAK" {printf("Break \n"); return T_BREAK;}
"RETURN" {printf("Returning... \n"); return T_RETURN;}
"IF" {printf("If \n"); return T_IF;}
5
"THEN" {printf("Then \n"); return T_THEN;}
"ELSE" {printf("Else \n"); return T_ELSE;}
"ELSEIF" {printf("Else If \n"); return T_ELSEIF;}
"ENDIF" {printf("End of if \n"); return T_ENDIF;}
"WHILE" {printf("while \n"); return T_WHILE;}
"ENDWHILE" {printf("End of while \n"); return T_ENDWHILE;}
"FOR" {printf("For \n"); return T_FOR;}
"TO" {printf("To \n"); return T_TO;}
"STEP" {printf("Step \n"); return T_STEP;}
"ENDFOR" {printf("End of for \n"); return T_ENDFOR;}
"CASE" {printf("Case \n"); return T_CASE;}
"SWITCH" {printf("Switch \n"); return T_SWITCH;}
"DEFAULT" {printf("Default \n"); return T_DEF;}
"ENDSWITCH" {printf("End of switch \n"); return T_ESWITCH;}
"ENDMAIN" {printf("End of main \n"); return T_EMAIN;}
{NUMBER} {printf("Number \n"); return T_NUMBER;}
{NEWLINE} {printf("New Line \n"); return T_NEWLINE;}
{ID} {printf("ID \n"); return T_ID;}
{TAB} {printf("TAB"); return T_TAB;}
"||" {printf("Or \n"); return T_OROP;}
"&&" {printf("And \n"); return T_ANDOP;}
"==" {printf("Equal \n"); return T_EQUAL;}
"+" {printf("Plus \n"); return T_PLUS;}
"-" {printf("Minus \n"); return T_MINUS;}
"*" {printf("Multiply \n"); return T_MULTIPLY;}
"!" {printf("Exclamation \n"); return T_NOT;}
"(" {printf("Left Parenth \n"); return T_LEPARENTH;}
")" {printf("Right Parenth \n"); return T_RIPARENTH;}
";" {printf("Semicolon \n"); return T_SEMICOL;}
"." {printf("Dot"); return T_DOT;}
"," {printf("Comma \n"); return T_COMMA;}
"=" {printf("Assign \n"); return T_ASSIGN;}
"!=" {printf("Not equal \n"); return T_NOTEQUAL;}
"/" {printf("Divide \n"); return T_DIVIDE;}
"^" {printf("Power \n"); return T_POWER;}
"::" {printf("Meth \n"); return T_METH;}
":" {printf("Column \n"); return T_COL;}
"[" {printf("Left Bracket \n"); return T_LEBRACKET;}
"]" {printf("Right Bracket \n"); return T_RIBRACKET;}
"&" {printf("Refer \n"); return T_REFER;}
"{" {printf("Left Brace \n"); return T_LEBRACE;}
"}" {printf("Right Brace \n"); return T_RIBRACE;}
">>" {printf("inp \n"); return T_INP;}
"<<" {printf("out \n"); return T_OUT;}
"'" {printf("Tone \n"); return T_TONE;}
"%" {printf("Percent \n"); return T_PERCENT;}
6
">" {printf("Greater \n"); return T_GREATER;}
"<" {printf("Smaller \n"); return T_SMALLER;}
%Comments
"/*" {printf("Comment \n"); BEGIN(C_COMMENT); }
<C_COMMENT>"*/" {printf("End comment \n"); BEGIN(INITIAL); }
<C_COMMENT>. { }
<C_COMMENT>\n {printf("New line in comments\n"); return T_NEWLINE; }
<<EOF>> {printf("!Translation Complete!\n"); return T_EOF;}
. { }
%%
