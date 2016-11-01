#include "gen/gen.h"
#include <iostream>

using namespace std;

extern int yylineno;

void yyerror(const char *s)
{
    cerr << "\033[1;31m error: " << s << " at " << yylineno << "\033[0m\n" << endl;
}

void stateAdd(StateContainer* s, FunctionNode* n)
{
    s->functions.push_back(n);
}

void stateAdd(StateContainer* s, ArgumentNode* n)
{
    s->arguments.push_back(n);
}

/**
 * Function factories
 */
FunctionNode* createFunction(string name)
{
    FunctionNode* n = new FunctionNode;

    n->name = name;

    return n;
}

FunctionNode* createFunction(string name, vector<ArgumentNode*> arguments)
{
    FunctionNode* n = createFunction(name);
    n->arguments = arguments;

    return n;
}

/**
 * Argument factory
 */
ArgumentNode* createArgument(string name)
{
    ArgumentNode* n = new ArgumentNode;
    n->name = name;

    return n;
}
