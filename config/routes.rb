Rails.application.routes.draw do
  root 'top#index'
  get 'search' => 'top#search'
end
