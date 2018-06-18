Rails.application.routes.draw do

  devise_for :users
  
  resources :articles, only: %i[show update destroy create]

  resources :articles do
    resources :paragraphs, only: %i[create edit update destroy]
  end

  get '/error/:message', to: 'error#show', as: 'error'

  get '/user/:username', to: 'user#show', as: 'user_profile'
  post '/update_user', to: 'user#update', as: 'user_update'

  root 'welcome#index'
end
