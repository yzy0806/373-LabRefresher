class Child < ActiveRecord::Base

has_many :chores
has_many :tasks,through: :chores

validates_presence_of :first_name, :last_name

def  name
  first_name + " "+ last_name
end

scope :alphabetical, -> {order('last_name,first_name')}

scope :active, ->{where(active:true)}

def points_earned
  self.chores.done.inject(0){|sum,chore| sum += chore.task.points}
end

end
