Given('I am on the sign-up page') do
    visit new_user_registration_path
  end
  
  Then('I should see {string}') do |string|
    expect(body).to have_content(string)
  end
  
  Then('I fill in {string} with {string}') do |key, value|
    fill_in key, with: value
  end
  
  Then('I press {string}') do |string|
    click_button(string)
  end