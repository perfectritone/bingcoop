class StaticPagesController < ApplicationController
  def home
  end
  
  def about
  end
  
  def get_involved
    @suggestion = Suggestion.new
  end
  
  def products
  end
  
  def contact
  end
end
