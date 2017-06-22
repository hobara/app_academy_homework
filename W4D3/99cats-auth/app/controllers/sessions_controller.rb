class SessionsController < ApplicationController
  # before_action :require_no_user!, only: [:create, :new]

  helper_method :current_user

  def new #login form you look at
    render :new
  end

  def create #action of logging in user
    user = User.find_by_credentials(params[:user][:user_name], params[:user][:password])
    if user.nil?
      flash.now[:errors] = ["Invalid username or password"]
      render :new
    else
      login!(user)
      redirect_to cats_url
    end
  end

  def destroy
    logout! unless current_user.nil?
    redirect_to new_session_url
  end




end
