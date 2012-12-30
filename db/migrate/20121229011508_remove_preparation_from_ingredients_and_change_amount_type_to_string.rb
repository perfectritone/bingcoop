class RemovePreparationFromIngredientsAndChangeAmountTypeToString < ActiveRecord::Migration
  def up
    remove_column :ingredients, :preparation
    remove_column :ingredients, :amount
    add_column :ingredients, :amount, :string
  end

  def down
    add_column :ingredients, :preparation
    remove_column :ingredients, :amount
    add_column :ingredients, :amount, :integer
  end
end
