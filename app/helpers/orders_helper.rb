module OrdersHelper
  def hello_message
    if current_user
      "會員：#{current_user.email.split('@').first} 您好！"
    else
      "非會員：您是會員嗎？請先登入"
    end
  end
end
