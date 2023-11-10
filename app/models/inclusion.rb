class Inclusion
    def includeNodes(include_data, json_data)
        included_edges = json_data['edges'].select do |edge|
            include_data.include?(edge['data']['source']) || include_data.include?(edge['data']['target'])
        end
        # if json_data && json_data['edges']
        #     included_edges = json_data['edges'].select do |edge|
        #         include_data.include?(edge['data']['source']) || include_data.include?(edge['data']['target'])
        #     end
        # else
        #     # Handle the case when json_data or json_data['edges'] is not as expected
        #     included_edges = []
        # end
        return included_edges
    end
end
