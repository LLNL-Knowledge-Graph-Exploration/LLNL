# frozen_string_literal: true

require 'rails_helper'

RSpec.describe WelcomeController, type: :controller do
  render_views

  before(:each) do
    @request.env["devise.mapping"] = Devise.mappings[:user]
    @user = User.create( email: 'any@email.com', 
      password: 'password',password_confirmation: 'password' )
    sign_in @user
  end

  describe 'log in' do
    it 'Valid user is in the index' do
      get :index
      expect(response.body).to match(/SubGraph Visualization/)
    end
  end
  
  after(:each) do
    sign_out @user
    @user.destroy
  end

end