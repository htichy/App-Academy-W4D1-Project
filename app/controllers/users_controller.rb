class UsersController < ApplicationController
  def index
    render json: User.all
  end
  
  def create
    user = User.new(params.require(:user).permit(:name, :email))
    # replace the `user_attributes_here` with the actual attribute keys
    if user.save
      render json: user
    else
      render json: user.errors.full_messages, status: :unprocessable_entity
    end
  end
  
  def show
    user = User.find(params[:id])
    if User.find(params[:id])
      render json: user
    else
      render json: user.errors.full_messages, status: 404
    end
  end
end