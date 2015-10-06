ActiveAdmin.register Order do
menu parent: "訂單管理", label: '訂單'

form do |f|
  f.inputs "訂單" do
    f.input :receiver, label: '收件者'
    f.input :phone, label: '電話'
    f.input :address, label: '地址'
    f.input :amount, label: '金額'
    f.input :shipping_cost, label: '運費'
    f.input :payment_method, label: '付款方式'
    f.input :comment, label: '備註'
  end
  f.actions
end

index do
  selectable_column
  id_column
  column ('收件者') { |order| order.receiver }
  column ('聯絡電話') { |order| order.phone }
  column ('地址') { |order| order.address }
  column ('價格') { |order| order.amount }
  column ('運費') { |order| order.shipping_cost }
  column ('付款方式') do |order|
    order.payment_method.name
  end
  column ('建立日期') { |order| order.created_at }
  actions
end


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
