class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception
  helper_method :current_user
  helper_method :logged_in?
  #logged in helper method

  def current_user
    return nil unless session[:session_token]
    @current_user ||= User.find_by(session_token: session[:session_token])
  end

  # @current_user = nil

  def logged_in?
    # !@current_user.nil?
    !!current_user
  end

  def login!(user)
    session[:session_token] = user.reset_session_token!
  end

  def logout!
    current_user.reset_session_token!
    session[:session_token] = nil
  end
end

# User model:
#   validating everything
#   self.find_by_credentials
#   creating password_digest & session_token
#
# UsersController
#   new (form) --> create (logs in if sucessful)
#
# SessionController
#   new (form) --> create (log in)
#   button --> destroy (log out)

# ApplicationController
#   **ALL CONTROLLERS INHERIT FROM HERE**
#   methods:
#     login(user)
#     logout
#   helpers (can call from within views):
#     current_user
#     logged_in?

# Application HTML
#   **STUFF THAT SHOWS ON ALL PAGES**
    # links to sign_up or log_in
    # OR
    # button to logout & current user's name

    # ERRORS!!!!


#
