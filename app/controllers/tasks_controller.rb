class TasksController < ApplicationController
  def index
    @task = Task.all
  end

  def show
    @task = Task.find(params[:id])
    @ranking5 = Usertask.limit(5).where(task_id: @task.id).order(created_at: :asc)
    @users_todo_finish = Usertask.all.where(task_id: @task.id).order(created_at: :asc)
  end
end
