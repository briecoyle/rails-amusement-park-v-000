Rails.application.routes.draw do
  resources :sessions

  resources :users

  root to: 'welcome#home'

  get 'signin' => 'sessions#new'
end
