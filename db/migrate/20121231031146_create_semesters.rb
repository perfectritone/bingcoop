class CreateSemesters < ActiveRecord::Migration
  def up
    create_table :semesters do |t|
      t.integer :year
      t.boolean :semester # 0 => Spring, 1 => Fall
      t.integer :first_day
      t.integer :last_day

      t.timestamps
    end
    
    add_index :semesters, [:year, :semester]
end
  
  def down
    drop_table :semesters
  end
end
