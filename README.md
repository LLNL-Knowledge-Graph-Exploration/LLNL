# LLNL
Knowledge Graph Exploration using Connection Subgraphs

Link: [https://calm-taiga-61776-a8b4b3801c6c.herokuapp.com/](https://calm-taiga-61776-a8b4b3801c6c.herokuapp.com/)

# Prerequisites

Ruby Version: `3.2.2`

# Project Setup

1. Clone this repository.
   `git clone git@github.com:LLNL-Knowledge-Graph-Exploration/LLNL.git`

2. Navigate to project directory

    `cd LLNL`

3. Install Gem Packages

    `bundle install`

4. Run locally

    - Via Rails

        - `rails server`

    - Via Heroku CLI (Heroku must be installed)

        - `heroku local`

    Troubleshooting:

    If encountering a migration problem, use the following code:

    `rails db:migrate` or `rails db:migrate RAILS_ENV=development`
