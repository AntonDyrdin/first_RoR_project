Rails.application.routes.draw do
  root :to => 'projects#index'
  post 'projects/create'
  post 'projects/update'

  get 'api/projects'
  get 'api/todos'
  get 'api/todo:id', action: :todo, controller: 'api'
  get 'api/last_todo', action: :get_last_todo, controller: 'api'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
