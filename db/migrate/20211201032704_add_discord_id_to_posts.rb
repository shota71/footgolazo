class AddDiscordIdToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :discord_id, :string
  end
end
