#include <iostream>

extern FILE* yyin;
extern int yydebug;
extern int yyparse();

using namespace std;

int main(int argc, char *argv[])
{
    if (argc < 2)
    {
        cerr << "Usage: <./a.out> <source file> \n" << endl;
        exit(0);
    }

    FILE *file = fopen(argv[1], "r");

    yyin = file;
    yydebug=0;

    int res = yyparse();

    return res;
}
