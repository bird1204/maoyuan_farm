class NewsController < ApplicationController
  before_action :init_category
  def index
    @news = New.select('created_at, title, id')
    @news = @news.where(category: params[:type]) if params[:type].present?
    @news = @news.page(params[:page])
    @title = params[:type] || '最新消息'
  end

  def show
    @new = New.find(params[:id])
  end

  private

  def init_category
    @categories = New.group(:category).count
  end
end
