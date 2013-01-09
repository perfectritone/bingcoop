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

require 'spec_helper'

describe Semester do
  #add more tests
  
  it { should respond_to :first_day }
  it { should respond_to :last_day }
  it { should respond_to :year }
  it { should respond_to :semester }
  
  it { should be_valid }
  
  
  
  describe "#store_status" do
    
  end
end
