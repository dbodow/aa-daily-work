class Api::SessionsController < ApplicationController
  def create
    @user = User.find_by_credentials(user_params[:username], user_params[:password])
    if @user
      render 'api/users/show'
    else
      render json: { session: ['Invalid username and password.'] }
    end
  end

  def destroy
    if logged_in?
      logout!
      render json: {}
    else
      render status: 404
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
