When('user includes {string}, budget is {int} and hits submit') do |string1, budget|
  visit root_path
  # Simulate the form submission with the specified included node and budget
  page.driver.post('/process_data', include: [string1], budget: budget)
end



Then('the graph displays one additional node from [{string}, {string}, {string}]') do |string1, string2, string3|
  json_file_path = Rails.root.join('public', 'data.json')
  json_data = File.read(json_file_path)
  json_hash = JSON.parse(json_data)

  expect(json_hash['nodes'].size).to eq(2) # Ensure there are exactly 2 nodes
  node_ids = json_hash['nodes'].map { |node| node['data']['id'] }
  # Check if one additional node is from the list
  expect(node_ids).to include(string1).or include(string2).or include(string3)
end


When('user includes [{string},{string}], budget is {int} and hits submit') do |string1, string2, budget|
  visit root_path
  page.driver.post('/process_data', include: [string1, string2], budget: budget)
end

Then('user should observe {string}') do |error_message|
  expect(page).to have_content(error_message)
end


