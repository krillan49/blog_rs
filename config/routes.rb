Rails.application.routes.draw do
  get '/' => 'home#index'

  resources :articles
  
  resource :contacts, only: [:new, :create]
end
