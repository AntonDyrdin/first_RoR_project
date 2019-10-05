class ProjectsController < ApplicationController
  def index
  	@projects = Project.all
  end

  def create	
  end

  def update
  end
end
