require 'spec_helper'

describe "Recipe Pages" do
  subject { page }
  
  let(:user) { FactoryGirl.create(:user) }
  before { sign_in user }
  
  describe "add a recipe page" do
    before { visit new_recipe_path }
    
    it { should have_selector("h1", text: "Add a New Recipe") }
  end
  
  describe "add a recipe form" do
    before do
      visit new_recipe_path
    end
    
    let(:submit) { "Add your recipe" }

    describe "with invalid information" do
      it "should not add a recipe" do
        expect { click_button submit }.not_to change(Recipe, :count)
      end
    end

    describe "with valid information" do
      let(:name) { "Squiggle Wams" }
      let(:directions) { "Do this, then that." }
      let(:ingredient_name) { "Ingredients here" }
      before do
        fill_in "Name",       with: name
        fill_in "Directions", with: directions
        fill_in "Ingredient Name", with: ingredient_name
      end

      it "should create a new Recipe" do
        expect { click_button submit }.to change(Recipe, :count).by(1)
      end
      
      it "should create a new Ingredient" do
        expect { click_button submit }.to change(Ingredient, :count).by(1)
      end
    end
  end
  
  describe "show pages" do
    
    let!(:recipe) { FactoryGirl.create(:recipe, user: user) }
    let!(:ingredient_1) do
      recipe.ingredients.create( name: "Lemon", amount: "1", unit: "Whole" )
    end
    let!(:ingredient_2) do
      recipe.ingredients.create( name: "Apples", amount: "2" )
    end
    let!(:ingredient_3) do
      recipe.ingredients.create( name: "Salt", amount: "1/4", unit: "tsp" )
    end
    let!(:ingredient_4) do
      recipe.ingredients.create( name: "Pepper", amount: "4", unit: "ounces" )
    end
    let!(:ingredient_5) do
      recipe.ingredients.create( name: "Water", unit: "cup" )
    end
    let!(:ingredient_6) do
      recipe.ingredients.create( name: "Grape", amount: "1/2" )
    end
    
    before do
      recipe.reload
      visit recipes_path recipe
    end
    
    it { should have_content("1 Whole Lemon") }
    it { should have_content("2 Apples") }
    it { should have_content("1/4 tsp Salt") }
    it { should have_content("4 ounces Pepper") }
    it { should have_content("1 Whole Lemon") }
    it { should have_content("1/2 Grape") }
    
    describe "description" do
      before do
        recipe.directions = "ok\r\nthen"
        recipe.save
        visit recipes_path recipe
      end
      
      it { should have_selector("div.recipe_directions", text: "ok\nthen") }
    end
  end
end
