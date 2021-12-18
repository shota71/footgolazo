class ChangePostsColumns < ActiveRecord::Migration[6.1]
  def change
    change_column :posts, :user_id, "integer USING CAST(user_id AS integer)"
  end
end
