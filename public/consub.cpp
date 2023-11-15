#include <iostream>
#include <boost/json/src.hpp>

int main(int, char**) {
  boost::json::value jv = {
      {"nodes", {"data", {{"id", "zero"}, {"description", "cero"}},
                         {{"id", "one"}, {"description", "uno"}}, 
                         {{"id", "two"}, {"description", "dos"}}}},
      {"edges", {"data", {{"id", "e0"}, {"source", "zero"}, {"target", "one"}, {"extrafield", "foo"}},
                         {{"id", "e1"}, {"source", "one"}, {"target", "two"},{"extrafield", "bar"}}, 
                         {{"id", "e2"}, {"source", "two"}, {"target", "zero"},{"extrafield", "baz"}}}}
      };

  std::cout << jv << std::endl;
  return 0;
}