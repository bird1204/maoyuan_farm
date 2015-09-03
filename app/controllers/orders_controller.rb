class OrdersController < ApplicationController
  before_action :authenticate_user!
  def new
    @order = Order.new
    @cart = current_user.cart
  end
  
  def create
    cart = current_user.cart
    order = Order.new(order_params.merge!(shippong_cost: cart.shipping_cost, amount: cart.total, payment_method_id: PaymentMethod.first.id))
    cart.shopping_cart_items.each do |items|
      order.order_details.build(product_id: items.item_id, quantity: items.quantity, amount: items.price.to_i)
    end
    
    if order.save!
      cart.clear
      redirect_to order_path(order)
    end
  end

  def show
    @order = Order.find(params[:id])
  end

  private

  def order_params
    params.require(:order).permit(:receiver, :phone, :address, :comment, :amount, :payment_method_id, :shipping_cost)
  end
end
