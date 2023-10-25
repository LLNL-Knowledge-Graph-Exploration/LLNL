require 'rails_helper'

RSpec.describe Inclusion, type: :model do
  describe '#includeNodes' do
    it 'handles included edges when json_data is provided' do
      inclusion = Inclusion.new

      # Sample data
      include_data = ['node1', 'node2', 'node3']
      json_data = {
        'edges' => [
          { 'data' => { 'source' => 'node1', 'target' => 'node2' } },
          { 'data' => { 'source' => 'node2', 'target' => 'node3' } },
          { 'data' => { 'source' => 'node4', 'target' => 'node5' } },
        ]
      }

      result = inclusion.includeNodes(include_data, json_data)

      # Expectations
      expected_included_edges = [
        { 'data' => { 'source' => 'node1', 'target' => 'node2' } },
        { 'data' => { 'source' => 'node2', 'target' => 'node3' } }
      ]

      expect(result).to eq(expected_included_edges)
    end

    it 'handles included edges when json_data is not as expected' do
      inclusion = Inclusion.new

      # Sample data
      include_data = ['node1', 'node2', 'node3']
      json_data = nil

      result = inclusion.includeNodes(include_data, json_data)

      # Expectation: When json_data is nil, the result should be an empty array.
      expect(result).to eq([])
    end

    it 'handles included edges when json_data does not contain edges' do
      inclusion = Inclusion.new

      # Sample data
      include_data = ['node1', 'node2', 'node3']
      json_data = {
        'nodes' => [
          { 'data' => { 'id' => 'node1' } },
          { 'data' => { 'id' => 'node2' } },
          { 'data' => { 'id' => 'node3' } }
        ]
      }

      result = inclusion.includeNodes(include_data, json_data)

      # Expectation: When json_data does not contain edges, the result should be an empty array.
      expect(result).to eq([])
    end
  end
end
