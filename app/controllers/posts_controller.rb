class PostsController < ApplicationController
  before_action :authenticate_user, { only: [:new] }
  before_action :set_q, only: [:index, :search]

  def index
    @posts = Post.page(params[:page]).per(8).order("created_at DESC")
  end

  def show
    #id取得
    @id = params[:id]

    @post = Post.find_by(id: params[:id])
  end

  def new
    @post = Post.new
  end

  #投稿データ受け取り・保存
  def create
    #名前、ID、タグ、コンテンツ受け取り
    @post = Post.new(name: @current_user.user_name, d_id: params[:d_id],
                     tag: params[:tag], content: params[:content],
                     user_id: @current_user.id)
    #保存
    #成功なら保存
    if @post.save
      redirect_to("/posts/index")
      #失敗ならnewに戻る
    else
      @error_message = "＊は必須項目です"
      render action: :new
    end
  end

  def search
    #結果を変数に代入
    @results = @q.result
    #結果を上から新しい順にソート
    @posts = @results.page(params[:page]).per(8).order("created_at DESC")
  end

  private

  def set_q
    @q = Post.ransack(params[:q])
  end
end
