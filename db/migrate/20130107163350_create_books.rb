class CreateBooks < ActiveRecord::Migration
  def up
    create_table :books do |t|
      t.string :name
      t.string :author
      t.string :kind
      t.integer :user_id

      t.timestamps
    end
    
    add_index :books, [:kind]
end
  
  def down
    drop_table :websites
  end
end

