class WelcomeController < ApplicationController
  before_filter :authenticate_user!

  def index
  end

  def authenticate_user!
    redirect_to login_path unless current_user
  end
end
