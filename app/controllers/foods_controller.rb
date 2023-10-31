class FoodsController < ApplicationController
  def index
    @foods = Food.where(user: current_user)
  end

  def new
    @food = Food.new
  end

  def create
    @food = Food.new(food_params)
    @food.user = current_user

    if @food.save
      redirect_to foods_path, notice: 'Ingredient was successfully created.'
    else
      redirect_to new_food_path, alert: 'Cannot create a new ingredient.'
    end
  end

  def destroy
    @food = Food.find(params[:id])
    redirect_to foods_path, notice: "Food #{@food.name} was deleted!" and return if @food.destroy

    redirect_to foods_path, alert: 'Something went wrong while trying to delete the Food'
  end

  protected

  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price, :quantity)
  end
end
