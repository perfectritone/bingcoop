require 'test_helper'
require 'rails/performance_test_help'
 
class RecipeSearchPerformanceTest < ActionDispatch::PerformanceTest

  self.profile_options = { runs: 50, metrics: [:wall_time, :process_time] }
  
  def test_scope_search
    get '/recipes/veg'
  end
  
  def test_search
    get '/recipes/vegetarian'
  end
  
end
