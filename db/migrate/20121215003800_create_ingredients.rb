class CreateIngredients < ActiveRecord::Migration
  def change
    create_table :ingredients do |t|
      t.integer :recipe_id
      t.string :name
      t.integer :amount
      t.string :unit
      t.string :preparation

      t.timestamps
    end
    add_index(:ingredients, [:recipe_id])
    add_index(:ingredients, [:name])
  end
end
