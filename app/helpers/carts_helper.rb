module CartsHelper
  def hello_message
    if current_user
      "會員：#{current_user.email.split('@').first} 您好！"
    else
      "非會員：您是會員嗎？請先登入"
    end
  end

  def cart_message(cart)
    "共購買 #{cart.total_unique_items} 項商品  運費共：$#{cart.shipping_cost}  消費總金額：$#{cart.total}"
  end

  def success_message(cart)
    "共購買&nbsp;<font size='4' color='#ff6666'>#{cart.total_unique_items}</font>&nbsp;項商品&nbsp;&nbsp;運費共：<font size='4' color='#ff6666'>$#{cart.shipping_cost}</font>&nbsp;&nbsp;消費總金額：<font size='4' color='#ff6666'>$#{cart.total}</font>".html_safe
  end
end
