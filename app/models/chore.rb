class Chore < ActiveRecord::Base

belongs_to :child
belongs_to :task

validates_date :due_on

scope :by_task, joins(:task).order('tasks.name')
scope :chronological, -> { joins(:task).order('due_on, tasks.name') }
scope :pending, where(completed:false)
scope :done, -> { where(completed:true) }
scope :upcoming, where('due_on>=?', Date.today)
scope :past, where('due_on<?', Date.today)

def status
  if(completed==true)
    return "Completed"
  else
    return "Pending"
  end
end

end
