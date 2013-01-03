require 'spec_helper'

describe "Recipe Pages" do
  subject { page }
  
  let(:user) { FactoryGirl.create(:user) }
  
  describe "add a recipe page" do
    before do
      sign_in user
      visit new_recipe_path
    end
    
    it { should have_selector("h1", text: "Add a New Recipe") }
  end
  
  describe "add a recipe form" do
    before do
      sign_in user
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
    context "test that ingredients show up" do
      before { sign_in user }

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
    end
    
    describe "description" do
      let!(:recipe) { FactoryGirl.create(:recipe, user: user) }
      before do
        sign_in user
        recipe.directions = "ok\r\nthen"
        recipe.save
        visit recipes_path recipe
      end
      
      it { should have_selector("div.recipe_directions", text: "ok\nthen") }
    end
    
    describe "the appearance of the edit button" do
      context "for the parent user" do
        before { sign_in user }
        let(:recipe) { FactoryGirl.create(:recipe, user: user) }
        before { visit recipe_path recipe }
        
        it { should have_selector('div.edit_recipe') }
      end
      
      context "for a different user, not the parent" do
        let(:other_user) { FactoryGirl.create(:user) }
        before do
          sign_in other_user
          visit recipes_path '1'
        end
        
        it { should_not have_selector('div.edit_recipe') }
      end
      
      context "for a visitor that is not signed in" do
        before do
          visit recipes_path '1'
        end
        
        it { should have_no_selector('div.edit_recipe') }
      end
    end
  end

  describe "edit page" do
    let(:recipe) { FactoryGirl.create(:recipe, user: user) }
        
    describe "visit by owning user" do
      before do
        sign_in user
        visit edit_recipe_path(recipe)
      end
      
      it { should have_selector('h1', text: "Edit your Recipe") }
      it { should have_no_selector('div.alert-error') }
    end
    
    describe "visit by anonymous visitor" do
      before do
        sign_out
        visit edit_recipe_path(recipe)
      end
      
      it { should have_selector('div.alert-notice', text: 'Please sign in.') }
    end
    
    describe "visit by non-owning user" do
      let(:other_user) { FactoryGirl.create(:user) }
      before { sign_out ; sign_in other_user ; visit edit_recipe_path(recipe)}
      
      it { page.current_path.should == recipes_path }
    end
  end
end
