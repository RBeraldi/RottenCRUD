Rails.application.routes.draw do
  get '/callback' => 'sessions#create'
  get '/login' => 'sessions#login'
  
  resources :movies do 
    resources :reviews
  end 


# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
