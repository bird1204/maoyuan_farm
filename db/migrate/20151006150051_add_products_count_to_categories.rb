class AddProductsCountToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :products_count, :integer, default: 0
    
    Category.pluck(:id).each do |i|
      Category.reset_counters(i, :products) # 全部重算一次
    end
  end
end
