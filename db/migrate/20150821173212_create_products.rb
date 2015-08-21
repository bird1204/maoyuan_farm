class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name, null: false, index: true
      t.integer :category_id, index: true
      t.string :description
      t.integer :price, null: false
      t.integer :stock, null: false, defaulf: 1
      t.string :comment
      t.timestamps null: false
    end
  end
end
