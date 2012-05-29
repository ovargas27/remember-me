class SessionsController < ApplicationController
  def create
    @user = User.new_from_oauth auth_hash
    @user.save!
    p "====================="
    p auth_hash.info
    p @user.access_token
    p @user.refresh_token
    p "........................"
    #p @user.calendars
    p "====================="

    self.current_user = @user
    redirect_to '/'
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end
end
