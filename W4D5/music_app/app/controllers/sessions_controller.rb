class SessionsController < ApplicationController
  before_action :require_logged_out, only: [:new, :create]

  def new
    render :new
  end

  def create
    user = User.find_by_credentials(params[:user][:email],
                                    params[:user][:password])
    # fail
    if user
      # user.reset_session_token! # limit logon to one device
      login!(user)
      redirect_to user_url(user.id)
    else
      flash.now[:errors] = ["Invalid username/password combination"]
      render :new
    end
  end

  def destroy
    logout!
    redirect_to new_session_url
  end
end
