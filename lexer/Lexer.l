ALPHA      ([[:alpha:]_]+)
WHITESPACE      [ \t]+
NEW_LINE        \n
ANYTHING        .

%option noyywrap

%{
    #include <iostream>
    using namespace std;

    #include "./gen/gen.h"
    #include "y.tab.h"

    extern void yyerror(const char*);
%}

%x COMMENT
%x FUNCTION_CONTENT

%%

{NEW_LINE}                   yylineno++;

public                       return T_PUBLIC;
export                       return T_EXPORT;
function                     return T_FUNCTION;
","                          return T_COMMA;
"("                          return T_LPAREN;
")"                          return T_RPAREN;
"}"                          return T_RBRACKET;

"{"                          BEGIN(FUNCTION_CONTENT);
<FUNCTION_CONTENT>"}"        BEGIN(INITIAL);
<FUNCTION_CONTENT>.*         { /* Ignore */ }

"/*"                         BEGIN(COMMENT);
<COMMENT>"*/"                BEGIN(INITIAL);
<COMMENT>.                   { /* Ignore */ }

{ALPHA}                      {
    yylval.sval = strdup(yytext);
    return T_ALPHA;
}
{WHITESPACE}                 { /* Ignore */ }

{ANYTHING}                   {
    yyerror(yytext);
    exit(1);
}

%%
