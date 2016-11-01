#include "gen.h"

#include <fstream>
#include <iostream>
#include <streambuf>
#include <mstch/mstch.hpp>

using namespace std;

string getTemplate(string name)
{
    std::ifstream ifs("./gen/markdown/" + name + ".mustache");
    std::string content((std::istreambuf_iterator<char>(ifs)),
                           (std::istreambuf_iterator<char>()));


    return content;
}

string genFunction(FunctionNode* n)
{
    mstch::array arguments;

    if (!n->arguments.empty()) {

        for (const auto &argument : n->arguments) {
            arguments.push_back(argument->name);
        }
    }

    mstch::map context{
        {"has_arguments", !n->arguments.empty() },

        {"function_name", n->name },
        {"function_arguments", arguments },
    };

    return mstch::render(getTemplate("function"), context);
}

string genProgram(StateContainer* state)
{
    mstch::array functions;

    for (const auto &function : state->functions) {
        functions.push_back(genFunction(function));
    }

    mstch::map context{
        {"functions", functions },
    };

    return mstch::render(getTemplate("program"), context);
}
