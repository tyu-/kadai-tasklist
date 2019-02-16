class TasksController < ApplicationController
  before_action :require_user_logged_in
  before_action :check_current_users_task, only: [:show,:edit,:destroy]
  
    def index
        @tasks = Task.all.page(params[:page]).per(5)
    end
    
    def show
        @task = Task.find(params[:id])
    end
    
    def new
        @task = Task.new
    end
    
    def create
        @task = current_user.tasks.build(task_params)
        
        if @task.save
            flash[:success] = 'タスクが正常に追加されました'
            redirect_to root_url
        else
            flash.now[:danger] = 'タスクが追加されませんでした'
            render:new
        end
        
    end
    
    def edit
        @task = Task.find(params[:id])
    end
    
    def update
        @task = Task.find(params[:id])
        
        if @task.update(task_params)
            flash[:success] = 'taskは正常に更新されました'
            redirect_to root_url
        else
            flash.now[:danger] = 'taskは更新されませんでした'
            render :edit
        end
    end
    
    def destroy
        @task = Task.find(params[:id])
        @task.destroy
        
        flash[:success] = 'taskは正常に削除されました'
        redirect_to root_url
    end
    
    private
    def task_params
        params.require(:task).permit(:content,:term,:finish,:status)
    end
    
    def check_current_users_task
        if current_user.id != Task.find_by(id: params[:id]).user_id
            flash[:danger] = 'ほかのユーザのタスクのCRUDは禁止です！'
            redirect_to root_url
        end
    end
    
end
