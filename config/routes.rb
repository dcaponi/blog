Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  devise_for :users
  resources :articles do
    resources :comments #add nested routes e.g. articles/:id/comments/:id
  end
  get '/about', to: 'index#about'
  get '/apps', to: 'index#apps'
  get '/photos', to: 'index#photos'
  get 'search', to: 'search#search'
  root to: "index#home"
  mount ActionCable.server => '/cable'
end
