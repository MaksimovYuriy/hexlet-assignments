class TasksController < ApplicationController
  def index
    @tasks = Task.order(created_at: :desc)
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)

    if @task.save
      redirect_to task_path(@task)
    else
      render :new
    end
  end

  def show
    @task = Task.find(params[:id])
  end
  
  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])

    if @task.update(edit_task_params)
      redirect_to task_path(@task)
    else
      render :new
    end
  end

  def destroy
    @task = Task.find(params[:id])
    if @task.destroy
      redirect_to tasks_path
    else
      redirect_to task_path(@task)
    end
  end

  private 

  def task_params
    params.require(:task).permit(:name, :description, :creator)
  end

  def edit_task_params
    params.require(:task).permit(:name, :description, :status, :creator, :completed)
  end
end