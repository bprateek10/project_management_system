class Developer < User
  
  #Associations
  has_many :todos, dependent: :destroy
end