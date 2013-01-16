class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.decimal :price, scale: 2
      t.string :description
      t.string :food_type
      t.string :diet

      t.timestamps
    end
    
    add_index :products, :food_type
  end
end
