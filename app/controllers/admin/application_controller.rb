class Admin::ApplicationController < ApplicationController
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  layout 'admin'

  rescue_from MyException::NotAuthorized, with: :user_not_authorized
  before_action :check_authorization

  private

  def check_authorization
    if not (current_player != nil and current_player.admin?)
      raise MyException::NotAuthorized
    end
  end

  def user_not_authorized
    render :file => "public/401", :status => :unauthorized, :layout => false
  end
end
