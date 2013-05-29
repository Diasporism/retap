Retap::Application.routes.draw do
  root to: 'brews#index'
  get 'login' => 'sessions#new', :as => 'login'
  match 'logout', to: 'sessions#destroy', as: 'logout'
  match 'auth/:provider/callback', to: 'sessions#create'
  match 'auth/failure', to: redirect('/')

  resources :brews, except: [:index]
end
