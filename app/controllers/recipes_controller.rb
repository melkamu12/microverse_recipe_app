class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy!
    redirect_to recipes_path, notice: 'Recipe was successfully removed.'
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user = current_user
    @recipe.preparation_time = calculate_minutes(params[:recipe][:preparation_time_hr],
      params[:recipe][:preparation_time_min])
    @recipe.cooking_time = calculate_minutes(params[:recipe][:cooking_time_hr], params[:recipe][:cooking_time_min])

    if @recipe.save
      redirect_to @recipe, notice: 'Recipe successfully created.'
    else
      render 'new', alert: 'Failed to create a new recipe.'
    end
  end

  def calculate_minutes(hours, minutes)
    (hours.to_i * 60) + minutes.to_i
  end

  private
  
  def recipe_params
    params.require(:recipe).permit(:name, :description, :public)
  end
end
