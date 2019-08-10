class ProjectsController < ApplicationController

  before_action :set_project, only: [:destroy]

  def new
    @project = Project.new
  end

  def create
    @project = current_user.projects.create(project_params)
    if @project.persisted?
      redirect_to root_path, notice: 'Project was successfully created.'
    else
      render :new
    end
  end

  def destroy
    @project.destroy
    redirect_to root_path, notice: 'Project was successfully deleted.'
  end

  private

  def set_project
    @project = Project.find_by_id(params[:id])
    return false if @project.nil?
  end

  def project_params
    params.require(:project).permit(:title)
  end
  
end
