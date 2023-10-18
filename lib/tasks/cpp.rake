# Rakefile
# g++ public/test.cpp -o public/test_program -I/usr/local/Cellar/nlohmann-json/3.11.2/include/nlohmann -std=c++11

task :compile_cpp do
    system('g++ cpp_code/test.cpp -o cpp_code/test_program -Icpp_code/nlohmann-json/3.11.2/include/nlohmann -std=c++11
    ')
end
  