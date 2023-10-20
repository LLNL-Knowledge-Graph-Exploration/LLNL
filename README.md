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

        - `bundle exec cucumber <test path>`

    - Run rspec

        - `bundle exec rspec <test path>`
