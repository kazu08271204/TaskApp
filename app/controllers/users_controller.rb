class UsersController < ApplicationController
  #before_action :set_user
  before_action :logged_in_user, only:[:index, :show, :edit, :update, :destroy]
  
  
  def index
    @users = User.all
    #全てのユーザーを代入した複数形であるため@users
    #ページネーションを判定できるオブジェクトに置き換え
    @users = User.paginate(page: params[:page])
    #paginateではキーが:pageで値がページ番号のハッシュを引数にとる
    #User.paginateは:pageパラメータに基づき、データベースからひとかたまりのデータを取得
  end
  
  
  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = '新規作成に成功しました。'
      redirect_to @user
    else
      render :new
    end
  end

  #edit->編集ページの表示
  def edit #特定データの取得
    @user = User.find(params[:id])
  end


  def update
     @user = User.find(params[:id]) 
    if@user.update(user_params)
       flash[:success] = "ユーザー情報を更新しました"
       redirect_to @user
    else
      render :edit
    end
  end
  
  def destroy
    @user = User.find(params[:id]) 
    @user.destroy
    flash[:success] = "#{@user.name}のデータを削除しました。"
    #ActiveRecordのdestroyメソッドを使ってデータを削除しユーザー一覧ページにリダイレクト
    redirect_to users_url
  end
     
  
  
  
  private
  
    #def set_user
      #@user = User.find(params[:id])
    #end
  
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
    
    # ログイン済みのユーザーか確認します。
    def logged_in_user
      #unlessは条件式がfalseの場合のみ記述した処理が実行される構文
      unless logged_in?
      flash[:danger] = "ログインしてください。"
      redirect_to login_url
      end
    end
end
