Rails.application.routes.draw do
  devise_for :users
  resources :articles do
    # :only, :except
    resources :comments, only: [:create, :destroy, :update]
  end
  root 'welcome#index'
end
