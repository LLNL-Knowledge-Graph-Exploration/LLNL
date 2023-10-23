class Exclusion

    def excludeNodes(included_edges, exclude_data)
        included_edges.delete_if { 
           |edge| exclude_data.include?(edge['data']['source']) || exclude_data.include?(edge['data']['target'])
        }
    end
end