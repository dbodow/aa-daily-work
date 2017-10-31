class SessionsController < ApplicationController

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.find_by_credentials(params[:user][:username], params[:user][:password])
    if @user
      login!(@user)
      redirect_to user_url(@user)
    else
      @user = User.new
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end

  private

  def params_users
    params.require(:user).permit(:username,:password)
  end
end
