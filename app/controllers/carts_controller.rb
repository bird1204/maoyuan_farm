class CartsController < ApplicationController
  before_action :authenticate_user!
  def index
    @cart = current_user.cart
  end

  def new
    @cart = current_user.cart || Cart.create
    @product = Product.find(params[:product_id])
    @cart.add(@product, @product.price, params[:product_amount])
    @cart.update_attributes(user_id: current_user.id)
    redirect_to carts_path
  end
end
