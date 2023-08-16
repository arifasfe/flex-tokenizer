%option noyywrap

%{
#include <stdio.h>
#include <string.h>
%}

%%
[ \t\n]  ; // skip whitespace
"if"\( { printf("Keyword: %.*s\n", (int)strlen(yytext)-1, yytext); }
"else"|"then"|"also"|"int"|"char"|"float"|"double"|"void"|"return"|"function" { printf("Keyword: %s\n", yytext); }


[><=]=?    { printf("Relational Operators : %s\n", yytext); }

[+\-*/]  { printf("Arithmetic Operators : %s\n", yytext); }
"++"    { printf("Arithmetic Operators : %s\n", yytext); }
"--"    { printf("Arithmetic Operators : %s\n", yytext); }

[+\-*/]?=    { printf("Assignment Operators : %s\n", yytext); }

[&|]{2}    { printf("Logical Operators : %s\n", yytext); }
"!"     { printf("Logical Operators : %s\n", yytext); }

\".*?\"   { printf("String: %s\n", yytext); }

[0-9]+(\.[0-9]+)? { printf("Valid Numbers : %s\n", yytext); }
[a-zA-Z_][a-zA-Z_0-9]* { printf("Valid Identifiers : %s\n", yytext); }
[a-zA-Z_][a-zA-Z_0-9]*\( { printf("Function Name : %s)\n", yytext); }


[{}[\],;().] { printf("Other Symbols : %s\n", yytext); }

%%

int main() {
    freopen("input.c", "r", stdin);
    yylex();
    return 0;
}
