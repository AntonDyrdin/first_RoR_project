class ProjectsController < ApplicationController
  def index
  	@projects = Project.order('created_at').all
  end

  def create
  	text=params[:text]
  	poject=params[:project]
    puts "new todo_"+text+" "+poject

    projectActiveRecord = Project.where(:title => poject)[0]

	  Todo.create(text: text, isCompleted: "false", project_id: projectActiveRecord.id)	
  end

  def update
  	todo_id=params[:todo_id]
  	isCompleted=params[:isCompleted]
    puts "todo_"+todo_id+": "+isCompleted

    todo = Todo.find(todo_id)
	todo.update(:isCompleted=> isCompleted)
  end

  def jsonarray
    response.headers["Content-Type"] = "application/json"
    response.content_type="application/json"
    response.body = Project.order('created_at DESC').all.to_json
  end
end
