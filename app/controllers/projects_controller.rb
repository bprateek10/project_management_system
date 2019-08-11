class ProjectsController < ApplicationController

  before_action :set_project, only: [:destroy, :statistics]

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

  def statistics
    gon.new_todos = @project.todos.where(status: 'new_todo').count
    gon.in_progress_todos = @project.todos.where(status: 'in_progress').count
    gon.done_todos = @project.todos.where(status: 'done').count
    gon.project = @project.title
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
