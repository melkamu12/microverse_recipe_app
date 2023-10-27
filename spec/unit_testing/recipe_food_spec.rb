require 'rails_helper'

RSpec.describe RecipeFood, type: :model do
  let(:recipe) { Recipe.create(name: 'Test Recipe') }
  let(:food) { Food.create(name: 'Apple', measurement_unit: 'kg', price: 1.99, quantity: 10) }
  let(:recipe_food) { RecipeFood.new(recipe:, food:, quantity: 2) }

  it 'is valid with valid attributes' do
    expect(recipe_food).to be_valid
  end

  it 'is invalid without a quantity' do
    recipe_food.quantity = nil
    expect(recipe_food).to_not be_valid
  end

  it 'is invalid with a non-positive quantity' do
    recipe_food.quantity = 0
    expect(recipe_food).to_not be_valid

    recipe_food.quantity = -1
    expect(recipe_food).to_not be_valid
  end

  it 'calculates the total price correctly' do
    expect(recipe_food.total_price).to eq(1.99 * 2)
  end

  it 'calculates the quantity needed correctly' do
    recipe_food.quantity = 5
    expected_quantity_needed = [5 - food.quantity, 0].max
    expect(recipe_food.quantity_needed).to eq(expected_quantity_needed)
  end

  it 'calculates the total price for needed quantity correctly' do
    recipe_food.quantity = 5
    expected_total_price_need = 1.99 * [5 - food.quantity, 0].max
    expect(recipe_food.total_price_need).to eq(expected_total_price_need)
  end
end
