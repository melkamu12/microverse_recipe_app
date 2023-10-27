require 'rails_helper'
require 'shoulda-matchers'

RSpec.describe Food, type: :model do
  let(:food) { Food.new(name: 'Apple', measurement_unit: 'kg') }

  it 'is invalid without a name' do
    food.name = nil
    expect(food).to_not be_valid
  end

  it 'is invalid without a measurement unit' do
    food.measurement_unit = nil
    expect(food).to_not be_valid
  end

  it 'combines name and measurement unit' do
    expect(food.name_with_measurement_unit).to eq 'Apple (kg)'
  end

  it 'is invalid with a name less than 3 characters' do
    food.name = 'Ab'
    expect(food).to_not be_valid
  end

  it 'is invalid with a name greater than 50 characters' do
    food.name = 'a' * 51
    expect(food).to_not be_valid
  end

  it 'is invalid without a price' do
    food.price = nil
    expect(food).to_not be_valid
  end

  it 'is invalid with a negative price' do
    food.price = -1
    expect(food).to_not be_valid
  end

  it 'is invalid without a quantity' do
    food.quantity = nil
    expect(food).to_not be_valid
  end

  it 'is invalid with a negative quantity' do
    food.quantity = -1
    expect(food).to_not be_valid
  end
end
