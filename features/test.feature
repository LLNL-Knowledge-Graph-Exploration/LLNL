Feature: Inclusion of graph nodes
    The user can input which nodes to include in the knowledge subgraph 

    Background: user in database

    Given the following users exist:
    | email               | password     | 
    | user1@email.com     | 1234567890          |  

    Scenario:
        Include a specific node
        Given the JSON file contains the following data:
        | id   |
        | node1 |
        | node2 |
        | node3 |
  		And I am on the sign-in page
  		Then I should see "Login"
  		And I fill in "user_email" with "user1@email.com"
  		And I fill in "user_password" with "1234567890"
  		And I press "Log in"
  		Then I should see "Signed in successfully" 
        And the user is on the welcome page
        When the user enters "node1" and hits submit
        Then the message contains "Data processed and updated successfully"
    
    Scenario: 
        Include a non-existent node 
        Given the graph:
        | id   |
        | node1 |
        | node2 |
        | node3 |
  		And I am on the sign-in page
  		Then I should see "Login"
  		And I fill in "user_email" with "user1@email.com"
  		And I fill in "user_password" with "1234567890"
  		And I press "Log in"
  		Then I should see "Signed in successfully" 
        When user submits "node4" that does not exist
        Then the returned data has no nodes

    Scenario: 
        Include a node with no connections
        Given a graph with no associated edges:
        | id   |
        | node1 |
        | node2 |
        | node3 |
  		And I am on the sign-in page
  		Then I should see "Login"
  		And I fill in "user_email" with "user1@email.com"
  		And I fill in "user_password" with "1234567890"
  		And I press "Log in"
  		Then I should see "Signed in successfully" 
        When user submits "node1"
        Then graph displays only the single node
    
    Scenario:
        User enters nothing
        Given any graph:
        | id   |
        | node1 |
        | node2 |
        | node3 |
  		And I am on the sign-in page
  		Then I should see "Login"
  		And I fill in "user_email" with "user1@email.com"
  		And I fill in "user_password" with "1234567890"
  		And I press "Log in"
  		Then I should see "Signed in successfully" 
        When user submits "", an empty value
        Then output is empty


