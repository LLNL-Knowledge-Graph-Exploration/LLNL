When('user chooses a JSON file for upload') do
  visit root_path
  file_path = Rails.root.join('db/test_upload.json')
  attach_file('uploadedFile', file_path)
end

When('user chooses a non-JSON file for upload') do
  visit root_path
  file_path = Rails.root.join('db/dummy.txt')
  attach_file('uploadedFile', file_path)
end


Then('I should be redirected to the root page') do
  expect(current_path).to eq(root_path)
end