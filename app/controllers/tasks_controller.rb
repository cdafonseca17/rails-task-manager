class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params['id'].to_i)
  end

  def new
    # @task = Task.new IF YOU USE FORM
  end

  def create
    @task = Task.create(title: params['task']['title'], details: params['task']['details'])
  end

  def edit
    @task = Task.find(params['id'].to_i)
  end

  def update
    @task = Task.find(params['id'].to_i).update(task_params)
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path
  end

  private

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end
end
