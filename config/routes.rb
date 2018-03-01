Rails.application.routes.draw do
  resources :categories

  devise_for :users
  resources :articles do
    # :only, :except
    resources :comments, only: [:create, :destroy, :update, :show]
  end
  root 'welcome#index'
end
