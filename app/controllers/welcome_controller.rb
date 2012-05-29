class WelcomeController < ApplicationController
  def index
    p "--------------"
    p current_user
    p "--------------"
  end
end
