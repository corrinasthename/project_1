Rails.application.routes.draw do
  root to: 'home#index'
  get 'new', to: 'pokemon#new'
  devise_for :trainers
  resources :trainers
  patch "capture", to: 'pokemon#capture', as: :capture
  patch "damage", to: 'pokemon#damage', as: :damage
  # patch "/", to: 'home#index'
  # get "pokemons/new", to: "pokemon#create"
  # get 'new', to: 'pokemon#create', as: :new
  post 'trainers/:id', to: 'pokemon#new', as: :create
end
