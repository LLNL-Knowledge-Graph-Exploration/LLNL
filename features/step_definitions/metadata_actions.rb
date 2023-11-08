Given('metadata is displayed') do
    puts root_path
    visit root_path
    within('#metaDataForm') do
        expect(page).to have_content('Meta Data')
        expect(page).to have_selector('h4#nodeId', visible: true)
        expect(page).to have_selector('table#metaDataTable', visible: true)
        expect(page).to have_selector('button#metaDataInclude', visible: true)
        expect(page).to have_selector('button#metaDataExclude', visible: true)
    end
end

When('I click the button {string}') do |string|
    within('.right-column') do
        click_button(string)
      end
end

Then('the VID of the selected node should be added to the list of included nodes on the left.') do
    pending # Write code here that turns the phrase above into concrete actions
end

Then('the VID of the selected node should be added to the list of excluded nodes on the left') do
    pending # Write code here that turns the phrase above into concrete actions
end

Then('the graph should not display the excluded node anymore.') do
    pending # Write code here that turns the phrase above into concrete actions
end

When('the VID of the selected node is already in the list of included nodes on the left') do
    pending # Write code here that turns the phrase above into concrete actions
end

Then('the app should display a message, {string}') do |string|
    pending # Write code here that turns the phrase above into concrete actions
end

When('the VID of the selected node is already in the list of excluded nodes on the left') do
    pending # Write code here that turns the phrase above into concrete actions
end