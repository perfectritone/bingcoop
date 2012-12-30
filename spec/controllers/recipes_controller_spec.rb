require 'spec_helper'

describe RecipesController do
  let(:user) { FactoryGirl.create(:user) }
  before { sign_in user }
  
  let(:recipe) {  
    {
      name: "Schwartzen Peter",
      dish_type: "",
      diet: "",
      season: "winter",
      directions: "A lot of work!"
    }
  }
  
  describe "GET #new" do
    before do
      get :new
    end
    
    it "assigns a new Recipe to @recipe" do
      assert_not_nil assigns("recipe")
    end
    it "renders the :new template" do
      response.should render_template :new
    end
  end
  
  describe "POST create" do
    before { post :create, recipe: recipe }
    
    it "assigns something from the POSTed parameters" do
      assigns("new_recipe").should_not be_nil
    end
    
    it "successfully receives the POSTed parameters" do
      controller.params[:recipe].should == recipe.stringify_keys
    end
    
    it "creates a Recipe object belonging to the correct user" do
      assigns("new_recipe").user.should == user
    end
    
    it "should be valid" do
      assigns("new_recipe").should be_valid
    end
    
    context "with valid attributes, sans ingredients" do
      it "creates a new recipe" do
        expect do
          post :create, recipe: recipe
        end.to change(Recipe, :count).by(1)
      end
      it "should redirect to the recipes page" do
        response.should redirect_to Recipe.last
      end
    end
    
    context "with valid attributes, including ingredients" do
      before do
        recipe[:ingredients_attributes] =
          {
            first_ingredient: { name: "Butter" }
          }
        post :create, recipe: recipe
      end
      
      it "has ingredients" do
        assigns("new_recipe").ingredients.should_not be_empty
      end
      
      it "recipe is still valid" do
        assigns("new_recipe").should be_valid
      end
      
      it "flash should be filled" do
        flash[:success].should == "You've successfully added #{recipe[:name]}!"
      end

      it "ingredient is still valid" do
        assigns("new_recipe").ingredients[0].should be_valid
      end
        
      it "creates a new recipe with ingredients (Check Recipe)" do
        expect do
          post :create, recipe: recipe
        end.to change(Recipe, :count).by(1)
      end
      it "creates a new recipe with ingredients (Check Ingredients)" do
        expect do
          post :create, recipe: recipe
        end.to change(Ingredient, :count).by(1)
      end
      
      it "should have the recipe_id for ingredient" do
        unless Ingredient.last.nil?
          Ingredient.last[:recipe_id].should == Recipe.find_by_name(recipe[:name]).id
        else
          assert false, "No Ingredients in the DB"
        end
      end
    end
  end
end
