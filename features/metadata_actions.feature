Feature: Metadata Actions
  As a user
  I need to be able to include or exclude nodes from the metadata tab
  The app should be able to add the node to the include or exclude list on the left side panel.

  Background: user in database

    Given the following users exist:
      | email             | password     |
      | user1@email.com   | 1234567890   |

  Scenario: User includes a new node
    Given I am on the sign-in page
    Then I should see "Log in"
    And I fill in "user_email" with "user1@email.com"
    And I fill in "user_password" with "1234567890"
    And I press "Log in"
    Then I should see "Signed in successfully" 
    Given metadata is displayed
    When I click the button "Include"
    Then the VID of the selected node should be added to the list of included nodes on the left.

  Scenario: User excludes a new node
    Given metadata is displayed
    When I click the button "Exclude"
    Then the VID of the selected node should be added to the list of excluded nodes on the left
    And the graph should not display the excluded node anymore.

  Scenario: User attempts to include already inclulded node
    Given metadata is displayed
    When I click the button "Include"
    And the VID of the selected node is already in the list of included nodes on the left
    Then the app should display a message, "Node is already included"

  Scenario: User attempts to exclude already excluded node
    Given metadata is displayed
    When I click the button "Exclude"
    And the VID of the selected node is already in the list of excluded nodes on the left
    Then the app should display a message, "Node is already excluded"
