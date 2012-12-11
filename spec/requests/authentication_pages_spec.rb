require "spec_helper"

describe "Authentication" do
  
  subject { page }
  
  describe "signin page" do
    before { visit signin_path }
    
    it { should have_selector("title", text: "Log in") }
    
    describe "with invalid credentials" do
      before { click_button "Log in" }
      
      it { should have_selector("title", text: "Log in") }
      it { should have_selector("div.alert-error", text: "Invalid") }
      
      describe "after visiting another page" do
        before { click_link "About" }
        
        it { should_not have_selector('div.alert-error') }
      end
    end
    
    describe "with valid credentials" do
      let(:user) { FactoryGirl.create(:user) }
      before do
        fill_in "Email",    with: user.email
        fill_in "Password", with: user.password
        click_button "Log in"
      end

      it { should have_selector('title', text: user.name) }
      it { should have_link('Log out', href: signout_path) }
      it { should_not have_link('Log in', href: signin_path) }
    end
  end
  
  describe "authentication without credentials" do
    
    describe "for non-signed-in users" do
      let(:user) { FactoryGirl.create(:user) }
      
      describe "visiting the edit page" do
        before { visit edit_user_path(user) }
        it { should have_selector("title", text: "Log in") }
      end
      
      describe "submitting to the update action" do
        before { put user_path(user) }
        specify { response.should redirect_to(signin_path) }
      end
    end
  end
  
  describe "authentication eventually gaining credentials" do
    
   describe "for non-signed-in users" do
      let(:user) { FactoryGirl.create(:user) }
      
      describe "when attempting to visit a protected page" do
        before do
          visit edit_user_path(user)
          fill_in "Email", with: user.email
          fill_in "Password", with: user.password
          click_button "Log in"
        end
        
        describe "after signing in" do
          it "should render the desired protected page" do
            page.should have_selector("title", text: "Edit your information") 
          end
        end
      end
    end
  end
  
  describe "non-admin user trying to delete a user" do
    let(:user) { FactoryGirl.create(:user) }
    let(:non_admin) { FactoryGirl.create(:user) }
    
    before { sign_in non_admin }
    
    describe "submit a DELETE request to the Users#destroy action" do
      before { delete user_path(user) }
      
      specify { non_admin.admin?.should == false }
      specify { flash[:success].should_not == "User removed" }
      specify { response.should redirect_to(root_path) }
      specify { user.destroyed?.should == false }
    end
    
    describe "by submitting a DELETE request on themself" do
      before { delete user_path(non_admin) }
      
      specify { response.should redirect_to(root_path) }

      
=begin
      specify { defined?(sign_in).should be_true }
      #specify { controller.params[:id].should == flash[:params_id] }
      specify { flash[:success].should == "You have successfully removed yourself" }
      specify { flash[:error].should_not == "User could not be removed" }
      #specify { flash[:destroy_return].should == nil }
      specify { flash[:current_user].should == "j" }
      specify { User.find_by_id(non_admin).should == nil }
      specify { non_admin.destroyed?.should == true }
      specify { User.exists?(non_admin).should == false }
=end
    end
  end
  
  describe "admin user with the capability of deleting users" do
    let(:admin_user) { FactoryGirl.create(:user) }
    let(:user) { FactoryGirl.create(:user) }
    before do
      admin_user.toggle!(:admin)
      sign_in admin_user
    end
    
    describe "deletes a basic user" do
      before { delete user_path(user) }
      
      specify { admin_user.admin?.should be_true }
      specify { flash[:success].should == "User removed" }
      it { expect { User.find user }.to raise_error ActiveRecord::RecordNotFound }
    end
  end
  
end
