class ApiController < ApplicationController
  def projects
    render json: Project.all()
  end
end
