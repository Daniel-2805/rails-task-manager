class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new # needed to instantiate the form_for
  end

  def create
    @task = Task.new(task_params)
    @task.save
  # Will raise ActiveModel::ForbiddenAttributesError
  # no need for app/views/restaurants/create.html.erb
    redirect_to tasks_path   #  se dirige al index
  #  redirect_to task_path(@task)   para el show porque su URI Pattern 
  #  en la terminal es /tasks/:id en cambio el del index es /tasks solamente sin :id
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.update(task_params)
     # no need for app/views/restaurants/update.html.erb
    redirect_to task_path(@task)  #  se dirige al show
  end

  private

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end
end
