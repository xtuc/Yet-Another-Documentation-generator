%{
    #include <stdio.h>
    #include "gen/gen.h"
    #include "utils.cpp"

    #include <iostream>
    using namespace std;

    extern int yylex();
%}

%union {
    char *sval;
    StateContainer* state;
}

/* Types */
%token <sval> T_ALPHA

/* keyword */
%token T_FUNCTION
%token T_EXPORT
%token T_PUBLIC

/* Syntax */
%token T_COMMA
%token T_RPAREN
%token T_LPAREN
%token T_RBRACKET
%token T_LBRACKET

%type <sval> def_function_declaration
%type <state> def_function
%type <state> def_program
%type <state> def_function_argument

%%

def_program:
    def_function
    {
        cout << genProgram($1) << endl;
    }
    ;

def_function:
    def_function_declaration T_LPAREN def_function_argument T_RPAREN
    {
        StateContainer* state = new StateContainer;

        stateAdd(state, createFunction($1, $3->arguments));

        $$ = state;
    }
    | def_function_declaration T_LPAREN T_RPAREN
    {
        StateContainer* state = new StateContainer;

        stateAdd(state, createFunction($1));

        $$ = state;
    }
    ;

def_function_declaration:
    T_FUNCTION T_ALPHA { $$ = $2; }
    | T_EXPORT T_ALPHA  { $$ = $2; }

def_function_argument:
    T_ALPHA
    {
        StateContainer* state = new StateContainer;

        stateAdd(state, createArgument($1));

        $$ = state;
    }
    | T_ALPHA T_COMMA def_function_argument
    {
        StateContainer* state = $3;
        ArgumentNode* n = createArgument($1);

        state->arguments.push_back(n);

        $$ = state;
    }
    ;
%%
