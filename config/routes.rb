Rails.application.routes.draw do
  root :to => 'projects#index'
  post 'projects/create'
  post 'projects/update'
  get 'projects/seed'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
