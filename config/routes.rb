Vidstock::Application.routes.draw do
  devise_for :users
  get "pages/index"
  resources :videos do
    resources :comments
  end
  root to: 'pages#index'
end
