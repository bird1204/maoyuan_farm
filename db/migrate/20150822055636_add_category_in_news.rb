class AddCategoryInNews < ActiveRecord::Migration
  def change
    add_column :news, :category, :string
    add_index :news, :category
  end
end
