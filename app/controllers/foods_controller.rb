class FoodsController < ApplicationController
  params.require(:food).permit(:name, :measurement_unit, :price, :quantity, :user_id)
end
