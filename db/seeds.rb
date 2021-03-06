# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
data = HashWithIndifferentAccess.new(YAML::load_file(File.join(Rails.root, 'test', 'seeds.yml')))

data[:projects].each do |projectRec|
	puts projectRec
	p = Project.new(title: projectRec[:title])
	p = Project.create(:title => projectRec[:title])
	projectRec[:todos].each do |todoRec|
		puts todoRec
		todo=Todo.new(text: todoRec[:text],isCompleted: todoRec[:isCompleted], project_id: p.id)
		p.todos.push(todo)
	end
	p.save!
end
