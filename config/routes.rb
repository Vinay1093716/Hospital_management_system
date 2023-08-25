Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
 
  
  resources :doctors do
    resources :patients
    resources :appointments
  end
  resources :hospitals do
    resources :doctors
  end
  # Defines the root path route ("/")
  root "hospitals#index"
end
