class ApiController < ApplicationController
  def projects
    render json: Project.all()
  end

  def todos
    render json: Todo.all()
  end
end
