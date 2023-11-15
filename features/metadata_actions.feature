Feature: Metadata Actions
  As a user
  I need to be able to include or exclude nodes from the metadata tab
  The app should be able to add the node to the include or exclude list on the left side panel.

  
  Scenario: User includes a new node
    Given node a has been clicked
    And the Metadata is displayed
    When I click the button "Include"
    Then the VID of the selected node should be added to the list of included nodes on the left.

  Scenario: User excludes a new node
    Given node a has been clicked
    And the Metadata is displayed
    When I click the button "Exclude"
    Then the VID of the selected node should be added to the list of excluded nodes on the left
    # And the graph should not display the excluded node anymore.

#   Scenario: User attempts to include already inclulded node
#     Given node a has been clicked
#     And the Metadata is displayed
#     When I click the button "Include"
#     And the VID of the selected node is already in the list of included nodes on the left
#     Then I should see "Node is already included"

#   Scenario: User attempts to exclude already excluded node
#     Given node a has been clicked
#     And the Metadata is displayed
#     When I click the button "Exclude"
#     And the VID of the selected node is already in the list of excluded nodes on the left
#     Then I should see "Node is already excluded"
