class CreateTodos < ActiveRecord::Migration[5.2]
  def change
    create_table :todos do |t|
      t.integer :developer_id, foreign_key: true, index: true
      t.references :project, foreign_key: true, index: true
      t.string :title
      t.string :status

      t.timestamps
    end
  end
end
