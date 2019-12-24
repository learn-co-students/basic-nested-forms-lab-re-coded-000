class RecipesController < ApplicationController
  def show
    @recipe = Recipe.find(params[:id])
  end

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
    @recipe.ingredients.build(name: 'sugar')
    @recipe.ingredients.build(name: 'milk')
  end

  def create
    recipe = Recipe.create(recipe_params)
    if recipe.save
    redirect_to recipe_path(recipe)
    else
      render :new
    end
  end

  private
   def recipe_params
     params.require(:recipe).permit(:title,:ingredients_attributes=> [:id,:name,:quantity])
   end

end
