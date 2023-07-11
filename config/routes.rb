Rails.application.routes.draw do
  get '/' => 'home#index'

  get 'terms' => 'pages#terms'
  get 'about' => 'pages#about'

  resources :articles
  
  get 'contacts' => 'contacts#new'
  resource :contacts, only: [:create]
end
