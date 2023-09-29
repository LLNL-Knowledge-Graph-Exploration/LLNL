  Given("the JSON file contains the following data:") do |table|
    json_data = table.hashes.map { |row| { "data" => { "id" => row['id'] } } }
    json_file_path = Rails.root.join('public', 'data.json')
    File.write(json_file_path, JSON.pretty_generate({ "nodes" => json_data, "edges" => [] }))
  end

  Given("the user is on the welcome page") do
    visit root_path
  end

  When("the user enters {string} and hits submit") do |node_id|
    page.driver.post('/process_data', include: [node_id])
  end

  Then("the message contains {string}") do |expected_message|
    expect(page).to have_content(expected_message)
  end
  
  
  Given("the graph:") do |table|
    json_data = table.hashes.map { |row| { "data" => { "id" => row['id'] } } }
    json_file_path = Rails.root.join('public', 'data.json')
    File.write(json_file_path, JSON.pretty_generate({ "nodes" => json_data, "edges" => [] }))
  end

  When('user submits {string} that does not exist') do |node_id|
    visit root_path
    page.driver.post('/process_data', include: [node_id])
  end
  
  Then('the returned data has no nodes') do
    json_file_path = Rails.root.join('public', 'data.json')

    json_data = File.read(json_file_path)
    json_hash = JSON.parse(json_data)

    expect(json_hash).to eq({"edges"=>[], "nodes"=>[]})
  end
  
  Given('a graph with no associated edges:') do |table|
    json_data = table.hashes.map { |row| { "data" => { "id" => row['id'] } } }
    json_file_path = Rails.root.join('public', 'data.json')
    File.write(json_file_path, JSON.pretty_generate({ "nodes" => json_data, "edges" => [] }))
  end
  
  When('user submits {string}') do |node_id|
    visit root_path
    page.driver.post('/process_data', include: [node_id])
  end
  
  Then('graph displays only the single node') do
    json_file_path = Rails.root.join('public', 'data.json')

    json_data = File.read(json_file_path)
    json_hash = JSON.parse(json_data)

    expect(json_hash['nodes'][0]['data']['id']).to eq("node1") 
  end
  
  Given('any graph:') do |table|
    json_data = table.hashes.map { |row| { "data" => { "id" => row['id'] } } }
    json_file_path = Rails.root.join('public', 'data.json')
    File.write(json_file_path, JSON.pretty_generate({ "nodes" => json_data, "edges" => [] }))
  end
  
  When('user submits {string}, an empty value') do |node_id|
    visit root_path
    page.driver.post('/process_data', include: [node_id])
  end
  
  Then('output is empty') do 
    json_file_path = Rails.root.join('public', 'data.json')

    json_data = File.read(json_file_path)
    json_hash = JSON.parse(json_data)

    expect(json_hash).to eq({"edges"=>[], "nodes"=>[]})
  end