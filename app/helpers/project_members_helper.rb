module ProjectMembersHelper

  def user_list
    User.all.where.not(id: @project.users.pluck(:id), type: 'ProjectManager').map{|u| [u.name, u.id]}
  end

  def get_user_project( user_id, project)
    project.user_projects.where(user_id: user_id).first.id
  end
end