Rails.application.routes.draw do

  devise_for :users
  resources :topics do
  	resources :bookmarks
  end

  root to: 'topics#index'

end
