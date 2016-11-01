#ifndef GEN_H
#define GEN_H

#include <string>
#include <vector>

using namespace std;

typedef struct ArgumentNode {
    string name;
    string type;
} ArgumentNode;

typedef struct FunctionNode {
    string name;
    vector<ArgumentNode*> arguments;
} FunctionNode;

typedef struct StateContainer {
    vector<FunctionNode*> functions;
    vector<ArgumentNode*> arguments;
} StateContainer;

string genFunction(FunctionNode* n);
string genProgram(StateContainer* state);

#endif
