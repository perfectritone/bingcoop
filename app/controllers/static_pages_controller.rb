class StaticPagesController < ApplicationController
  def home
  end
  
  def about
  end
  
  def menu
    @pizzas = Product.where( "food_type = ?", "pizza")
    @beverages = Product.where( "food_type = ?", "beverage")
    @desserts_and_snacks = Product.where( "food_type = ?", "dessert_or_snack")
  end
  
  def get_involved
    @suggestion = Suggestion.new
  end
  
  def products
  end
  
  def contact
  end
end
