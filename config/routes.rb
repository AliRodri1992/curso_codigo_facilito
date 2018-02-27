Rails.application.routes.draw do
  devise_for :users
  get 'articles/index'

  # get 'special', to:'welcome#index'
  resources :articles # :only, :except
=begin
    get '/articles'
    post '/articles'
    delete '/articles'
    get '/articles/:id'
    get '/articles/new'
    get '/articles/:id/edit'
    patch '/articles/:id'
    put '/articles/:id'
=end
  root 'welcome#index'
end
