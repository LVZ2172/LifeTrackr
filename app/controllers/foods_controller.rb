class FoodsController < ApplicationController
  before_action :set_food, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  respond_to :html

  def index
    @user = User.where(user_id:current_user.id)
    @foods = Food.all
    respond_with(@foods)
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
  end

  def create
    @user = User.find(params[:user_id])
    @food = @user.foods.new(food_params)
    if @food.save
     redirect_to user_food_path(@user, @food)
   end
  end

  def update
    @food.update(food_params)
    respond_with(@food)
  end

  def destroy
    @user = User.where(user_id:current_user.id)
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
