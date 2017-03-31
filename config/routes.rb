Rails.application.routes.draw do
  resources :attractions

  resources :sessions

  resources :users

  resources :rides, only: [:new, :create]

  root to: 'welcome#home'

  get 'signin' => 'sessions#new'
end
