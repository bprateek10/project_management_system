class Developer < User
  has_many :todos, dependent: :destroy
end