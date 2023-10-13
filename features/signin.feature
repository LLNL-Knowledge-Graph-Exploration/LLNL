Feature: sign in
  As ann existing user
  I need to be able to sign in with my new email
  The app should be able to log me in

  Background: users in database

  Given the following users exist:
  | email               | password     | 
  | user1@email.com     | 1234567890          |  

  	Scenario: sign in and sign out
  		Given I am on the sign-in page
  		Then I should see "Log in"
  		And I fill in "user_email" with "user1@email.com"
  		And I fill in "user_password" with "1234567890"
  		And I press "Log in"
  		Then I should see "Signed in successfully" 
		When I press "Log Out"
		Then I should see "Log in"

  	Scenario: failed sign in
  		Given I am on the sign-in page
  		Then I should see "Log in"
  		And I fill in "user_email" with "user1@email.com"
  		And I fill in "user_password" with "asdfasfdas"
  		And I press "Log in"
  		Then I should see "Invalid Email or password." 