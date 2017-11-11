Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/about' => "users#about"
  get "login" => "sessions#new"
  delete "logout" => "sessions#destroy"

  resource :session, :only => [:new, :create, :destroy]
  resources :users do 
  	resource :profile
  end
end
