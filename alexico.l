%{
 /*
ESCUELA POLITECNICA NACIONAL
COMPILADORES
INTEGRANTES:
-Aguirre Stalin
-Castillo Ana
-Vaca Steven
*/
#include "asintactico.tab.h"
int lineas=1;
char errorCont;

%}

%%

"//".* 

"/*"[^´]*"*/"|"/*".*"*/" { 
	int i;
	for(i = 0 ; yytext[i]!='\0' ; i ++ )
		if(yytext[i] == '\n') {
			lineas++;
		}
	};

int|float|bool|char|string {return TIPO_DE_DATO;}

if {return IF;}

then {return THEN;}

else {return ELSE;}

while {return WHILE;}

do {return DO;}

input|output|return {return STREAM;}

"#include"[ ]*"<"[a-z]+\.[a-z]+">" {return INCLUDE;}

true|false {return BOOL;}

[:] {return DOSPUNTOS;}

[;] {return PUNTOYCOMA;}

[,] {return COMA;}

[\!\&\$] {return CARACTER_ESPECIAL;}

\= {return IGUAL;}

[\+\-\*\/] {return OPERADOR;}

[\<\>]|"<="|">="|"=="|"!=" {return OPERADORR;}

"&&"|"||" {return OPERADORL;}

\[ {return CORCHETE_A;}

\] {return CORCHETE_C;}

\( {return PARENTESIS_A;}

\) {return PARENTESIS_C;}

\{ {return LLAVE_A;}

\} {return LLAVE_C;}

[0-9]+ {return ENTERO_POS;}

-[0-9]+ {return ENTERO;}

[0-9]+"."[0-9]+ {return FLOAT;}

_*[A-Za-z]+_*[A-Za-z0-9]* {return IDENTIFICADOR;}

\'.\' {return CHAR;}

\"[^"]+\" {return STRING;}

\n	{
		lineas++;
		return ('\n');
}

[\t ]

<<EOF>> {return END;}

. 	 {printf("%s: Error Lexico en la linea %d.\n",yytext,lineas);}

%%

