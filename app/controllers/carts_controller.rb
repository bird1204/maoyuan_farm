class CartsController < ApplicationController
  before_action :authenticate_user!
  before_action :init_cart, except: [:new]

  def index
  end

  def new
    @cart = current_user.cart || Cart.create(user_id: current_user.id)
    @product = Product.find(params[:product_id])
    @cart.add(@product, @product.price, params[:product_amount].to_i)
    redirect_to carts_path
  end

  def destroy
    if params[:product_id].present?
      id = params[:product_id].to_i
      @cart.remove(@cart.items.find(id), @cart.shopping_cart_items.find_by_item_id(id).quantity)
    else
      @cart.clear
    end

    respond_to do |format|
      format.html { render layout: false }
    end
  end

  def update
    product = Product.find(params[:product][:id])
    @cart.add(product, product.price, params[:product][:product_amount].to_i, false)

    respond_to do |format|
      format.html { render layout: false }
    end
  end

  private

  def init_cart
    @cart = current_user.cart
  end
end