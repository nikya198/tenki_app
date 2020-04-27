Rails.application.routes.draw do
  root 'home#index'
  get 'home/get_cities'
  get  '/search',    to: 'home#search'
end
