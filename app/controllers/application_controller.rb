class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  private
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  private
  def message_icon_status
    @message_icon_status = current_user.messages.where("state like ? AND (user_id::varchar != id_user_to OR COALESCE(id_user_to, '') = '')", "UNREAD").first
  end
  helper_method :message_icon_status


end
