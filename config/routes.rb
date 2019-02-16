Rails.application.routes.draw do
  mount ForestLiana::Engine => '/forest'
  root to: 'content#index'
  resources :content, only: [:index, :create, :destroy]
  get 'about', :to => 'pages#about'
  get 'privacy', :to => 'pages#privacy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
