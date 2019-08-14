class Project < ApplicationRecord

  #Associations
  has_many :user_projects, dependent: :destroy
  has_many :users, through: :user_projects
  has_many :todos, dependent: :destroy

  #Validations
  validates :title, presence: true
  validates :title, uniqueness: true

  #Instance Methods
  
  def developers
    self.users.developers
  end


  def self.get_todos_data
    data = {}
    self.all.each do |project|
      data[project.title] = project.get_todo_details
    end
    data
  end

  def get_todo_details
    self.todos.select(:title, :status).group_by(&:status)
  end
end
