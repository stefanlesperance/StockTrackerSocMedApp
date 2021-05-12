Rails.application.routes.draw do
  resources :user_stocks
  get 'users/my_portfolio'
  devise_for :users
  root 'home#index'
  get 'my_portfolio', to: 'users#my_portfolio'
  #This lets me create any route, period, it doesn't have to be a page. Remember that. I created this specificallyt to route to-
  # the one controller action.
  get 'search_stock', to: 'stocks#search'

end
