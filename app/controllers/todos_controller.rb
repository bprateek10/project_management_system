class TodosController < ApplicationController

  before_action :set_project
  before_action :set_todo, only: [:destroy, :update, :edit]

  def index
    @todos = current_user.project_manager? ? @project.todos :  @project.todos.where(user_id: current_user.id)
  end

  def new
    @todo = Todo.new
  end

  def create
    todo = @project.todos.new(todo_params)
    if todo.save
      redirect_to project_todos_path(@project.id), notice: 'Todo was successfully created!'
    else
      render :new
    end
  end

  def edit
    
  end

  def update
    if @todo.update(todo_params)
      redirect_to project_todos_path(@project.id), notice: 'Todo Status Updated!'
    else
      render :edit
    end
  end

  def destroy
    @user_project.destroy
    redirect_to project_project_members_path(@project.id), notice: 'Member was successfully removed.'
  end

  private

  def set_project
    @project = Project.find(params[:project_id])
    return false if @project.blank?
  end

  def set_todo
    @todo = Todo.find_by_id(params[:id])
    return false if @todo.nil?
  end

  def todo_params
    params.require(:todo).permit(:title, :user_id, :status)
  end

end