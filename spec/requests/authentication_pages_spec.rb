require "spec_helper"

describe "AuthenticationPages" do
  
  subject { page }
  
  describe "signin page" do
    before { visit signin_path }
    
    it { should have_selector("title", text: "Sign in") }
    
    describe "with invalid credentials" do
      before { click_button "Sign in" }
      
      it { should have_selector("title", text: "Sign in") }
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
        click_button "Sign in"
      end

      it { should have_selector('title', text: user.name) }
      it { should have_link('Log out', href: signout_path) }
      it { should_not have_link('Log in', href: signin_path) }
    end
  end
end
