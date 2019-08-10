class ProjectManagersController < ApplicationController
  
  def dashboard
    @projects = current_user.projects.paginate(page: params[:page], per_page: 10)
  end
end
