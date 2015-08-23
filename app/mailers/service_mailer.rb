class ServiceMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.service_mailer.send_mail.subject
  #
  def send_to_user(user, mail_address, comment)
    @greeting = "Hi, #{user}"
    @comment = comment
    @subject = '我們已經收到你的疑問'
    mail to: mail_address, subject: @subject
  end

  def send_to_services(user, phone, mail_address, comment)
    @user = user
    @comment = comment
    @subject = '收到一則客戶留言'
    @phone = phone
    mail to: "g87110711@gmail.com", subject: @subject
  end
end
