require 'rails_helper'

RSpec.describe Assembler, type: :model do
  describe '#assemble' do
    it 'handles included nodes and edges when json_data is provided' do

      assembler = Assembler.new

      # Sample data
      include_data = ['node1', 'node2', 'node3']
      included_edges = [
        { 'data' => { 'source' => 'node1', 'target' => 'node2' } },
        { 'data' => { 'source' => 'node2', 'target' => 'node3' } },

      ]
      json_data = {
        'nodes' => [
          { 'data' => { 'id' => 'node1' } },
          { 'data' => { 'id' => 'node2' } },
          { 'data' => { 'id' => 'node3' } },
          { 'data' => { 'id' => 'node4' } },

        ],
      }

      result = assembler.assemble(include_data, included_edges, json_data)

      # Expectations
      expected_nodes = [
        { 'data' => { 'id' => 'node1' } },
        { 'data' => { 'id' => 'node2' } },
        { 'data' => { 'id' => 'node3' } },
      ]
      expected_edges = [
        { 'data' => { 'source' => 'node1', 'target' => 'node2' } },
        { 'data' => { 'source' => 'node2', 'target' => 'node3' } },
      ]
      expected_included_data = {
        'nodes' => expected_nodes,
        'edges' => expected_edges,
      }

      expect(result).to eq(expected_included_data)
    end


    it 'handles included nodes and edges when json_data is provided' do
      assembler = Assembler.new

      # Sample data
      include_data = ['node1', 'node2', 'node3']
      included_edges = [
        { 'data' => { 'source' => 'node1', 'target' => 'node2' } },
        { 'data' => { 'source' => 'node2', 'target' => 'node4' } },
        { 'data' => { 'source' => 'node4', 'target' => 'node3' } },
        { 'data' => { 'source' => 'node5', 'target' => 'node3' } },
      ]
      json_data = {
        'nodes' => [
          { 'data' => { 'id' => 'node1' } },
          { 'data' => { 'id' => 'node2' } },
          { 'data' => { 'id' => 'node3' } },
          { 'data' => { 'id' => 'node4' } },
          { 'data' => { 'id' => 'node5' } },
        ]
      }

      result = assembler.assemble(include_data, included_edges, json_data)

      # Expectations
      expected_nodes = [
        { 'data' => { 'id' => 'node1' } },
        { 'data' => { 'id' => 'node2' } },
        { 'data' => { 'id' => 'node3' } },
        { 'data' => { 'id' => 'node4' } },
        { 'data' => { 'id' => 'node5' } },
      ]
      expected_edges = [
        { 'data' => { 'source' => 'node1', 'target' => 'node2' } },
        { 'data' => { 'source' => 'node2', 'target' => 'node4' } },
        { 'data' => { 'source' => 'node4', 'target' => 'node3' } },
        { 'data' => { 'source' => 'node5', 'target' => 'node3' } },
      ]
      expected_included_data = {
        'nodes' => expected_nodes,
        'edges' => expected_edges,
      }

      expect(result).to eq(expected_included_data)
    end

  end
end
