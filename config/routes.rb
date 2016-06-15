Rails.application.routes.draw do

  post 'session/create'
  get 'session/login'
  delete 'session/logout'

  resources :users
  resources :posts do
    resources :comments
  end

  root 'posts#index'
end
