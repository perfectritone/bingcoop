class CreateMovies < ActiveRecord::Migration
  def up
    create_table :movies do |t|
      t.string :name
      t.string :kind
      t.integer :user_id

      t.timestamps
    end
    
    add_index :movies, [:kind]
end
  
  def down
    drop_table :movies
  end
end
