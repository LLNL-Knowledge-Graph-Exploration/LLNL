// Your First C++ Program

// #include <iostream>

// int main() {
//     std::cout << "Hello World!";
//     return 0;
// }

// g++-11 cpp_code/test.cpp -o cpp_code/test_program -I/usr/local/Cellar/nlohmann-json/3.11.2/include/nlohmann -std=c++11
// g++-11 cpp_code/test.cpp -o cpp_code/test_program -I/app/.apt/usr/include/c++/11 -I/app/.apt/usr/include -I/usr/include/linux -I/usr/lib/gcc/x86_64-linux-gnu/11/include -std=c++11
// g++-11 cpp_code/test.cpp -I/usr/lib/gcc/x86_64-linux-gnu/11/include -L/usr/lib/gcc/x86_64-linux-gnu/11 -o cpp_code/test_program 

// I had to do this before I compiled: export LIBRARY_PATH=/usr/lib/gcc/x86_64-linux-gnu/11:$LIBRARY_PATH
// then I had to add the line set(CMAKE_CXX_COMPILER g++-11) to the CMakeLists.txt in the metall repo.


#include <iostream>
#include <nlohmann/json.hpp>

int main() {
    nlohmann::json json_obj;

    // Create the nodes array
    json_obj["nodes"] = nlohmann::json::array({
    {
        {"data", {
            {"id", "a"},
            {"foo", 3},
            {"bar", 5},
            {"baz", 7}
        }}
    },
    {
        {"data", {
            {"id", "b"},
            {"foo", 7},
            {"bar", 1},
            {"baz", 3}
        }}
    },
    {
        {"data", {
            {"id", "c"},
            {"foo", 2},
            {"bar", 7},
            {"baz", 6}
        }}
    },
    {
        {"data", {
            {"id", "d"},
            {"foo", 9},
            {"bar", 5},
            {"baz", 2}
        }}
    },
    {
        {"data", {
            {"id", "e"},
            {"foo", 2},
            {"bar", 4},
            {"baz", 5}
        }}
    }
});

json_obj["edges"] = nlohmann::json::array({
    {
        {"data", {
            {"id", "ae"},
            {"weight", 1},
            {"source", "a"},
            {"target", "e"}
        }}
    },
    {
        {"data", {
            {"id", "ab"},
            {"weight", 3},
            {"source", "a"},
            {"target", "b"}
        }}
    },
    {
        {"data", {
            {"id", "be"},
            {"weight", 4},
            {"source", "b"},
            {"target", "e"}
        }}
    },
    {
        {"data", {
            {"id", "bc"},
            {"weight", 5},
            {"source", "b"},
            {"target", "c"}
        }}
    },
    {
        {"data", {
            {"id", "ce"},
            {"weight", 6},
            {"source", "c"},
            {"target", "e"}
        }}
    },
    {
        {"data", {
            {"id", "cd"},
            {"weight", 2},
            {"source", "c"},
            {"target", "d"}
        }}
    },
    {
        {"data", {
            {"id", "de"},
            {"weight", 7},
            {"source", "d"},
            {"target", "e"}
        }}
    }
});


    std::cout << json_obj.dump(4) << std::endl; // The 'dump(4)' function call formats the JSON nicely

    return 0;
}