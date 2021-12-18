class User < ApplicationRecord
  has_secure_password

  validates :user_name, presence: true
  validates :password, presence: true, on: :create

  #ユーザーの投稿を全て取得
  def posts
    return Post.where(user_id: self.id)
  end
end
