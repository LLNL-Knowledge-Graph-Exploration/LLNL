# frozen_string_literal: true

require 'rails_helper'

RSpec.describe WelcomeController, type: :controller do
  describe "process_data" do
    let(:valid_params) do
      {
        include: ['node1'],
        exclude: ['node2'],
        budget: 100
      }
    end

    let(:json_data) do
      {
        'nodes' => [
          { 'data' => { 'id' => 'node1' } },
          { 'data' => { 'id' => 'node2' } },
          { 'data' => { 'id' => 'node3' } },
          { 'data' => { 'id' => 'node4' } },
          { 'data' => { 'id' => 'node5' } }
        ],
        'edges' => [
          { 'data' => { 'source' => 'node1', 'target' => 'node2' } },
          { 'data' => { 'source' => 'node3', 'target' => 'node2' } },
          { 'data' => { 'source' => 'node1', 'target' => 'node5' } },
          { 'data' => { 'source' => 'node3', 'target' => 'node4' } }
        ]
      }
    end

    before do
      allow(controller).to receive(:fetch_data).and_return(json_data.to_json)
    end

    it "processes and includes the specified nodes and edges" do
      post :process_data, params: valid_params

      expect(response).to have_http_status(:success)
      response_data = JSON.parse(response.body)
      expect(response_data['message']).to eq('Data processed and updated successfully')

      # Reload JSON data after processing
      updated_json_data = JSON.parse(File.read(Rails.root.join('public', 'data.json')))

      # Verify that only the specified nodes and edges are included
      expect(updated_json_data['nodes']).to include(a_hash_including('data' => { 'id' => 'node1' }))
      expect(updated_json_data['nodes']).to include(a_hash_including('data' => { 'id' => 'node5' }))
      expect(updated_json_data['nodes']).not_to include(a_hash_including('data' => { 'id' => 'node2' }))

      expect(updated_json_data['edges']).not_to include(a_hash_including('data' => { 'source' => 'node1', 'target' => 'node2' }))
      expect(updated_json_data['edges']).to include(a_hash_including('data' => { 'source' => 'node1', 'target' => 'node5' }))
      expect(updated_json_data['edges']).not_to include(a_hash_including('data' => { 'source' => 'node3', 'target' => 'node2' }))
      expect(updated_json_data['edges']).not_to include(a_hash_including('data' => { 'source' => 'node3', 'target' => 'node4' }))


    end



  end
end

