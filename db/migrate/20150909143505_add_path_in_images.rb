class AddPathInImages < ActiveRecord::Migration
  def change
    add_column :images, :path, :string
    add_index  :images, :product_id
  end
end
