Rails.application.routes.draw do
  resources :characters
  resources :proficiencies
  resources :equipment
  resources :charaterclasses
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end