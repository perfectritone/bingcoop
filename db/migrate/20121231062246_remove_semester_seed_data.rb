class RemoveSemesterSeedData < ActiveRecord::Migration
  def up
    Semester.where( year: 2012, semester: 1, first_day: 243, last_day: 349 ).destroy_all
    Semester.where( year: 2013, semester: 0, first_day: 24, last_day: 130 ).destroy_all
    Semester.where( year: 2013, semester: 1, first_day: 238, last_day: 348 ).destroy_all
    Semester.where( year: 2014, semester: 0, first_day: 27, last_day: 129 ).destroy_all
    Semester.where( year: 2014, semester: 1, first_day: 245, last_day: 346 ).destroy_all
  end

  def down
    Semester.create( year: 2012, semester: 1, first_day: 243, last_day: 349 )
    Semester.create( year: 2013, semester: 0, first_day: 24, last_day: 130 )
    Semester.create( year: 2013, semester: 1, first_day: 238, last_day: 348 )
    Semester.create( year: 2014, semester: 0, first_day: 27, last_day: 129 )
    Semester.create( year: 2014, semester: 1, first_day: 245, last_day: 346 )
  end
end
