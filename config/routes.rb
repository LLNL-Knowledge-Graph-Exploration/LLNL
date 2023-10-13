Rails.application.routes.draw do
  devise_for :users
  root 'welcome#index'
  post '/process_data', to: 'welcome#process_data'
end
