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
    
  end

  def index
    @usertasks = current_user.usertasks
  end
end
