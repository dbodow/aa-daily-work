class SessionsController < ApplicationController

  before_action :require_logged_out, except: [:destroy]

  def new
    render :new
  end

  def create
    user = User.find_by_credentials(params[:user][:username], params[:user][:password])
    if user
      user.reset_session_token! # This will only allow one device at a time
      login!(user)
      redirect_to cats_url
    else
      flash.now[:error] = "Invalid username / password combination."
      render :new
    end
  end

  def destroy
    logout!
    redirect_to cats_url
  end
end
