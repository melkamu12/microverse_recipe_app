class FoodsController < ApplicationController
  def index
  end
  def create
      food_params = params.require(:food).permit(:name, :measurement_unit, :price, :quantity, :user_id)
  end
end
