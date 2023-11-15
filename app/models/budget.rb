class Budget
    def modify_nodes(final_data, budget, include_data)
      included_nodes = include_data.clone
      included_edges = []
  
      # Add edges for initially included nodes, taking care of the budget
      final_data['edges'].each do |edge|
        source, target = edge['data']['source'], edge['data']['target']
        
        # Check if the edge connects two included nodes or if it connects an included node to a new node within budget
        if included_nodes.include?(source) && included_nodes.include?(target)
          included_edges << edge
        elsif included_nodes.include?(source) && !included_nodes.include?(target) && included_nodes.size < budget
          included_edges << edge
          included_nodes << target
        elsif included_nodes.include?(target) && !included_nodes.include?(source) && included_nodes.size < budget
          included_edges << edge
          included_nodes << source
        end
        
        # Stop if budget is reached
        break if included_nodes.size >= budget
      end

      # If budget is exceeded, return an error message
      if included_nodes.size > budget
        return { 'error' => "The number of included nodes exceeds the budget" }
      end
  
      # If budget allows, include additional nodes that are not yet included and connected by edges
      if included_nodes.size < budget
        additional_nodes = final_data['nodes'].select { |node| !included_nodes.include?(node['data']['id']) }
        additional_nodes.each do |node|
          break if included_nodes.size >= budget
          included_nodes << node['data']['id']
        end
      end
  
      # Re-check the edges to ensure all edges where both nodes are in the included set are present
      included_edges = final_data['edges'].select do |edge|
        included_nodes.include?(edge['data']['source']) && included_nodes.include?(edge['data']['target'])
      end
  
      # Construct the final data structure with the included nodes and edges
      new_final_data = {
        'nodes' => final_data['nodes'].select { |node| included_nodes.include?(node['data']['id']) },
        'edges' => included_edges
      }
  
      new_final_data
    end
  end
