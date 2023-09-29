Rails.application.routes.draw do
  root 'welcome#index'
  post '/process_data', to: 'welcome#process_data'
end
