class AddGlutenFreeAndRawToRecipe < ActiveRecord::Migration
  def change
    add_column :recipes, :'gluten-free', :boolean, default: false
    add_column :recipes, :raw, :boolean, default: false
  end
end
