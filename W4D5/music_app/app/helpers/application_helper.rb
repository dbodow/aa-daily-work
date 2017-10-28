module ApplicationHelper

  def auth_token
    token = "<input type=\"hidden\" name=\"authenticity_token\" "
    token += "value=\"" + form_authenticity_token + "\" />"
    token.html_safe
  end

  def header_links
    current_user ? logged_in_header : logged_out_header
  end

  private

  def log_in_link
    "<li class=\"header_link\"><a href=\"" + new_session_url + "\">Log In</a></li>"
  end

  def sign_up_link
    "<li class=\"header_link\"><a href=\"" + new_user_url + "\">Sign Up</a></li>"
  end

  def welcome_text
    "<li>Hello, #{current_user.email}</li>"
  end

  def log_out_button
    "<li class=\"header_link\"><form action=\"" + session_url + "\" method=\"post\">" + auth_token + "<input type=\"hidden\" name=\"_method\" value=\"delete\">" +
    "<input type=\"submit\" value=\"Log Out\"></form></li>"
  end

  def logged_out_header
    log_in_link.concat(sign_up_link).html_safe
  end

  def logged_in_header
    welcome_text.concat(log_out_button).html_safe
  end
end
