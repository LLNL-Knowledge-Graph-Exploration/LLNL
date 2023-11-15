Feature: budget feature of graph
  The user can choose the number of displayed nodes in the knowledge subgraph

  Background: user in database

    Given the following users exist:
      | email               | password     |
      | user1@email.com     | 1234567890   |

  Scenario:
  User enters the number of nodes needs to be displayed but it is lower than the included nodes as a result of connections
    Given a graph:
      | id | weight | source | target |
      | 12 | 1      | node1  | node2  |
      | 23 | 1      | node2  | node3  |
      | 13 | 1      | node1  | node3  |
      | 14 | 1      | node1  | node4  |
    And I am on the sign-in page
    Then I should see "Log in"
    And I fill in "user_email" with "user1@email.com"
    And I fill in "user_password" with "1234567890"
    And I press "Log in"
    Then I should see "Signed in successfully"
    When user includes "node1", budget is 2 and hits submit
    Then graph displays "node1"
    Then the graph displays one additional node from ["node2", "node3", "node4"]



  Scenario:
  User enters the number of nodes needs to be displayed and it is higher than the included nodes
    Given a graph:
      | id | weight | source | target |
      | 12 | 1      | node1  | node2  |
      | 23 | 1      | node2  | node3  |
      | 13 | 1      | node1  | node3  |
      | 14 | 1      | node2  | node4  |
    And I am on the sign-in page
    Then I should see "Log in"
    And I fill in "user_email" with "user1@email.com"
    And I fill in "user_password" with "1234567890"
    And I press "Log in"
    Then I should see "Signed in successfully"
    When user includes "node2", budget is 5 and hits submit
    Then graph displays "node1"
    Then graph displays "node2"
    Then graph displays "node3"
    Then graph displays "node4"


  Scenario:
  User enters the number of nodes needs to be displayed but it is lower than the included nodes by user
    Given a graph:
      | id | weight | source | target |
      | 12 | 1      | node1  | node2  |
      | 23 | 1      | node2  | node3  |
      | 13 | 1      | node1  | node3  |
      | 14 | 1      | node1  | node4  |
    And I am on the sign-in page
    Then I should see "Log in"
    And I fill in "user_email" with "user1@email.com"
    And I fill in "user_password" with "1234567890"
    And I press "Log in"
    Then I should see "Signed in successfully"
    When user includes ["node1","node2"], budget is 1 and hits submit
    Then user should observe "The number of included nodes exceeds the budget"



