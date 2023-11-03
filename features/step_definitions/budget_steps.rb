
When('user includes {string}, budget is {string} and hits submit') do |node1|
  visit root_path
  page.driver.post('/process_data', include: [node1])
end

Then('the graph displays one additional node from {string}}') do |node1, additional|
  json_file_path = Rails.root.join('public', 'data.json')
  json_data = File.read(json_file_path)
  json_hash = JSON.parse(json_data)

  expect(json_hash['nodes'][0]['data']['id']).to eq(node1)
  expect(json_hash['nodes'][0]['data']['id']).to eq(additional) #only one more node
end

