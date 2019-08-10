class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :user_projects, dependent: :destroy
  has_many :projects, through: :user_projects


  scope :developers, -> { where(type: GlobalConstants::DEVELOPER) }
  scope :project_maanagers, -> { where(type: GlobalConstants::PROJECT_MANAGER) }


  def name
    self.first_name + ' ' + self.last_name
  end

  def developer?
    self.type == GlobalConstants::DEVELOPER
  end

  def project_manager?
    self.type == GlobalConstants::PROJECT_MANAGER
  end
end
