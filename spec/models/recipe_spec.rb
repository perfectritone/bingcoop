require 'spec_helper'

describe Recipe do
  
  let(:user) { FactoryGirl.create(:user) }
  before do
    @recipe = user.recipes.build(name: "Sweet Potato Hash Browns", 
      dish_type: "breakfast", season: "any", diet: "vegetarian", directions:
      "First you grate the sweet potatoes. Then you throw em in a frying pan. Then you add the juice from half a lemon and throw in some extra sharp cheddar cheese (or any cheese, depending on what you have on hand.). Just keep on frying it up until its a nice golden brown. Eat up!"
      )
  end
  
  subject { @recipe }
  
  it { should respond_to(:id) }
  it { should respond_to(:name) }
  it { should respond_to(:user_id) }
  it { should respond_to(:dish_type) }
  it { should respond_to(:season) }
  it { should respond_to(:diet) }
  it { should respond_to(:directions) }
  
  it { should respond_to(:user) }
  its(:user) { should == user }
  
  it { should be_valid }
  
  describe "when user_id is not supplied" do
    before { @recipe.user_id = nil }
    it { should_not be_valid }
  end
  
  describe "when the name is blank" do
    before { @recipe.name = "" }
    it { should_not be_valid }
  end
  
  describe "when the name is too long" do
    before { @recipe.name = "a" * 65 }
    it { should_not be_valid }
  end
  
  describe "when the dish_type is not one of the options" do
    before { @recipe.dish_type = "not an option" }
    it { should_not be_valid }
  end
  
  describe "when the season is not one of the options" do
    before { @recipe.season = "all" } # should be any
    it { should_not be_valid }
  end
  
  describe "when the diet is not one of the options" do
    before { @recipe.diet = "pescatarian" } # not yet an option
    it { should_not be_valid }
  end
  
  describe "when the directions are not supplied" do
    before { @recipe.directions = "" }
    it { should_not be_valid }
  end
  
  describe "when the directions are too long" do
    before { @recipe.directions = "a" * 1025 }
    it { should_not be_valid }
  end
  
  describe "accessible attributes" do
    it "should not allow access to user_id" do
      expect do
        Recipe.new(user_id: user.id)
      end.to raise_error(ActiveModel::MassAssignmentSecurity::Error)
    end
  end
end