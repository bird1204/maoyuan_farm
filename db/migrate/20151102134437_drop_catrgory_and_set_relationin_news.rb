class DropCatrgoryAndSetRelationinNews < ActiveRecord::Migration
  def change
    remove_column :news, :category
    add_column :news, :news_category_id, :integer
    add_index :news, :news_category_id
  end
end
