class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def login!(user)
    user.reset_session_token!
    session[:session_token] = user.session_token
  end
end
