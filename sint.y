%{ 
#include "analex.c"
%}
%token NUM 
%token ID 
%token AND
%token OR 
%token EQ
%token LE
%token GE
%token NOT
%token CHAR
%token NE
%token IF
%token WHILE
%token ELSE
%token DO
%token READ
%token PRINTLN
%token PRINT
%token INT
%token VOID
%left AND OR
%left '>' '<' NE EQ GE LE
%left '+' '-'
%left '*' '/'
%start Prog
%%

       
	
Prog : Function Prog
	|
	;
	
	
Statement_Seq :
	Statement Statement_Seq
	|
	;
	
Args:
	  Args ',' Exp
	| Exp
	;

Statement: 
		Atribuicao
	|	If_Statement
	| 	While_Statement
	|   Do_While_Statement
	|   ID '(' Args ')' ';'
	;
	
	
Atribuicao : ID '=' Exp ';' 
	;

Compound_Statement :
	  Statement
	| '{' Statement_Seq '}'
	;
	
If_Statement:
	  IF '(' Exp ')' Compound_Statement Else_Part
	;
		
Else_Part:
	  ELSE Compound_Statement
	|
	;
		
While_Statement:
	  WHILE '(' Exp ')' Compound_Statement  
	;

Do_While_Statement:
	  DO Compound_Statement WHILE '(' Exp ')' ';'   
	;
	
Function:
	Tipof ID '(' Args2 ')' '{' Decls2 Statement_Seq '}' 
	;
	
Args2:
	Args2 ',' Decl
	| Decl
	|
	;

Decl : Tipo ID
	;
Decls2:
	Decl2 ';' Decls2
	|
	;
	
Decl2:
	Tipo Vars
	;
	
Vars: 
	Vars ',' ID 
	| ID
	;	
	
Tipo:
	INT
	| CHAR
	;

Tipof:
	INT
	| CHAR
	| VOID
	;
			
Exp : Exp '+' Exp  
	| Exp '-' Exp  
	| Exp '*' Exp  
	| Exp '/' Exp  
	| Exp '>' Exp  
	| Exp '<' Exp 
	| Exp GE Exp  
	| Exp LE Exp   
	| Exp EQ Exp   
	| Exp NE Exp   
	| Exp AND Exp  
	| Exp OR Exp   
	| '(' Exp ')'  
	| NUM		   
	| ID           
	;   
	
%%  
int main(int argc, char **argv) {     
  yyin = fopen(argv[1],"r");
  yyparse();      
} 


