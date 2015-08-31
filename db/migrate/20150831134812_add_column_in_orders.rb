class AddColumnInOrders < ActiveRecord::Migration
  def change
    add_column :orders, :receiver, :string, index: true
    add_column :orders, :phone, :string, index: true
    add_column :orders, :address, :string, index: true
    add_column :orders, :amount, :integer, index: true, null: false
    add_column :orders, :comment, :text, index: true
  end
end
