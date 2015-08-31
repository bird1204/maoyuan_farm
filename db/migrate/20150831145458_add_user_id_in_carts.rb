class AddUserIdInCarts < ActiveRecord::Migration
  def change
    add_column :carts, :user_id, :integer, index: true
  end
end
