class UsersController < ApplicationController

  def index
    users = User.all
    render json: users
  end

  def create
    user = User.new(user_params)
    if user.save
      render json: user
    else
      render(
        json: user.errors.full_messages, status: :unprocessable_entity # 422
      )
    end
  end

  def show
    user = current_user
    if user
      render json: user
    else
      render json: ["Cannot find user"]
    end
  end

  def update
    user = current_user
    if user
      user.update(user_params)
      render json: current_user
    else
      render json: user.errors.full_messages, status: 422
    end
  end

  def destroy
    user = current_user
    if user
      user.destroy
      render json: user
    else
      render json: ["cant find"]
    end
  end


  private

  def current_user
    User.find_by(id: params[:id])
  end

  def user_params
    params[:user].permit(:username)
  end

end
