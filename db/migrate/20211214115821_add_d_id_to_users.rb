class AddDIdToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :d_id, :string
  end
end
