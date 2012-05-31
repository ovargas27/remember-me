class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_or_create_from_oauth(auth_hash)

    if @user
      self.current_user = @user
      flash[:notice] = "Congrats! You are logged"
    else
      flash[:alert] = ""
    end

    redirect_to '/'
  end

  def destroy
    self.current_user = nil
    redirect_to root_url
  end

  def failure
    redirect_to login_url, notice: "Loging failed, please try again"
  end

  protected

  def auth_hash
    p "que pets!"
    request.env['omniauth.auth']
  end
end
