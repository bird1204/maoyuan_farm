class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :active_page
  before_action :breadcomb
  def active_page
    path = Rails.application.routes.recognize_path(request.env['PATH_INFO'])
    @controller = path[:controller]
    @action = path[:action]
  end

  def breadcomb
    @path = "#{I18n.t "website.#{@controller}.head"} > #{I18n.t "website.#{@controller}.#{@action}"}"
  end

  def after_sign_in_path_for(resource)
    products_path
  end

  def after_sign_out_path_for(resource_or_scope)
    root_path
  end

  def after_sign_up_path_for(resource)
    products_path
  end
end
