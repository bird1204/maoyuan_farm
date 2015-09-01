module ApplicationHelper
  def paginate_bar(data)
    render partial: 'shared/paginate_bar', locals: { objects: data } if data.total_pages > 1
  end
  def logo_link_to(text, path, option={})
    content_tag(:p, link_to(text, path, option), class: "active") unless current_page?('entrys')
  end
  def head_link_to(text, path)
    content_tag(:li, link_to(text, path), class: "active") if current_page?(path)
  end
  def active_link_to(text, path)
    content_tag(:li, link_to(text, path), class: class_name(path))
  end
  def class_name(controller)
    "active" if current_page?(controller)
  end
  def current_page?(controller)
    controller = 'entrys' if controller == '/'
    controller.include?(@current_controller)
  end
  def user_nav_bar
    render partial: 'shared/user_nav_bar' unless current_page?('entrys')
  end
  def shop_nav_bar
    render partial: 'shared/shop_nav_bar' if current_page?('products')
  end
end
