class NewsController < ApplicationController
  before_action :init_category
  def index
    @title = '最新消息'
    @news = New.select('created_at, title, id').order('id desc')
    if params[:type].present?
      category = NewsCategory.find(params[:type])
      @news = category.hot_news
      @title = category.name
    end
    @news = @news.page(params[:page])
  end

  def show
    @new = New.find(params[:id])
  end

  private

  def init_category
    @categories = New.group(:news_category).count
  end
end
