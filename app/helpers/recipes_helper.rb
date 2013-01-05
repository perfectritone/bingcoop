module RecipesHelper

  def display_directions ( directions )
    simple_format(directions.gsub(/\r\n?/, "\n"))
  end
        
end
