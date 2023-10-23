class Inclusion

    def includeNodes(include_data, json_data)
        included_edges = json_data['edges'].select do |edge|
            include_data.include?(edge['data']['source']) || include_data.include?(edge['data']['target'])
        end 
        return included_edges
    end
end