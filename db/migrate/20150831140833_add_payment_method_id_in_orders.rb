class AddPaymentMethodIdInOrders < ActiveRecord::Migration
  def change
    add_column :orders, :payment_method_id, :integer, index: true 
  end
end
