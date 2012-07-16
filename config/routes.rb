Barcampnola5::Application.routes.draw do
  resources :accounts
  resources :entries
  resources :tags
  resources :sessions, only: [:new, :create, :destroy]

  match '/auth/:provider/callback', to: "sessions#create"
  match 'signout', to: 'sessions#destroy', as: 'signout'
  match 'auth/failure', to: redirect('/')

  get "about" => "pages#about"
  get "splash" => "pages#splash"
  get "timeline" => "entries#index"
  get "soon" => "pages#soon"
  root to: 'pages#splash'
end
