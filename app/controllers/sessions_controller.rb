class SessionsController < ApplicationController
  def create
    @user = User.new_from_oauth auth_hash
    @user.save!
    self.current_user = @user
    redirect_to '/'
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end
end
