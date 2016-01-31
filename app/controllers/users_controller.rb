class UsersController < ApplicationController

  def index
    @user = User.find(params[:user_id])
    @food = Food.new
  end

  def show
    @user = User.where(user_id:current_user.id)
    @food = Food.new
  end

end
