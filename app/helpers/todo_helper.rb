module TodoHelper

  def get_todo_status(todo)
    Todo.statuses[todo.status]
  end

  def assignee_list
    User.all.where(id: @project.users.pluck(:id), type: 'Developer').map{|u| [u.name, u.id]}
  end

  def todo_statuses
    Todo.statuses.to_a.map{|status| status.reverse}
  end
end