  Given('a graph without edges:') do |table|
    json_data = table.hashes.map { |row| { "data" => { "id" => row['id'] } } }
    json_file_path = Rails.root.join('db', 'test_data.json')
    File.write(json_file_path, JSON.pretty_generate({ "nodes" => json_data, "edges" => [] }))
  end

  Given('a graph:') do |table|
    json_node_data = table.hashes.flat_map do |row|
        [
          { "data" => { "id" => row['source'] } },
          { "data" => { "id" => row['target'] } }
        ]
      end
    json_edge_data = table.hashes.map { |row| { "data" => { "id" => row['id'], "weight" => row['weight'], "source" => row['source'], "target" => row['target'] } } }
    json_file_path = Rails.root.join('db', 'test_data.json')
    File.write(json_file_path, JSON.pretty_generate({ "nodes" => json_node_data.uniq { |row| row['data']['id'] }, "edges" => json_edge_data }))
  end


  
  When('user excludes nothing, includes {string} and hits submit') do |node1|
    visit root_path
    page.driver.post('/process_data', include: [node1])
  end
  
  Then('graph displays only {string}') do |node1|
    json_file_path = Rails.root.join('public', 'data.json')

    json_data = File.read(json_file_path)
    json_hash = JSON.parse(json_data)

    expect(json_hash['nodes'][0]['data']['id']).to eq(node1) 
  end
  
  When('user excludes {string}, includes {string} and hits submit') do |node1, node2|
    visit root_path
    page.driver.post('/process_data', include: [node2], exclude: [node1])

    # Remove the file referenced by json_file_path
    # json_file_path = Rails.root.join('db', 'test_data.json')
    # File.delete(json_file_path) if File.exist?(json_file_path)
  end


  Then('graph displays {string}') do |node1|
    json_file_path = Rails.root.join('public', 'data.json')

    json_data = File.read(json_file_path)
    json_hash = JSON.parse(json_data)
    expect(json_hash['nodes'].map { |node| node['data']['id'] }).to include(node1)

  end