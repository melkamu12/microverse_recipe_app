require 'rails_helper'

RSpec.describe Recipe, type: :model do
  let(:user) { User.create( name: 'Test User') }
  let(:recipe) { Recipe.new(
    name: 'Test Recipe',
    preparation_time: 30,
    cooking_time: 60,
    description: 'A test recipe',
    public: true,
    user: user
  ) }

  it 'is valid with valid attributes' do
    expect(recipe).to be_valid
  end

  it 'is invalid without a name' do
    recipe.name = nil
    expect(recipe).to_not be_valid
  end

  it 'is invalid with a name that is too long' do
    recipe.name = 'a' * 51
    expect(recipe).to_not be_valid
  end
  
  it 'is invalid without a preparation time' do
    recipe.preparation_time = nil
    expect(recipe).to_not be_valid
  end

  it 'is invalid with a non-integer preparation time' do
    recipe.preparation_time = 30.5
    expect(recipe).to_not be_valid
  end

  it 'is invalid with a preparation time less than 1' do
    recipe.preparation_time = 0
    expect(recipe).to_not be_valid
  end

  it 'is invalid without a cooking time' do
    recipe.cooking_time = nil
    expect(recipe).to_not be_valid
  end

  it 'is invalid with a non-integer cooking time' do
    recipe.cooking_time = 60.5
    expect(recipe).to_not be_valid
  end

  it 'is invalid with a cooking time less than 1' do
    recipe.cooking_time = 0
    expect(recipe).to_not be_valid
  end

  it 'is invalid without a description' do
    recipe.description = nil
    expect(recipe).to_not be_valid
  end

  it 'is invalid with a blank description' do
    recipe.description = ' '
    expect(recipe).to_not be_valid
  end

  it 'has a valid user association' do
    expect(recipe.user).to eq(user)
  end

  it 'is valid with public set to true' do
    recipe.public = true
    expect(recipe).to be_valid
  end

  it 'is valid with public set to false' do
    recipe.public = false
    expect(recipe).to be_valid
  end

  it 'calculates preparation time in hours and minutes' do
    expect(recipe.preparation_time_hours).to eq(0)
    expect(recipe.preparation_time_minutes).to eq(30)
  end

  it 'calculates cooking time in hours and minutes' do
    expect(recipe.cooking_time_hours).to eq(1)
    expect(recipe.cooking_time_minutes).to eq(0)
  end

  it 'calculates total time in hours and minutes' do
    expect(recipe.total_time_hours).to eq(1)
    expect(recipe.total_time_minutes).to eq(30)
  end
end
