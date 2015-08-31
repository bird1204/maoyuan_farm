class CreateTrackingLists < ActiveRecord::Migration
  def change
    create_table :tracking_lists do |t|
      t.integer :user_id, index: true
      t.integer :product_id, index: true
      t.timestamps null: false
    end
  end
end
