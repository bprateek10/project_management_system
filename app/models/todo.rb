class Todo < ApplicationRecord
  belongs_to :user
  belongs_to :project

  after_initialize :set_default_status, if: :new_record?

  enum status: {
    new_todo: "New",
    in_progress: "In Progress",
    done: "Done"
  }

  private

  def set_default_status
    self.status = Todo.statuses[:new_todo]
  end
end
