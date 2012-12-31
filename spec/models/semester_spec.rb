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
