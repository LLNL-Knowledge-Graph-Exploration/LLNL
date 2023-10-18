class WelcomeController < ApplicationController

    before_action :authenticate_user!

    # app/controllers/your_controller.rb
    # g++ public/test.cpp -o public/test_program -I/usr/local/Cellar/nlohmann-json/3.11.2/include/nlohmann -std=c++11
    def fetch_data
        # system("g++ public/test.cpp -o public/test_program2 -I/usr/local/Cellar/nlohmann-json/3.11.2/include/nlohmann -std=c++11")
        json_data = `public/test_program2`
        return json_data
    end

    def process_data
        # Get the submitted form data
        include_data = params[:include] || []
        exclude_data = params[:exclude] || []
        budget = params[:budget]
        
        puts "Hello I am Processing Data"

        # Fetch and parse the current data.json
        json_file_path_in = Rails.root.join('db', 'data.json')
        json_file_path_out = Rails.root.join('public', 'data.json')

        json_data = File.exist?(json_file_path_in) ? JSON.parse(File.read(json_file_path_in)) : {}
        
        #json_data = fetch_data
        #json_data = JSON.parse(json_data)
    
        # Get edges of included nodes
        included_edges = json_data['edges'].select do |edge|
            include_data.include?(edge['data']['source']) || include_data.include?(edge['data']['target'])
        end

        # Remove excluded nodes from include_data
        #included_edges.delete_if { 
        #    |edge| exclude_data.include?(edge['data']['source']) || exclude_data.include?(edge['data']['target'])
        #}

        # Make nodes list for final included data
        nodes = []

        json_data['nodes'].each do |node|
            nodes << node if include_data.include?(node['data']['id'])
        end
        
        # Make edges list for final included edges
        included_edges.each do |edge|
            if include_data.include?(edge['data']['source'])
                node = json_data['nodes'].find { |node| node['data']['id'] == edge['data']['target'] }
                if !nodes.include?(node)
                    nodes << node
                end
                # nodes << json_data['nodes'].find { |node| node['data']['id'] == edge['data']['target'] }
            elsif include_data.include?(edge['data']['target'])
                node = json_data['nodes'].find { |node| node['data']['id'] == edge['data']['source'] }
                if !nodes.include?(node)
                    nodes << node
                end
                #nodes << json_data['nodes'].find { |node| node['data']['id'] == edge['data']['source'] }
            end
        end

        included_data = {
            'nodes' => nodes,
            'edges' => included_edges
        }

        puts included_data


        # Save the updated JSON data back to data.json
        File.write(json_file_path_out, JSON.pretty_generate(included_data))
    
        render json: { message: 'Data processed and updated successfully' }
      end

end
