class CreateNewsCategories < ActiveRecord::Migration
  def change
    create_table :news_categories do |t|
      t.string :name, null: false
      t.string :description, null: false, default: ''
      t.timestamps null: false
    end
  end
end
