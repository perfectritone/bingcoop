class CreateWebsites < ActiveRecord::Migration
  def up
    create_table :websites do |t|
      t.string :name
      t.string :kind
      t.string :location
      t.string :url
      t.integer :user_id

      t.timestamps
    end
    
    add_index :websites, [:kind]
  end
  
  def down
    drop_table :websites
  end
end

