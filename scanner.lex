%{
/* Declaration Section */
#include <stdio.h>
void showToken(char *);
%}

%option yylineno
%option noyywrap
digit            ([0-9])
letter           ([a-zA-Z])
whitespace       ([\t\n ])

%%
{digit}+                    showToken("number");
{letter}+@{letter}+\.com    showToken("email address");
{whitespace}                showToken("whitespace");
.                           printf("Lex doesn't know what that is!\n");
%%

void showToken(char *name){
    printf("Lex found token %s ", name);
    printf("the lexeme is %s ",yytext);
    printf("its length is %d\n", yyleng);
}