require 'will_paginate/array'
class ProductsController < ApplicationController
  # before_action :authenticate_user!
  before_action :init_category

  def index
    @products = []
    @categories.each { |category| @products << category.products }
    if params[:type]
      @products.clear
      @products << Product.where(category_id: params[:type])
    end

    if params[:query_string]
      @products.clear
      @products << Product.where('name like ?', "%#{params[:query_string]}%")
    end

    @products = @products.paginate(page: params[:page], per_page: 2)
  end
  
  def show
    @product = Product.find(params[:id])
    @products = Product.where(category_id: @product.category_id)
  end

  private

  def init_category
    @categories = Category.select('id, name, products_count')
    @categories = @categories.includes(:products) unless params[:type]
  end
end
