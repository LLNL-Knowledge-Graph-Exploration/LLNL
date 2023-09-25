Feature: Inclusion of graph nodes
    The user can input which nodes to include in the knowledge subgraph 

    Scenario:
        Include a specific node
        Given user enters a specific and valid node 
        When user hits submit
        Then graph displays the specific node and associated edges 
    
    Scenario: 
        Include a non-existent node 
        Given user enters a node that does not exist in the database
        When user hits submit
        Then output is an error message "Node X does not exist"

    Scenario: 
        Include a node with no connections 
        Given user enters a node that does not have any associated edges 
        When user hits submit
        Then graph displays only the single node
    
    Scenario:
        User enters nothing
        Given user enters no nodes
        When user hits submit
        Then output is an error message "Invalid Input" 

    Scenario:
        Include a valid node in all upper case letters 
        Given user enters a node in all uppercase 
        When user hits submit
        Then graph displays the specific node and associated edges

    Scenario: 
        Include a valid node in all lowercase letters
        Given user enters a node in all lowercase
        When user hits submit 
        Then output is an error message "Invalid Input" 

    Scenario: 
        Include a valid node whose first letter capital and the other letters are lowercase
        Given user enters a node whose first letter is capitalized 
        When user hits submit
        Then graph displays the specific node and associated edges

    Scenario: 
        Include a node with special characters in the name
        Given user enters a node whose name includes special characters 
        When user hits submit
        Then output is an error message "Invalid Input"


