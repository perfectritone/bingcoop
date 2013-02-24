require 'spec_helper'

describe SessionsHelper do

  describe "#store_status" do

    it "is Monday during the semester, during hours, should be open" do
      @time = Time.new(2013,2,4,11)
      Time.stubs(:now).returns(@time)
      
      helper.store_status[:status].should == "OPEN"
      helper.store_status[:message].should be_nil
    end
    
    it "is Wednesday during the semester, during hours, should be open" do
      @time = Time.new(2013,2,6,11)
      Time.stubs(:now).returns(@time)
      
      helper.store_status[:status].should == "OPEN"
      helper.store_status[:message].should be_nil
    end
    
    it "is Friday during the semester, during hours, should be open" do
      @time = Time.new(2013,2,8,11)
      Time.stubs(:now).returns(@time)
      
      helper.store_status[:status].should == "OPEN"
      helper.store_status[:message].should be_nil
    end
    
    it "is Monday during the semester at 6, should be closed" do
      @time = Time.new(2013,2,4,6)
      Time.stubs(:now).returns(@time)
      
      helper.store_status[:status].should == "CLOSED"
      helper.store_status[:message].should == "We will be open today at 10am."
    end
    
    it "is Monday during the semester at 8p, should be closed" do
      @time = Time.new(2013,2,4,20)
      Time.stubs(:now).returns(@time)
      
      helper.store_status[:status].should == "CLOSED"
      helper.store_status[:message].should == "We are currently closed for the day, please come back tomorrow!"
    end
    
    it "is Friday during the semester at 8p, should be closed" do
      @time = Time.new(2013,2,8,20)
      Time.stubs(:now).returns(@time)
      
      helper.store_status[:status].should == "CLOSED"
      helper.store_status[:message].should == "We are currently closed for the day, please come back next week!"
    end
    
    it "is Saturday during the semester, should be closed" do
      @time = Time.new(2013,2,9)
      Time.stubs(:now).returns(@time)
      
      helper.store_status[:status].should == "CLOSED"
      helper.store_status[:message].should == "We are currently closed, please come visit us after the weekend."
    end    

    it "is not during the semester, should be closed" do
      @time = Time.new(2013,1,17)
      Time.stubs(:now).returns(@time)

      helper.stubs(:semester_info=).returns(24)
      helper.stubs(:semester_info=).returns(130)

      helper.store_status[:status].should == "CLOSED"
      helper.store_status[:message].should == "We will be closed until the start of the next semester."
    end

    it "is not during the semester, should be closed" do
      @time = Time.new(2013,5,29)
      Time.stubs(:now).returns(@time)

      helper.stubs(:semester_info=).returns(24)
      helper.stubs(:semester_info=).returns(130)

      helper.store_status[:status].should == "CLOSED"
      helper.store_status[:message].should == "We will be closed until the start of the next semester."
    end
  end
end