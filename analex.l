%{
#include <stdio.h>
#include "sint.h"
#include "tabsimb.h"
int line=1;
int yyerror(char *s) {
  fprintf(stderr, "%s na linha %d\n",s,line);
}
%}
%%
"if"  { return IF; }
"else" { return ELSE;}
"while" { return WHILE;}
"do"  { return DO;}
"int" { return INT;}
"char" { return CHAR;}
">="  { return GE;}
"<="  { return LE;}
"=="  { return EQ;}
"!="  { return NE;}
"!"   { return NOT;}
">"   { return '>';}
"<"   { return '<';}
"="   { return '='; }
"+"   { return '+'; }
"-"   { return '-'; }
"*"   { return '*'; }
"/"   { return '/'; }
";"   { return ';'; }
"("   { return '('; }
")"   { return ')'; }
"{"   { return '{'; }
"}"   { return '}'; }
","   { return ','; }
"print" {return PRINT;}
"println" {return PRINTLN;}
"read" {return READ;}
"and" {return AND;}
"or" {return OR;}


[0-9]+("."[0-9]+)?   { return NUM; }
[a-zA-Z][a-zA-Z0-9]*   { insere(yytext); return ID; }
\        { ; }
\n       { line++; }
\t       { ; }
"//".*\n { }
.        { yyerror("illegal token"); }
%%
#ifndef yywrap
int yywrap() { return 1; }
#endif

