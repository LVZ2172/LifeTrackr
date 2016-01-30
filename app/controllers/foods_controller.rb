class FoodsController < ApplicationController
  before_action :set_food, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @foods = Food.all
    respond_with(@foods)
  end

  def show
    respond_with(@food)
  end

  def new
    query = params[:query]
    @food = Food.new
    @results = @food.search_api_for(query)
    render :new
  end

  def edit
  end

  def create
    @food = Food.new(food_params)
    @food.save
    respond_with(@food)
  end

  def update
    @food.update(food_params)
    respond_with(@food)
  end

  def destroy
    @food.destroy
    respond_with(@food)
  end

  private

    def set_food
      @food = Food.find(params[:id])
    end

    def food_params
      params.require(:food).permit(:name, :calories)
    end
end
