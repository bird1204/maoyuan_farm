class TrackingListsController < ApplicationController
  before_action :authenticate_user!
  before_action :init_tracking_lists, only: [:index, :destroy]
  def index
  end

  def create
    current_user.tracking_lists.find_or_initialize_by(product_id: params[:product_id]).save!
    redirect_to :back, notice: "成功加入一筆商品至追蹤清單"
  end

  def destroy
    if params[:id] == "all"
      current_user.tracking_lists.destroy_all
    else
      current_user.tracking_lists.find(params[:id]).destroy!
    end

    respond_to do |format|
      format.html { render layout: false }
    end
  end

  private

  def init_tracking_lists
    @tracking_lists = current_user.tracking_lists.recent.includes(:product).page(params[:page])
  end
end
