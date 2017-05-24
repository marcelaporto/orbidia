Rails.application.routes.draw do
  get '/signup' => 'users#new'
  get '/users/:id' => 'users#show'
  post '/users' => 'users#create'

  get '/' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
