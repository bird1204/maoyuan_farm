class CartsController < ApplicationController
  before_action :authenticate_user!
   skip_before_action :verify_authenticity_token,
  def index
    @cart = current_user.cart
    if params[:product_ids].present?
      params[:product_ids].each do |id|
        @cart.remove(@cart.items.find(id), @cart.shopping_cart_items.find_by_item_id(5).quantity)
      end
    end
  end

  def new
    @cart = current_user.cart || Cart.create
    @product = Product.find(params[:product_id])
    @cart.add(@product, @product.price, params[:product_amount])
    @cart.update_attributes(user_id: current_user.id)
    redirect_to carts_path
  end
end