class UsersController < ApplicationController

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.new(params_users)
    if @user.save
      login!(@user)
      redirect_to user_url(@user)
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def show
    @user = User.find_by(session_token: session[:session_token])
    if @user
      render :show
    else
      debugger
      redirect_to new_user_url
    end
  end

  private

  def params_users
    params.require(:user).permit(:username,:password)
  end
end
