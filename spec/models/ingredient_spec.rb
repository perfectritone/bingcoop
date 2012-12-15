require 'spec_helper'

describe Ingredient do

  let(:user) { FactoryGirl.create(:user) }
  let(:recipe) { FactoryGirl.create(:recipe, user: user) }
  before do
    @ingredient = recipe.ingredients.build(
      name: "Ingredient 1", amount: "5", 
      unit: "whole", preparation: "cut up"
    )
  end
  
  subject { @ingredient }
  
  it { should respond_to(:name) }
  it { should respond_to(:amount) }
  it { should respond_to(:unit) }
  it { should respond_to(:preparation) }
  # Why does the ingredient respond, but not allow change, as in above
  #it { should_not respond_to(:recipe_id=) } 
  
  it { should be_valid }
  
  describe "when the name is not supplied" do
    before { @ingredient.name = "" }
    it { should_not be_valid }
  end
  
  describe "accessible attributes" do
    it "should not allow access to recipe_id" do
      expect do
        Recipe.new(recipe_id: recipe.id)
      end.to raise_error(ActiveModel::MassAssignmentSecurity::Error)
    end
  end
end
