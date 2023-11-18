Given('I am on the sign-up page') do
    visit new_user_registration_path
  end
  
Then('I should see {string}') do |string|
  expect(body).to have_content(string)
end

Then('I fill in {string} with {string}') do |key, value|
  find("##{key}").set(value)
end

Then('I press {string}') do |string|
  click_button(string)
end

Given('the following users exist:') do |table|
  # table is a Cucumber::MultilineArgument::DataTable
  table.hashes.each do |user|
    User.create user 
  end
end

Given('I am on the sign-in page') do
  visit new_user_session_path
end