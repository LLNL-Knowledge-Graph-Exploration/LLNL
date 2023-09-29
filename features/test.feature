Feature: Inclusion of graph nodes
    The user can input which nodes to include in the knowledge subgraph 

    Scenario:
        Include a specific node
        Given the JSON file contains the following data:
        | id   |
        | node1 |
        | node2 |
        | node3 |
        And the user is on the welcome page
        When the user enters "node1" and hits submit
        Then the message contains "Data processed and updated successfully"
    
    Scenario: 
        Include a non-existent node 
        Given the graph:
        | id   |
        | node1 |
        | node2 |
        | node3 |
        When user submits "node4" that does not exist
        Then the returned data has no nodes

    Scenario: 
        Include a node with no connections
        Given a graph with no associated edges:
        | id   |
        | node1 |
        | node2 |
        | node3 |
        When user submits "node1"
        Then graph displays only the single node
    
    Scenario:
        User enters nothing
        Given any graph:
        | id   |
        | node1 |
        | node2 |
        | node3 |
        When user submits "", an empty value
        Then output is empty


