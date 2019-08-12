class Project < ApplicationRecord

  #Associations
  has_many :user_projects, dependent: :destroy
  has_many :users, through: :user_projects
  has_many :todos, dependent: :destroy

  #Validations
  validates :title, presence: true

  #Instance Methods
  
  def developers
    self.users.developers
  end
end
