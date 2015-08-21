class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :active_page
  def active_page
    path = Rails.application.routes.recognize_path(request.env['PATH_INFO'])
    @controller = path[:controller]
    # action = path[:action]
    p @controller
  end
end
