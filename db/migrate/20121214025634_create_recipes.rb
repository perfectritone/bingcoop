class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :name
      t.string :user_id
      t.string :dish_type
      t.string :season
      t.string :diet
      t.text :directions

      t.timestamps
    end
    add_index :recipes, [:name]
    add_index :recipes, [:created_at]
  end
end
