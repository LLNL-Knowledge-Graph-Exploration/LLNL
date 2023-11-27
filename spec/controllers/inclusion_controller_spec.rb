
require 'rails_helper'

RSpec.describe WelcomeController, type: :controller do
  describe '#process_data' do
    it 'processes data and returns a success response' do
      allow(controller).to receive(:authenticate_user!)

      # sample parameters for the request
      include_data = ['node1', 'node2']
      exclude_data = []
      budget = 100


      post :process_data, params: { include: include_data, exclude: exclude_data, budget: budget }

      expect(response).to have_http_status(:ok)

      json_response = JSON.parse(response.body)

      expect(json_response).to include('message' => 'Data processed and updated successfully')
    end

    it 'processes data throws error if budget is less than inclusion' do
      allow(controller).to receive(:authenticate_user!)

      # sample parameters for the request
      include_data = ['node1', 'node2']
      exclude_data = []
      budget = 1


      post :process_data, params: { include: include_data, exclude: exclude_data, budget: budget }

      json_response = JSON.parse(response.body)

      expect(json_response).to include('error' => "The number of included nodes exceeds the budget")
    end

    it 'handles common nodes in include and exclude' do
      allow(controller).to receive(:authenticate_user!)

      # sample parameters
      common_node = 'node1'
      include_data = [common_node]
      exclude_data = [common_node]
      budget = 100


      post :process_data, params: { include: include_data, exclude: exclude_data, budget: budget }


      expect(response).to have_http_status(:unprocessable_entity)

      json_response = JSON.parse(response.body)

      expect(json_response).to include('error' => "Some nodes are both included and excluded: #{common_node}")
    end


    it 'handles JSON parsing errors' do
      allow(controller).to receive(:authenticate_user!)

      invalid_json_data = "This is not a valid JSON string"
      allow(File).to receive(:exist?).and_return(true)
      allow(File).to receive(:read).and_return(invalid_json_data)

      post :process_data, params: { include: [], exclude: [], budget: 100 }

      expect(response).to have_http_status(:internal_server_error)

      json_response = JSON.parse(response.body)

      expect(json_response).to include('error' => a_string_including('Error reading data.json'))
    end

    it 'handles file writing errors' do

      allow(controller).to receive(:authenticate_user!)

      allow(File).to receive(:exist?).and_return(true)
      allow(File).to receive(:read).and_return('{}')
      allow(File).to receive(:write).and_raise(Errno::EACCES, 'Permission denied')

      post :process_data, params: { include: [], exclude: [], budget: 100 }
      expect(response).to have_http_status(:internal_server_error)

      json_response = JSON.parse(response.body)

      expect(json_response).to include('error' => a_string_including('Error writing params.json'))
    end

    # it 'interacts with Inclusion, Exclusion, and Assembler classes' do
    #   allow(controller).to receive(:authenticate_user!)

    #   inclusion = instance_double(Inclusion, includeNodes: [])
    #   exclusion = instance_double(Exclusion, excludeNodes: [])
    #   assembler = instance_double(Assembler, assemble: {})

    #   allow(Inclusion).to receive(:new).and_return(inclusion)
    #   allow(Exclusion).to receive(:new).and_return(exclusion)
    #   allow(Assembler).to receive(:new).and_return(assembler)

    #   post :process_data, params: { include: [], exclude: [], budget: 100 }

    #   expect(inclusion).to have_received(:includeNodes).with([], anything)
    #   expect(exclusion).to have_received(:excludeNodes).with([], [])
    #   expect(assembler).to have_received(:assemble).with([], [], anything)
    # end
  end
end

