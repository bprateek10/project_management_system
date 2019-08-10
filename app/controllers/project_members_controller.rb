class ProjectMembersController < ApplicationController

  before_action :set_project
  before_action :set_user_project, only: [:destroy]

  def index
    @project_members = @project.developers
  end
  
  def new
    @user_project = UserProject.new
  end
  
  def create
    user_project = @project.user_projects.new(project_members_params)
    if user_project.save
      redirect_to project_project_members_path(@project.id), notice: 'Member added to project!'
    else
      render :new
    end
  end


  def destroy
    @user_project.destroy
    redirect_to project_project_members_path(@project.id), notice: 'Member was successfully removed.'
  end


  private

  def set_project
    @project = Project.find_by_id(params[:project_id])
    return false if @project.nil?
  end

  def set_user_project
    @user_project = UserProject.find_by_id(params[:id])
    return false if @user_project.nil?
  end

  def project_members_params
    params.require(:user_project).permit(:user_id)
  end

end