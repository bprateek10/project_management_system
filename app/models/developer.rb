class Developer < User
  
  #Associations
  has_many :todos, dependent: :destroy

  def self.get_todos_data
    data = {}
    self.all.each do |developer|
      data[developer.name] = developer.get_todo_details
    end
    data
  end
  
  def get_todo_details
    self.todos.select(:title, :status).group_by(&:status)
  end
end