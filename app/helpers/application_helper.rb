module ApplicationHelper
  def nav_bar(data)
    render partial: 'shared/paginate_bar', locals: { objects: data } if data.total_pages > 1
  end
end
