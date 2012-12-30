=begin
class IngredientsController < ApplicationController
  before_filter :correct_user
  
  def create
    @ingredient = Ingredient.new(params[:ingredient])
  end
  
  def destroy
    Recipe.find(params[:id]).destroy
  end
  
  private
  
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end

end
=end
