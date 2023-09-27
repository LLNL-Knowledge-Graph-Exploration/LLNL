class WelcomeController < ApplicationController

    # app/controllers/your_controller.rb
    def fetch_data
      # Get the path to the JSON file within the public directory
      json_file_path = Rails.root.join('public', 'data.json')
  
      # Check if the file exists
      if File.exist?(json_file_path)
        # Read the JSON data from the file
        json_data = File.read(json_file_path)
  
        # Parse the JSON data
        parsed_data = JSON.parse(json_data)
  
        # Now you can work with the parsed data as a Ruby hash
        # For example, you can render it as JSON in your response
        render json: parsed_data
      else
        # Handle the case where the JSON file doesn't exist
        render json: { error: 'JSON file not found' }, status: :not_found
      end
    end

    def process_data
        # Get the submitted form data
        include_data = params[:include] || []
        exclude_data = params[:exclude] || []
        budget = params[:budget]
        
        puts "Hello I am Processing Data"

        # Fetch and parse the current data.json
        json_file_path = Rails.root.join('public', 'data.json')
        json_data = File.exist?(json_file_path) ? JSON.parse(File.read(json_file_path)) : {}
    
        # Process and update the JSON data as needed
        included_edges = json_data['edges'].select do |edge|
            include_data.include?(edge['data']['source']) || include_data.include?(edge['data']['target'])
        end

        nodes = []

        json_data['nodes'].each do |node|
            nodes << node if include_data.include?(node['data']['id'])
        end

        included_edges.each do |edge|
            if include_data.include?(edge['data']['source'])
                nodes << json_data['nodes'].find { |node| node['data']['id'] == edge['data']['target'] }
            elsif include_data.include?(edge['data']['target'])
                nodes << json_data['nodes'].find { |node| node['data']['id'] == edge['data']['source'] }
            end
        end

        included_data = {
            'nodes' => nodes,
            'edges' => included_edges
        }

        puts included_data


        # Save the updated JSON data back to data.json
        File.write(json_file_path, JSON.pretty_generate(included_data))
    
        render json: { message: 'Data processed and updated successfully' }
      end

end
