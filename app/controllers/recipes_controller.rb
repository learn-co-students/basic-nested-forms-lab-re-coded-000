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
    @recipe=Recipe.create(set_params)
    if @recipe.save
      redirect_to @recipe
    else
      render :new
    end
  
  end

  private
    def set_params
      params.require(:recipe).permit(:title,:ingredients_attributes=> [:id,:name,:quantity])
    end


end
