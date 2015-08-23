# Preview all emails at http://localhost:3000/rails/mailers/service_mailer
class ServiceMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/service_mailer/send_mail
  def send_mail
    ServiceMailer.send_mail
  end

end
