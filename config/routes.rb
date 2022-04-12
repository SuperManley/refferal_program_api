Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/subscriber/:id' => 'subscriber#show'
  post '/confirm-subscriber/:id' => 'subscriber#confirm'
  post '/subscriber' => 'subscriber#create'
  put '/subscriber/:id' => 'subscriber#update'
end
