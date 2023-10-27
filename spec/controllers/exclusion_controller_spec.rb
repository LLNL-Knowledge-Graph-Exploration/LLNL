
require 'rails_helper'

RSpec.describe WelcomeController, type: :controller do
  describe "process_data" do

    it "processes and includes the specified nodes and edges" do
      allow(controller).to receive(:authenticate_user!)

      include_data = ['node1']
      exclude_data = ['node2']
      budget = 100
      post :process_data, params: { include: include_data, exclude: exclude_data, budget: budget }


      expect(response).to have_http_status(:ok)
      response_data = JSON.parse(response.body)
      expect(response_data).to include('message' => 'Data processed and updated successfully')
    end

    it 'handles common nodes in include and exclude' do
      allow(controller).to receive(:authenticate_user!)
      common_node = 'node1'
      include_data = [common_node]
      exclude_data = [common_node]
      budget = 100

      post :process_data, params: { include: include_data, exclude: exclude_data, budget: budget }
      expect(response).to have_http_status(:unprocessable_entity)

      json_response = JSON.parse(response.body)

      # Assert that the response contains an error message about common nodes
      expect(json_response).to include('error' => "Some nodes are both included and excluded: #{common_node}")
    end
  end
end

