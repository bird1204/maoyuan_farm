class TrackingListsController < ApplicationController
  before_action :authenticate_user!
  def index
    @tracking_lists = current_user.tracking_lists.includes(:product).page(params[:page])
  end

  def create
    current_user.tracking_lists.build(product_id: params[:product_id]).save!
    redirect_to :back, notice: "成功加入一筆商品至追蹤清單"
  end

  def destroy

  end
end
