class FixGlutenFreeName < ActiveRecord::Migration
  def up
    add_column :recipes, :gluten_free, :boolean, default: false
  end

  def down
    remove_column :recipes, :'gluten-free'
  end
end
