Rails.application.routes.draw do
  get '/' => 'home#index'

  resources :articles
  
  get 'contacts' => 'contacts#new'
  resource :contacts, only: [:create]
end
