Rails.application.routes.draw do
  mount ForestLiana::Engine => '/forest'
  root to: 'pages#home'
  resources :content, only: [:index, :create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
