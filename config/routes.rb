Rails.application.routes.draw do
  root 'home#index'
  get 'home/get_cities'
  get 'home/search'
end
