Feature: Exclusion of graph nodes
    The user can input which nodes to exclude from the knowledge subgraph 

    Background: user in database

    Given the following users exist:
    | email               | password     | 
    | user1@email.com     | 1234567890          |  

    Scenario:
        User enters nothing in exclusions
        Given a graph without edges:
        | id   |
        | node1 |
        | node2 |
        | node3 |
  		And I am on the sign-in page
  		Then I should see "Log in"
  		And I fill in "user_email" with "user1@email.com"
  		And I fill in "user_password" with "1234567890"
  		And I press "Log in"
  		Then I should see "Signed in successfully" 
        When user excludes nothing, includes "node1" and hits submit
        Then graph displays only "node1"


    Scenario:
        User enters a non-existant node in exclusions
        Given a graph without edges:
        | id   |
        | node1 |
        | node2 |
        | node3 |
  		And I am on the sign-in page
  		Then I should see "Log in"
  		And I fill in "user_email" with "user1@email.com"
  		And I fill in "user_password" with "1234567890"
  		And I press "Log in"
  		Then I should see "Signed in successfully" 
        When user excludes "node4", includes "node2" and hits submit
        Then graph displays only "node2"

    Scenario:
        User enters the a node in exclusions which is not a inclusion neighbor
        Given a graph:
        | id | weight | source | target |
        | 12 | 1      | node1  | node2  |
        | 23 | 1      | node2  | node3  |
        | 13 | 1      | node1  | node3  |
        | 24 | 1      | node2  | node4  |
  		And I am on the sign-in page
  		Then I should see "Log in"
  		And I fill in "user_email" with "user1@email.com"
  		And I fill in "user_password" with "1234567890"
  		And I press "Log in"
  		Then I should see "Signed in successfully" 
        When user excludes "node4", includes "node1" and hits submit
        Then graph displays "node1"
        Then graph displays "node2"
        Then graph displays "node3"

    Scenario:
        User enters the a node in exclusions which is an inclusion neighbor
        Given a graph:
        | id | weight | source | target |
        | 12 | 1      | node1  | node2  |
        | 23 | 1      | node2  | node3  |
        | 13 | 1      | node1  | node3  |
        | 24 | 1      | node2  | node4  |
  		And I am on the sign-in page
  		Then I should see "Log in"
  		And I fill in "user_email" with "user1@email.com"
  		And I fill in "user_password" with "1234567890"
  		And I press "Log in"
  		Then I should see "Signed in successfully" 
        When user excludes "node3", includes "node1" and hits submit
        Then graph displays "node1"
        Then graph displays "node2"