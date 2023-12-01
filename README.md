# LLNL
Knowledge Graph Exploration using Connection Subgraphs

Link: [https://calm-taiga-61776-a8b4b3801c6c.herokuapp.com/](https://calm-taiga-61776-a8b4b3801c6c.herokuapp.com/)

# Contact Information

Product Owner: Bryant McArthur mcarthur@tamu.edu

Scrum Master: Nick Soliman nbsoliman18@tamu.edu

Brent Basiano bbasiano@tamu.edu

Mahsa Valizadeh mvalizadeh@tamu.edu

Aubrey Moulton amoulton@tamu.edu

Vandna Venkata Krishnan vandnavenkat@tamu.edu

# Prerequisites

Ruby Version: `3.2.2`

How to install:

rbenv: [Link](https://www.digitalocean.com/community/tutorials/how-to-install-ruby-on-rails-with-rbenv-on-ubuntu-20-04)

or rvm: [Link](https://rvm.io/rvm/install)

Heroku CLI: [Link](https://devcenter.heroku.com/articles/heroku-cli)

# Project Setup

1. Clone this repository.
   
   `git clone https://github.com/LLNL-Knowledge-Graph-Exploration/LLNL.git`

3. Navigate to project directory

    `cd LLNL`

4. Install Gem Packages

   NOTE: If needed, configure bundler to skip production gems: `bundle config set --local without 'production'`
   
    `bundle install`

5. Run locally

    NOTE: The C++ Algorithm Executable does not work on MacOS and Windows. Ubuntu is required.

    - Via Rails

        - `rails server`

    - Via Heroku CLI (Heroku must be installed)

        - `heroku local`

    Troubleshooting:

    If encountering a migration problem, use the following code:

    `rails db:migrate` or `rails db:migrate RAILS_ENV=development`

4. Testing

    NOTE: If fails are occuring in Selenium for WSL2, Chrome and ChromeDriver may need to be installed.

    ChromeDriver for WSL2: [Link](https://www.gregbrisebois.com/posts/chromedriver-in-wsl2/)

    - Run Cucumber Tests

        - `RAILS_ENV=test bundle exec cucumber <test path (optional)>`

    - Run rspec

        - `bundle exec rspec <test path (optional)>`

5. Deploy to Heroku via Heroku CLI

    NOTE: Heroku CLI must be installed in your system

    - Login to Heroku

        - `heroku login`

    - Create a heroku app
        
        - `heroku create <app name>`
    
    - Add Heroku Postgres

        - `heroku addons:create heroku-postgresql:mini`

    - Commit any changes if needed

        - `git add .`

        - `git commit -m "initial commit"`

    - Push to heroku

        - `git push heroku main`

<!-- # Working with llnl/metall
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
to the CMakeLists.txt in the metall repo. -->
