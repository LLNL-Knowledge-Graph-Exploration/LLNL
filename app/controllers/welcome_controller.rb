class WelcomeController < ApplicationController

    before_action :authenticate_user! , except: [:process_data]

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
        
        # Throw error if user puts the same node in include and exclude
        common_nodes = include_data & exclude_data
        if common_nodes.any?
            render json: { error: "Some nodes are both included and excluded: #{common_nodes.join(', ')}" }, status: :unprocessable_entity
            return
        end

        puts "Hello I am Processing Data"

        # Fetch and parse the current data.json
        json_file_path_in = if Rails.env.test?
                                Rails.root.join('db', 'test_data.json')
                            else
                                Rails.root.join('db', 'data.json')
                            end
        json_file_path_out = Rails.root.join('public', 'data.json')
        if params[:uploadedFile].present? && params[:uploadedFile].respond_to?(:read)
            file = File.write(json_file_path_in, params[:uploadedFile].read)
        end

        begin
            json_data = File.exist?(json_file_path_in) ? JSON.parse(File.read(json_file_path_in)) : {}
        rescue JSON::ParserError => e
            render json: { error: "Error reading data.json: #{e.message}" }, status: :internal_server_error
            return
        end

        json_data = File.exist?(json_file_path_in) ? JSON.parse(File.read(json_file_path_in)) : {}

        # Calls to the inclusion, exclusion models
        inclusion = Inclusion.new
        exclusion = Exclusion.new
        assembler = Assembler.new
        budgeter = Budget.new

        included_edges = inclusion.includeNodes(include_data, json_data)
        included_edges = exclusion.excludeNodes(included_edges, exclude_data)
        final_data = assembler.assemble(include_data, included_edges, json_data)

        budgeted_final_data = budgeter.modify_nodes(final_data, budget.to_i, include_data)

        # Save the updated JSON data back to data.json
        begin
            File.write(json_file_path_out, JSON.pretty_generate(budgeted_final_data))
        rescue Errno::EACCES, Errno::EIO, Errno::EPIPE => e
            render json: { error: "Error writing data.json: #{e.message}" }, status: :internal_server_error
            return
        end
        render json: { message: 'Data processed and updated successfully' }
      end

end
