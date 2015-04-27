Rails.application.routes.draw do

  devise_for :users
  resources :topics do
  	resources :bookmarks
  end

  post :incoming, to: 'incoming#create'

  root to: 'topics#index'

end
