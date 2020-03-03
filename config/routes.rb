Rails.application.routes.draw do
  root 'home#index'
  get 'home/get_cities'
  post 'home/search'
end
