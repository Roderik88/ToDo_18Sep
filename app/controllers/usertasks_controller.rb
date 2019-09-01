class UsertasksController < ApplicationController
  before_action :authenticate_user!
  def create

    @task = Task.find(params[:task_id])
    @usertasks = Usertask.new(task: @task, user: current_user,  completado: true)
    if @usertasks.save
      redirect_to tasks_path, notice: 'la tarea ha sido realizada'
    else
      redirect_to tasks_path, alert: 'la tarea no ha sido realizada'
    end
  end

  def destroy
    @task = Task.find(params[:task_id])
    @usertasks = Usertask.find_by(task: @task, user: current_user.id)
      @usertasks.destroy
        redirect_to tasks_path
      end

  def index
    @usertasks = current_user.usertasks
  end
end
