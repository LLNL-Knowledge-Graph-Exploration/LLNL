Feature: JSON File Upload
  As a user
  I need to be able to upload my JSON file
  The app should be able to upload my file

  Background: user in database

    Given the following users exist:
      | email             | password     |
      | user1@email.com   | 1234567890   |

  Scenario: User uploads a JSON file
    Given I am on the sign-in page
    Then I should see "Login"
    And I fill in "user_email" with "user1@email.com"
    And I fill in "user_password" with "1234567890"
    And I press "Log in"
    Then I should see "Signed in successfully"
    And the user is on the welcome page
    When user chooses a JSON file for upload
    And user excludes nothing, includes "node1" and hits submit
    Then graph displays only "node1"


  Scenario: User uploads a JSON file with multiple nodes

    Given I am on the sign-in page
    Then I should see "Login"
    And I fill in "user_email" with "user1@email.com"
    And I fill in "user_password" with "1234567890"
    And I press "Log in"
    Then I should see "Signed in successfully"
    And the user is on the welcome page
    When user chooses a JSON file for upload
    And user excludes "node2", includes "node1" and hits submit
    Then graph displays "node1"


  Scenario: User uploads a non-JSON file
    Given I am on the sign-in page
    And I fill in "user_email" with "user1@email.com"
    And I fill in "user_password" with "1234567890"
    And I press "Log in"
    Then I should see "Signed in successfully"
    When user chooses a non-JSON file for upload
    Then I should be redirected to the root page




