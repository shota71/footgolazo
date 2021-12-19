class ApplicationController < ActionController::Base
  before_action :set_current_user

  #ログインしているユーザの取得
  def set_current_user
    @current_user = User.find_by(id: session[:user_id])
  end

  #ログインしていない場合のメッセージ
  def authenticate_user
    if @current_user == nil
      flash[:notice] = "ログインが必要です"
      redirect_to("/login")
    end
  end

  #ログインしている場合のメッセージ
  def forbid_login_user
    if @current_user
      flash[:notice] = "すでにログインしています"
      redirect_to("/posts/index")
    end
  end
end
