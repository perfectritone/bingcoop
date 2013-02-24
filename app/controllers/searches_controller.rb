class SearchesController < ApplicationController
  respond_to :json
  
  def new
    @search = Search.new
    
    render nothing: true
  end
  
  def create
    @search = Search.new(params[:search])
    if @search.valid?
      @recipes = @search.recipes
      if @recipes.blank?
        flash.now[:warning] = "Sorry, it doesn't look like your search matched any of our Recipes."
      end
    end
    
  end
end
