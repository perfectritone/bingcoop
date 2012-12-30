class RecipesController < ApplicationController
  before_filter :signed_in_user, only: [:create, :edit, :destroy]

  def index
    @recipes = Recipe.all
  end
  
  def new
    if signed_in?
      @recipe = current_user.recipes.build 
      @recipe.ingredients.build
    else
      flash[:error] = "First you have to register! Sign up here and start adding recipes ASAP."
      redirect_to signup_path
    end
  end
  
  def create
    @new_recipe = current_user.recipes.build(params[:recipe])
    if @new_recipe.save
      flash[:success] = "You've successfully added #{@new_recipe.name}!"
      redirect_to recipe_path @new_recipe
    else
      redirect_to 'new'
    end
  end
  
  def edit
    @recipe = Recipe.find(params[:id])
  end
  
  def show
    @recipe = Recipe.find(params[:id].to_i)
  end
    
end
