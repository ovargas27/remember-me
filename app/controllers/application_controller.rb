class ApplicationController < ActionController::Base
  before_filter :current_user
  protect_from_forgery

  def current_user=(user)
    session[:user_id] = user.id
  end

  def current_user
    user_id = session[:user_id]
    @current_user ||= User.find user_id
  end
end
