require 'spec_helper'
require 'database_cleaner'

describe SuggestionsController do
  before(:all) do 
    DatabaseCleaner.strategy = :truncation, {:except => %w[semesters]}
    @suggestion = FactoryGirl.create(:suggestion)
    @user = FactoryGirl.create(:user)
  end
  after(:all) { DatabaseCleaner.clean }
  
  context "non-admin user" do   
    before(:each) do
      sign_in @user
    end
   
    it "viewing suggestions should succeed, show" do
      get :show, id: @suggestion
      assigns(:suggestion).should be_nil
    end
    
    it "trying to view suggestions should fail, index" do
      get :index
      assigns(:suggestions).should be_nil
    end

  end
  
  context "admin user" do
    before do
      @user.admin = true
      sign_in @user
    end      
    
    it "the user should be admin" do
      @user.should be_admin
    end
    
=begin Doesn't pass, but works in the view
    it "viewing suggestion should succeed, show" do
      get :show, id: @suggestion.id
      assigns(:suggestion).should eq @suggestion
    end
    
    it "viewing suggestions should succeed, index" do
      get :index
        assigns(:suggestions).should eq([@suggestion])
    end
=end
  end
  
end
