Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "users/registrations" }
  root to: 'tabis#top'
  get 'tabis/top', to: 'tabis#top', as: 'top_tabis'
  get 'tabis/mytabi', to: 'tabis#mytabi', as: 'mytabi_tabis'
  get 'tabis/index', to: 'tabis#index', as: 'index_tabis'
  get 'tabis/show/:id', to: 'tabis#show', as: 'show_tabis'
  post 'favorite/:id' => 'favorites#create', as: 'create_favorite'
  delete 'favorite/:id' => 'favorites#destroy', as: 'destroy_favorite'
  resources :tabis do
    resource :favorites, only: [:create, :destroy]
    collection do
      get 'search'
    end
  end
  get 'users/show', to: 'users#show', as: 'show_user'
  get 'users/account/:id', to: 'users#account', as: 'account_user'
  resources :users do
    get :favorites, on: :collection
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
