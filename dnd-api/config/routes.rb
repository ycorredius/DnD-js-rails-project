Rails.application.routes.draw do
  resources :races
  resources :characters
  resources :proficiencies
  resources :equipment
  resources :characterclasses
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: 'welcome#index'
  get '/route', to: 'controller#method'

end
