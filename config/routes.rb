Barcampnola5::Application.routes.draw do
  resources :accounts
  resources :entries
  resources :sessions, only: [:new, :create, :destroy]
  get 'about' => 'pages#about'
  get 'contact' => 'pages#contact'

  match '/auth/:provider/callback', to: "sessions#create"
  match 'signout', to: 'sessions#destroy', as: 'signout'
  match 'auth/failure', to: redirect('/')

  get "timeline" => "entries#index"
  get "soon" => "pages#soon"
  root to: 'pages#splash'
end
