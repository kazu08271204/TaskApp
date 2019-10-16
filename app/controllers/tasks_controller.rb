class TasksController < ApplicationController
  
    def new
    end
    
    
    def index
      @tasks = Task.all #Task.allで取得したtasksテーブルの全データを代入した@tasksインスタンス変数
                        #@tasksインスタンス変数（配列）をビューで使い、タスク内容を一覧表示
      
    end
  
    def show 
      @task = Task.find(params[:id]) #findメソッドは引数にidの値となる数値を指定することで、その値を持つデータを取得することができる。
                                     
    end
end