class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :active_page
  before_action :breadcomb
  def active_page
    p "enter path : #{request.env['PATH_INFO']}"
    p "method : #{request.method}"
    return if request.env['PATH_INFO'].split('/').include?('admin')
    path = Rails.application.routes.recognize_path(request.env['PATH_INFO'], method: request.method.to_sym)
    @current_controller = path[:controller]
    @current_action = path[:action]
  end

  def breadcomb
    @path = "#{I18n.t "website.#{@current_controller}.head"} > #{I18n.t "website.#{@current_controller}.#{@current_action}"}"
  end

  def after_sign_in_path_for(resource)
    case resource
    when AdminUser
      admin_root_path
    else
      products_path
    end
  end

  def after_sign_out_path_for(resource_or_scope)
    case resource_or_scope
    when AdminUser
      admin_root_path
    else
      root_path
    end
  end

  def after_sign_up_path_for(resource)
    products_path
  end
end
