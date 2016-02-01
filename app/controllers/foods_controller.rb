class FoodsController < ApplicationController
  before_action :set_food, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  respond_to :html

  def index
    @user = User.find(params[:user_id])
    @foods = Food.all
  end

  def show
    @user = User.where(user_id:current_user.id)
    respond_with(@food)
    @foods = Food.find(params[:id])
  end

  def new
    @user = User.find(params[:user_id])
    query = params[:query]
    @food = @user.foods.new
    @results = @food.search_api_for(query)
    render :new
  end

  def edit
    @user = User.find(params[:user_id])
    @food = Food.find(params[:id])
  end

  def create
    @user = User.find(params[:user_id])
    @food = @user.foods.new(food_params)
    if @food.save
     redirect_to user_foods_path(@user, @food)
   end
  end

  def update
    @user = User.find(params[:user_id])
    if @food.update(food_params)
      redirect_to user_foods_path(@user, @food)
  end
end

  def destroy
    @user = User.find(params[:user_id])
    if @food.destroy
      redirect_to user_foods_path(@user)
    end
  end

  private

    def set_food
      @food = Food.find(params[:id])
    end

    def food_params
      params.require(:food).permit(:name, :calories)
    end
end
