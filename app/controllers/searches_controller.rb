class SearchesController < ApplicationController
  respond_to :json
  
  def new
    @search = Search.new
  end
  
  def create
    @search = Search.new(params[:search])
    if @search.valid?
      @recipes = @search.recipes
      if @recipes.blank?
        #flash.now[:warning] = "Sorry, it doesn't look like your search matched any of our Recipes."
      end
      #render @recipes
    else
      #flash.now[:error] = "Sorry, you have entered invalid search parameters."
    end
  end
end
