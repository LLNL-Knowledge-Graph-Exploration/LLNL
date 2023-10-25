require 'rails_helper'

RSpec.describe Exclusion, type: :model do
  describe '#excludeNodes' do
    it 'removes edges based on exclusion criteria' do
      exclusion = Exclusion.new

      # Sample data
      included_edges = [
        { 'data' => { 'source' => 'node1', 'target' => 'node2' } },
        { 'data' => { 'source' => 'node2', 'target' => 'node3' } },
        { 'data' => { 'source' => 'node3', 'target' => 'node4' } },
      ]
      exclude_data = ['node2', 'node3']


      result = exclusion.excludeNodes(included_edges, exclude_data)

      # Expectations
      expected_included_edges = [ ]

      expect(result).to eq(expected_included_edges)
    end


      it 'removes edges based on exclusion criteria' do
        exclusion = Exclusion.new

        # Sample data
        included_edges = [
          { 'data' => { 'source' => 'node1', 'target' => 'node2' } },
          { 'data' => { 'source' => 'node2', 'target' => 'node3' } },
          { 'data' => { 'source' => 'node3', 'target' => 'node4' } },
        ]
        exclude_data = ['node2']


        result = exclusion.excludeNodes(included_edges, exclude_data)

        # Expectations
        expected_included_edges = [ { 'data' => { 'source' => 'node3', 'target' => 'node4' } }]

        expect(result).to eq(expected_included_edges)
      end

  end
end
