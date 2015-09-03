class TrackingListsController < ApplicationController
  before_action :authenticate_user!
  def index
    @lists = TrackingList.all.page(params[:page])
  end
end
