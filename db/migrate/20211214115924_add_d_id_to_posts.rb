class AddDIdToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :d_id, :string
  end
end
