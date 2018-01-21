Rails.application.routes.draw do
  get "/contacts" => 'pages#index' 
  post "/contacts" => 'pages#create'
  get "/contacts/:id" => 'pages#show'
  patch "/contacts/:id" => 'pages#update'
  delete "/contacts/:id" => 'pages#destroy'
end
