class CreateUserProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :user_projects do |t|
      t.references :user, index: true
      t.references :project, index: true
    end
  end
end
