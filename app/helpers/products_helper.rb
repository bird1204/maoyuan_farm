module ProductsHelper
  def breadcomb_bar(index)
    render partial: 'shared/breadcomb', locals: {path: @path} if index == 0
  end

  def header_message(data, class_name, style, index)
    if index == 0
      content_tag(:span, message(data), class: class_name.to_sym, style: style.to_sym)
    else
      content_tag(:span, message(data), class: class_name.to_sym)      
    end
  end

  def header_title(index)
    "<h2>線上購物</h2>".html_safe  if index == 0
  end

  def message(data)
    if data.present?
      data.category.name
    else
      "沒有這項商品，請再搜尋一次"
    end
  end
end
