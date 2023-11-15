require 'rails_helper'

RSpec.describe Budget, type: :model do
  describe '#modify_nodes' do
    let(:budget) { Budget.new }
    let(:final_data) do
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
          { 'data' => { 'source' => 'node2', 'target' => 'node3' } },
          { 'data' => { 'source' => 'node3', 'target' => 'node4' } },
          { 'data' => { 'source' => 'node4', 'target' => 'node5' } },
          { 'data' => { 'source' => 'node5', 'target' => 'node1' } }
        ]
      }
    end

    context 'when including specific nodes within budget' do
      let(:include_data) { ['node1', 'node2', 'node3'] }
      let(:budget_limit) { 4 }

      it 'includes specified nodes and their connecting edges without exceeding budget' do
        result = budget.modify_nodes(final_data, budget_limit, include_data)

        expect(result['nodes'].map { |n| n['data']['id'] }).to include(*include_data)
        expect(result['nodes'].size).to be <= budget_limit
        expect(result['edges'].size).to be > 0
      end
    end

    context 'when budget is smaller than include_data' do
      let(:include_data) { ['node1', 'node2', 'node3', 'node4'] }
      let(:budget_limit) { 3 }

      it 'returns an error due to budget constraints' do
        result = budget.modify_nodes(final_data, budget_limit, include_data)
        expect(result).to have_key('error')
      end
    end

  end
end
