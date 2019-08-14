class ProjectManagersController < ApplicationController
  
  def dashboard
    @projects = current_user.projects.paginate(page: params[:page], per_page: 10)
  end

  def developer_wise_data
    @developer_oriented_records = Developer.get_todos_data
  end

  def project_wise_data
    @project_oriented_records = Project.get_todos_data
  end
end
