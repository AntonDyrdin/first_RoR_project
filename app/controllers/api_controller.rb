class ApiController < ApplicationController
  def projects
    render json: Project.order('created_at').all
  end

  def todos
    render json: Todo.order('created_at DESC').all
  end

  def todo
  	todo = Todo.find(params[:id])
    render json: todo
  end

  def get_last_todo
  	todo = Todo.last(1)
    render json: todo
  end
end
