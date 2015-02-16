Rails.application.routes.draw do

  resources :topics do
  	resources :bookmarks
  end

  root to: 'topics#index'

end
