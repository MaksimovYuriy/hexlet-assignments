class TasksController < ApplicationController

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
    if @task.save
      redirect_to task_path(@task)
    else
      render :new
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])

    if @task.update(task_params)
      redirect_to task_path(@task)
    else
      render :edit
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
    params.require(:task).permit(:name, :description, :user_id, :status_id)
  end

  def user_params
    params.require(:task).require(:user).permit(:name)
  end

  def status_parms
    params.require(:task).require(:status).permit(:name)
  end

end
