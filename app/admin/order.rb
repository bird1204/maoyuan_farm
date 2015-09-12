ActiveAdmin.register Order do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if resource.something?
#   permitted
# end

menu parent: "Order megt."

show do 
  attributes_table do
    row :id
    row ('建立日期') { |order| order.created_at }
    row ('收件者') { |order| order.receiver }
    row ('聯絡電話') { |order| order.phone }
    row ('地址') { |order| order.address }
    row ('價格') { |order| order.amount }
    row ('運費') { |order| order.shipping_cost }
    row ('付款方式') do |order|
      order.payment_method
    end

    # table_for order.order_details do
      # column('2312', :product_id)
      # column :product_id { |od| od.product.name }
    # end    

    table_for order.order_details do
      column ('產品名稱') { |od| od.product.name }
      column ('數量') { |od| od.quantity }
      column ('小計') { |od| od.quantity * od.product.price }
    end
  end
end


end
