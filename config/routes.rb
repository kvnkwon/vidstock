Vidstock::Application.routes.draw do
  devise_for :users
  get "pages/index"
  get 'tags/:tag', to: 'videos#index', as: :tag
  resources :videos do
    resources :comments
  end
  root to: 'pages#index'
end
