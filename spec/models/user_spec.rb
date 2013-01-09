# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  email           :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  password_digest :string(255)
#  remember_token  :string(255)
#  admin           :boolean          default(FALSE)
#

require 'spec_helper'

describe User do
  before { @user = User.new(name: "Test User", email: "test@gmail.com", 
            password: "testing", password_confirmation: "testing") }
  
  subject { @user }
  
  it { should respond_to(:name) }
  it { should respond_to(:email) }
  it { should respond_to(:password_digest) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }
  
  describe "when the default params, which are valid, pass" do
    it { should be_valid }
  end
  
  describe "when e-mail is an invalid pattern, no TLD" do
    before { @user.email = "naaaanaaaa@notopleveldomain" }
    it { should_not be_valid }
  end
  
    describe "when e-mail is an invalid pattern, no @ sign" do
    before { @user.email = "naaaanaaaa" }
    it { should_not be_valid }
  end
  
  describe "when e-mail is an invalid pattern, nothing before @" do
    before { @user.email = "@this.com" }
    it { should_not be_valid }
  end
  
  describe "when e-mail is not all lowercase" do
    let(:mixed_case_email) { "FoO@baR.COM" }
    
    it "should be converted to lowercase before entering the db" do
      @user.email = mixed_case_email
      @user.save
      @user.reload.email.should == mixed_case_email.downcase
    end
  end
  
  describe "when password hasn't been entered" do
    before { @user.password = @user.password_confirmation = "" }
    it { should_not be_valid }
  end
  
  describe "when password is too short" do
    before { @user.password = @user.password_confirmation = "12345" }
    it { should_not be_valid }
  end
  
  describe "when password confirmation doesn't match" do
    before { @user.password_confirmation = "testung" }
    it { should_not be_valid }
  end
  
  describe "when password confirmation does not exist (can't happen in browser)" do
    before { @user.password_confirmation = nil }
    it { should_not be_valid }
  end
  
  it { should respond_to(:password_confirmation) }
  it { should respond_to(:remember_token) }
  it { should respond_to(:authenticate) }
  it { should respond_to(:recipes) }
  
  describe "remember token" do
    before { @user.save }
    
    its(:remember_token) { should_not be_blank } 
    # same as it { @user.remember_token.should_not be_blank }
  end
  
  
  it { should respond_to(:admin) }
  it { should respond_to(:authenticate) }
  
  it { should be_valid }
  it { should_not be_admin }
  
  describe "with admin privileges" do
    before { @user.toggle(:admin) }
    
    it { should be_admin }
  end
  
  it { should respond_to(:recipes) }
  
  describe "recipe associations," do
    
    before { @user.save }
    let!(:older_recipe) do
      FactoryGirl.create(:recipe, user: @user, created_at: 1.day.ago)
    end
    let!(:newer_recipe) do
      FactoryGirl.create(:recipe, user: @user, created_at: 1.minute.ago)
    end
    
    it "should know what user they belong to" do
      older_recipe.user.should == @user
    end
    
    it "all of the recipes should be in the db" do
      Recipe.where("user_id = ?", @user.id).should == [newer_recipe, older_recipe]
    end
    
    it "should be listed newest first" do
      @user.reload
      # THIS DOES NOT WORK, WHY? This works in development.
      @user.recipes.should == [newer_recipe, older_recipe]
    end
    
    it "should remove microposts belonging to a user when they are destroyed" do
      recipes = @user.recipes
      @user.destroy
      recipes.each do |recipe|
        lambda do
          Recipe.find(recipe.id)
        end.should raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end
end
