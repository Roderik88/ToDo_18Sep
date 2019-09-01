class TasksController < ApplicationController
  def index
    @task = Task.all
  end

  def details
    @tasks = Task.all
    @usertasks = Usertask.find_by(task: @task, user: current_user.id)
  end
end
