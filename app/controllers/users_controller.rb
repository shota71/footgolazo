class UsersController < ApplicationController
  before_action :forbid_login_user, { only: [:new, :create, :login_form, :login] }
  before_action :ensure_correct_user, { only: [:edit, :update, :show] }

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def update
    @user = User.find_by(id: params[:id])
    @user.user_name = params[:user_name]
    @user.d_id = params[:d_id]

    if @user.save
      flash[:notice] = "変更を保存しました"
      redirect_to("/users/#{@user.id}/edit")
    else
      flash[:notice] = "変更に失敗しました"
      render("users/edit")
    end
  end

  def create
    @user = User.new(user_name: params[:user_name], password: params[:password])
    if @user.save
      session[:user_id] = @user.id
      redirect_to("/posts/index")
      #失敗ならnewに戻る
    else
      @error_message = "空欄があります"
      render action: :new
    end
  end

  def login_form
  end

  def login
    @user = User.find_by(user_name: params[:user_name])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      flash[:notice] = "ログインしました"
      redirect_to("/posts/index")
    else
      @error_message = "メールアドレスまたはパスワードが間違っています"
      @email = params[:email]
      @password = params[:password]
      render action: :login_form
    end
  end

  def logout
    session[:user_id] = nil
    flash[:notice] = "ログアウトしました"
    redirect_to("/login")
  end

  def ensure_correct_user
    if @current_user.id != params[:id].to_i
      flash[:notice] = "権限がありません"
      redirect_to("/posts/index")
    end
  end

  def show
    @user = User.find_by(id: params[:id])
  end
end
