class ProjectsController < ApplicationController
  def index
  	@projects = Project.all
  end

  def create	
  end

  def update
  	todo_id=params[:todo_id]
  	isCompleted=params[:isCompleted]
    puts "todo_"+todo_id+": "+isCompleted

    todo = Todo.find(todo_id)
	todo.update(:isCompleted=> isCompleted)
  end

  def seed
  	system("rails db:seed")
  end
end
