# frozen_string_literal: true

require 'rails_helper'

RSpec.describe WelcomeController, type: :controller do
    describe 'json file upload' do
        it 'does not modify existing JSON if no file is uploaded' do
            allow(controller).to receive(:authenticate_user!)

            json_file_path = Rails.root.join('db', 'test_data.json')
            json_data = File.read(json_file_path)

            # sample parameters for the request
            include_data = []
            exclude_data = []
            budget = 100

            post :process_data, params: { include: include_data, exclude: exclude_data, budget: budget }

            expect(response).to have_http_status(:ok)

            json_response = JSON.parse(response.body)
            expect(json_response).to include('message' => 'Data processed and updated successfully')
            
            updated_json_data = File.read(json_file_path)
            expect(updated_json_data).to eq json_data
        end

        it 'does not modify existing JSON if no file is uploaded' do
            allow(controller).to receive(:authenticate_user!)


            json_data = File.read('spec/fixtures/files/test_upload.json')
            @file = fixture_file_upload(Rails.root + 'spec/fixtures/files/test_upload.json', 'file/json')

            post :process_data, params: { :uploadedFile => @file }

            expect(response).to have_http_status(:ok)

            json_response = JSON.parse(response.body)
            expect(json_response).to include('message' => 'Data processed and updated successfully')
            
            json_file_path = Rails.root.join('db', 'test_data.json')
            updated_json_data = File.read(json_file_path)
            expect(updated_json_data).to eq json_data
        end
    end

end

