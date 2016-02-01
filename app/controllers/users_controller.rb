class UsersController < ApplicationController

  def show
    @user = User.where(user_id:current_user.id)
    @food = Food.new
  end
end
