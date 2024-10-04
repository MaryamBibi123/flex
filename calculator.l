%{
#include <stdio.h>
#include <stdlib.h>

void yyerror(const char *s);
int yylex(void);
%}

%option noyywrap

%%

// Define patterns for tokens
[0-9]+      { yylval = atoi(yytext); return NUMBER; }
"+"        { return PLUS; }
"-"        { return MINUS; }
"*"        { return MULTIPLY; }
"/"        { return DIVIDE; }
\n         { /* Ignore newlines */ }
[ \t]      { /* Ignore whitespace */ }
.          { printf("Unexpected character: %s\n", yytext); }

%%

// Error handling function
void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
}

// Main function
int main(void) {
    printf("Enter an expression:\n");
    while (yylex()) {
        // Do nothing; yylex handles the input
    }
    return 0;
}
