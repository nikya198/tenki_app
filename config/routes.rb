Rails.application.routes.draw do
  root 'home#index'
  get 'home/get_cities'
  post 'home/index'
  # get 'home/get_cities'
  # get 'try/new'
end
