class RecipesController < ApplicationController
  def show
    @recipe = Recipe.find_by(id: params[:id])
  end

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
    2.times {@recipe.ingredients.build}
  end

  def create
    @recipe = Recipe.create(recpie_params)
    redirect_to recipe_path(@recipe)
  end

  private

  def recpie_params
    params.require(:recipe).permit(
      :title,
      ingredients_attributes: [
        :name,
        :quantity
      ]
    )
  end
end
