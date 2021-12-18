class RemoveDiscordIdFromPosts < ActiveRecord::Migration[6.1]
  def change
    remove_column :posts, :discord_id, :string
  end
end
