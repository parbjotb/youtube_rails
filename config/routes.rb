Rails.application.routes.draw do
  # resources links to controller, only show the index and show pages
  resources :videos, only: %i[index show]
  resources :channel_creators, only: %i[index show]
  # get 'videos/index'
  # get 'videos/show'
  # get 'channel_creators/index'
  # get 'channel_creators/show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
