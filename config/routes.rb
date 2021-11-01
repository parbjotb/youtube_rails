Rails.application.routes.draw do
  root to: "home#index"
  # this line below allows us to get to the about view where the data set description is
  get "/about", to: "home#about"
  # resources links to controller, only show the index and show pages
  resources :videos, only: %i[index show] do
    collection do
      get "search"
      # this will go over every video and allow the get search to happen
    end
  end
  resources :channel_creators, only: %i[index show]
  resources :categories, only: %i[index show]
  # get 'videos/index'
  # get 'videos/show'
  # get 'channel_creators/index'
  # get 'channel_creators/show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
