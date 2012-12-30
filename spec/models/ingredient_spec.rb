require 'spec_helper'

describe Ingredient do

  let(:user) { FactoryGirl.create(:user) }
  let(:recipe) { FactoryGirl.create(:recipe, user: user) }
  before do
    @ingredient = recipe.ingredients.build(
      name: "Ingredient 1", amount: "5", 
      unit: "whole"
    )
  end
  
  subject { @ingredient }
  
  it { should respond_to(:name) }
  it { should respond_to(:amount) }
  it { should respond_to(:unit) }
  it { should respond_to(:id) }
  
  it { should be_valid }
  
  describe "when the name is not supplied" do
    before { @ingredient.name = "" }
    it { should_not be_valid }
  end
  
  describe "when the mass assignment is attempted" do
    it "for recipe_id" do
      expect do
        Ingredient.new name: "Flour", amount: "2", recipe_id: 1
      end.to raise_error
    end
  end
  
  describe "id is changed" do
  before { @ingredient.save }
  let(:original_id) { @ingredient.id }
  before do
    @ingredient.id = @ingredient.id + 1
    @ingredient.save
  end
  its(:id) { should == original_id }
  end
        
  
  describe "accessible attributes" do
    it "should not allow access to recipe_id" do
      expect do
        Recipe.new(recipe_id: recipe.id)
      end.to raise_error
    end
  end
end
