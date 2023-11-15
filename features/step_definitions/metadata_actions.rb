Given('node a has been clicked') do
    visit root_path
    sleep 1
    # Execute JavaScript to get the current nodes in the graph
    page.execute_script('handleNodeClick("a");')
end

And('the Metadata is displayed') do
    within('#metaDataForm') do
        expect(page).to have_content('Meta Data')
        expect(page).to have_selector('h4#nodeId', visible: true)
        expect(page).to have_selector('table#metaDataTable', visible: true)
        expect(page).to have_selector('button#metaDataInclude', visible: true)
        expect(page).to have_selector('button#metaDataExclude', visible: true)
    end

end

When('I click the button {string}') do |string|
    if find('#include0', :visible => false).value == ""
        page.fill_in "include0", with: "b"
    end

    within('.right-column') do
        click_button(string)
      end

end

Then('the VID of the selected node should be added to the list of included nodes on the left.') do
    selected_node_vid = find('#nodeId').text
    included_fields = all('#includeFields .dynamic-field', :visible => false)

    vals = (0...included_fields.length).map { |i| find("#include#{i}", visible: false).value }
    expect(vals.any? { |value| value == selected_node_vid }).to be true
  end
  
  Then('the VID of the selected node should be added to the list of excluded nodes on the left') do
    selected_node_vid = find('#nodeId').text
    excluded_fields = all('#excludeFields .dynamic-field', :visible => false)
    
    vals = (0...excluded_fields.length).map { |i| find("#exclude#{i}", visible: false).value }
    expect(vals.any? { |value| value == selected_node_vid }).to be true

  end
  

Then('the graph should not display the excluded node anymore.') do
    selected_node_vid = find('#nodeId').text

    # Execute JavaScript to get the current nodes in the graph
    current_nodes = page.execute_script('return getCurrentNodesInGraph();')
    puts "Current Nodes:", current_nodes
    # Check if the excluded node is not present in the current nodes
    expect(current_nodes).not_to include(selected_node_vid)
end

When('the VID of the selected node is already in the list of included nodes on the left') do
    selected_node_vid = find('#nodeId').text
    if page.has_css?("#includeFields input[value=\"#{selected_node_vid}\"]")
        STDOUT.puts "VID is already in the list of included nodes"
    else
        included_fields = all('#includeFields .dynamic-field')
        if included_fields.any? { |field| field.text.include?("Include Text") }
            # Find an empty field and fill in the value
            empty_field = find('#includeFields input[placeholder="Include Text"]', match: :first)
            empty_field.set(selected_node_vid)
            STDOUT.puts "Filled in the empty field with VID"
          else
            # Click the "Add More" button and input the value into the new field
            click_button(id: 'addMoreInclude')
            excluded_fields = all('#includeFields .dynamic-field')
            empty_field = find('#includeFields input[placeholder="Include Text"]', match: :first)
            empty_field.set(selected_node_vid)
            STDOUT.puts "Added a new field and filled in the VID"
        end
    end

end

Then('the app should display a message, {string}') do |string|
    pending # Write code here that turns the phrase above into concrete actions
end

When('the VID of the selected node is already in the list of excluded nodes on the left') do
    selected_node_vid = find('#nodeId').text
    # Check if the selected VID is already in the list of included nodes
    if page.has_css?('#excludeFields input[value="' + selected_node_vid + '"]')
        STDOUT.puts "VID is already in the list of excluded nodes"
    else
        excluded_fields = all('#excludeFields .dynamic-field')
        if excluded_fields.any? { |field| field.text.exclude?("Exclude Text") }
            # Find an empty field and fill in the value
            empty_field = find('#excludeFields input[placeholder="Exclude Text"]', match: :first)
            empty_field.set(selected_node_vid)
            STDOUT.puts "Filled in the empty field with VID"
          else
            # Click the "Add More" button and input the value into the new field
            click_button(id: 'addMoreExclude')
            excluded_fields = all('#excludeFields .dynamic-field')
            empty_field = find('#excludeFields input[placeholder="Exclude Text"]', match: :first)
            empty_field.set(selected_node_vid)
            STDOUT.puts "Added a new field and filled in the VID"
        end
    end
end