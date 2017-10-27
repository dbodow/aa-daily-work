class UsersController < ApplicationController

  before_action :require_logged_out

  def new
    render :new
  end

  def create
    user = User.new(user_params)
    if user.save
      login!(user)
      redirect_to cats_url
    else
      flash.now[:error] = "Invalid username / password"
      render :new
    end
  end

  def user_params
    params.require(:user).permit(:username, :password, :session_token)
  end
end
