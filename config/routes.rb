Rails.application.routes.draw do
  devise_for :users
  resources :articles
  get '/about', to: 'index#about'
  root to: "index#home"
end
