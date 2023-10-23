class Assembler

    def assemble(include_data, included_edges, json_data)
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
            elsif include_data.include?(edge['data']['target'])
                node = json_data['nodes'].find { |node| node['data']['id'] == edge['data']['source'] }
                if !nodes.include?(node)
                    nodes << node
                end
            end
        end

        included_data = {
            'nodes' => nodes,
            'edges' => included_edges
        }

        return included_data
    end
end