class ApplicationController < ActionController::Base

  helper_method :current_user

  private

  def current_user=(user)
    if user
      session[:user_id] = user.id
    else
      session[:user_id] = nil
    end
  end

  def current_user
    user_id = session[:user_id]
    @current_user ||= User.find user_id if user_id
  end

end
