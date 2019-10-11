class ApiController < ApplicationController
  def projects
    render json: Project.all()
  end

  def todos
    render json: Todo.all()
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
