class TasksController < ApplicationController

  before_action :find_task, only: [:show, :edit, :update, :update]

  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.save
    redirect_to tasks_path(@task)
  end

  def edit;end



end

private

def find_task
  @task = Task.find(params[:id])
end

def task_params
    params.require(:task).permit(:title, :details, :completed)
  end
