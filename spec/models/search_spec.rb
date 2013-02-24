require File.dirname(__FILE__) + '/../spec_helper'

describe Search do
  fixtures :recipes
  let(:breakfast_vegetarian) { recipes(:one) }
  let(:search) { Search.new }
  subject { search }
  
  it { should respond_to :diet }
  it { should respond_to :dish_type }
  it { should respond_to :season }
  it { should respond_to :raw }
  it { should respond_to :gluten_free }
  
  it { should be_valid }

  describe "diet validation" do
    it "should be valid when diet is blank" do
      search.diet = ""
      should be_valid
    end

    it "should be valid when diet is in Recipe::DIETS" do
      search.diet = ["Meat"]
      should be_valid
    end

    it "should be not be valid when diet is not in Recipe::DIETS" do
      search.diet = ["nope"]
      should_not be_valid
    end
  end

end