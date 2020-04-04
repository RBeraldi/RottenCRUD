Rails.application.routes.draw do
  resources :movies # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/callback' => 'sessions#create'
  get '/login' => 'sessions#login'
end
