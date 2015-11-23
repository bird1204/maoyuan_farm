class ServicesController < ApplicationController
  def create
    ServiceMailer.send_to_user(params[:user], params[:email], params[:message]).deliver_now!
    ServiceMailer.send_to_services(params[:user], params[:phone], params[:email], params[:message]).deliver_now!
    redirect_to services_path, notice: "你的留言已成功寄出"
  rescue StandardError => e
    redirect_to services_path, alert: "寄送失敗(#{e})"
  end
end
