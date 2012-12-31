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
    
    Semester.create( year: 2012, semester: 1, first_day: 243, last_day: 349 )
    Semester.create( year: 2013, semester: 0, first_day: 24, last_day: 130 )
    Semester.create( year: 2013, semester: 1, first_day: 238, last_day: 348 )
    Semester.create( year: 2014, semester: 0, first_day: 27, last_day: 129 )
    Semester.create( year: 2014, semester: 1, first_day: 245, last_day: 346 )
  end
  
  def down
    drop_table :semesters
  end
end
