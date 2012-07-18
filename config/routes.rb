Barcampnola5::Application.routes.draw do
  resources :accounts
  resources :entries do
    match 'search', on: :collection
  end
  resources :sessions, only: [:new, :create, :destroy]
  match '/signout', to: 'sessions#destroy', as: :signout

  match '/auth/:provider/callback', to: 'sessions#create'
  match '/auth/failure', to: redirect('/')

  get '/about' => 'pages#about'
  get '/contact' => 'pages#contact'
  get '/soon' => 'pages#soon'
  get '/timeline' => 'entries#index'

  root to: 'pages#splash'
end
