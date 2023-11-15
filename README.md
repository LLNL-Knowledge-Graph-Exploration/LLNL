# LLNL
Knowledge Graph Exploration using Connection Subgraphs

Link: [https://calm-taiga-61776-a8b4b3801c6c.herokuapp.com/](https://calm-taiga-61776-a8b4b3801c6c.herokuapp.com/)

# Prerequisites

Ruby Version: `3.2.2`

# Project Setup

1. Clone this repository.
   
   `git clone git@github.com:LLNL-Knowledge-Graph-Exploration/LLNL.git`

3. Navigate to project directory

    `cd LLNL`

4. Install Gem Packages

    `bundle install`

5. Run locally

    - Via Rails

        - `rails server`

    - Via Heroku CLI (Heroku must be installed)

        - `heroku local`

    Troubleshooting:

    If encountering a migration problem, use the following code:

    `rails db:migrate` or `rails db:migrate RAILS_ENV=development`

4. Testing

    - Run Cucumber Tests

        - `RAILS_ENV=test bundle exec cucumber <test path>`

    - Run rspec

        - `bundle exec rspec <test path>`

# Working with llnl/metall
1. Before you compile: 
```export LIBRARY_PATH=/usr/lib/gcc/x86_64-linux-gnu/11:$LIBRARY_PATH```
2. `git clone https://github.com/LLNL/metall`
3. `export METALL_INCLUDE=$PWD/metall/include`
4. Download Boost
```
wget https://boostorg.jfrog.io/artifactory/main/release/1.78.0/source/boost_1_78_0.tar.gz
tar xvf boost_1_78_0.tar.gz
export BOOST_ROOT=$PWD/boost_1_78_0
```
5. Add the line:
```cpp
set(CMAKE_CXX_COMPILER g++-11)
```
 to the CMakeLists.txt in the metall repo.
