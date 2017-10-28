class UsersController < ApplicationController
  before_action :require_logged_out, only: [:new, :create]
  before_action :require_logged_in, only: [:show]

  def new
    render :new
  end

  def create
    user = User.new(user_params)
    if user.save
      login!(user)
      redirect_to user_url(user.id)
    else
      flash.now[:errors] = user.errors.full_messages
      render :new
    end
  end

  def show
    render :show
  end

  def user_params
    params.require(:user).permit(:email, :session_token, :password)
  end
end
