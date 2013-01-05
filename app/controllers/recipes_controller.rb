class RecipesController < ApplicationController
  before_filter :signed_in_user, only: [:create, :edit, :update, :destroy]
  before_filter :correct_user, only: [:edit, :update]

  def index
    @recipes = Recipe.search(params)
  end
  
  def index_scoped
    @recipes = Recipe.with_dish_type(params[:dish_type]).with_diet(params[:diet]).with_season(params[:season])
    render 'index'
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
  end
  
  def update
    if @recipe.update_attributes(params[:recipe])
      flash[:success] = "Recipe updated!"
      redirect_to @recipe
    else
      render 'edit'
    end
  end
  
  def show
    @recipe = Recipe.find(params[:id].to_i)
  end

  private
    
    def correct_user
      @recipe = Recipe.find(params[:id])
      redirect_to(recipes_path) unless current_user? @recipe.user
    end
    
end
