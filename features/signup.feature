Feature: sign up
  As a new user
  I need to be able to sign up with my new email
  The app should be able to create a new account for me

	Scenario: sign up account
  		Given I am on the sign-up page
  		Then I should see "Sign Up"
  		And I fill in "user_email" with "admin5@gmail.com"
  		And I fill in "user_password" with "admin2"
  		And I fill in "user_password_confirmation" with "admin2"
  		And I press "Sign up"
  		Then I should see "Welcome! You have signed up successfully."
	
	Scenario: Sign up and Log out
  		Given I am on the sign-up page
  		Then I should see "Sign Up"
  		And I fill in "user_email" with "admin5@gmail.com"
  		And I fill in "user_password" with "admin2"
  		And I fill in "user_password_confirmation" with "admin2"
  		And I press "Sign up"
  		Then I should see "Welcome! You have signed up successfully."
		When I press "Log Out"
		Then I should see "Log in"