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
    @task = Task.new(title: params['task']['title'], details: params['task']['details'])
    @task.save
  end
end
