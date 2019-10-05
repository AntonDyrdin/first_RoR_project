class Project < ApplicationRecord
	has_many :todos
	todos=[]
end
