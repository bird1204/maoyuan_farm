class CreateOrderDetails < ActiveRecord::Migration
  def change
    create_table :order_details do |t|
      t.integer :order_id, index: true, null: false
      t.integer :product_id, index: true, null: false
      t.integer :quantity, index: true # 數量 
      t.integer :amount, index: true # 小計
      t.timestamps null: false
    end
  end
end
