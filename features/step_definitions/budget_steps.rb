When('budget is 2') do

end


Then("the graph displays one additional node from {string}") do |additional_nodes_list|
  additional_nodes = additional_nodes_list.split(', ').reject { |node| node == @displayed_node }
  # Check if one of the additional nodes is displayed
  displayed_node = # Code to check the displayed graph and identify the node
  expect(additional_nodes).to include(displayed_node)
end

