class TasksController < ApplicationController
  before_action :set_user
  
    def new
      @task = Task.new
    end
    
    
    def index
      @tasks = @user.tasks
      
    end
  
    def show 
     @task = @user.tasks.find(params[:id])#@userのtasksテーブルの一つのtaskのid
     
    
    end
    
    def create
    @task = @user.tasks.build(task_params)
    @task.save
      if flash[:success] = "タスクを新規作成しました。"
      redirect_to user_tasks_url @user
      else
      render :new
      end
    end  
    def  edit
      @task = @user.tasks.find(params[:id])
    end
  
    def update
     @task = @user.tasks.find(params[:id])  
     @task.update(task_params)
     redirect_to user_tasks_url # 一覧ページ（index)にリダイレクト
    
    end
    private
    
     def task_params
      params.require(:task).permit(:contentname,:content)
     end
    
    def set_user
      @user = User.find(params[:user_id]) #ユーザーモデルから一つのユーザーidを取り出す
    end
end    
