class SessionsController < ApplicationController

  def new
    render :new
  end

  def create
    user = User.find_by_credentials(
      params[:user][:username],
      params[:user][:password]
    )
    if user.nil?
      flash.now[:errors] = user.errors.full_messages
      render :new
    else
      log_in!(user)
      # redirect_to
    end
  end

  def destroy
    log_out!
    # redirect_to
  end


end
