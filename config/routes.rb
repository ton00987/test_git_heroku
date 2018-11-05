Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :movies
  root :to => redirect('/movies')
  get 'login', to: redirect('/auth/github')
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'logout' => 'sessions#destroy'
  get 'auth/failure' => 'sessions#failure'
end