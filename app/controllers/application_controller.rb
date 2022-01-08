class ApplicationController < ActionController::Base
  private
  def confirm_logged_in
    # username = session[:username]
    login_token = session[:user_id]
    redirect_to(access_login_path) unless login_token
  end
end
