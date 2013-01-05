# == Schema Information
#
# Table name: semesters
#
#  id         :integer          not null, primary key
#  year       :integer
#  semester   :boolean
#  first_day  :integer
#  last_day   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Semester < ActiveRecord::Base
  attr_accessible :first_day, :last_day, :semester, :year
  
end
