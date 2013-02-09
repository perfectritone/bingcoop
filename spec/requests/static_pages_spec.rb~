require 'spec_helper'

describe "StaticPages" do
  
  subject { page }
  
  describe "Home page" do
    before { visit root_path }
    
    it { should have_content('Binghamton Food Co-Op') }
    it { should have_selector('title', text: full_title ) }
  end

  describe "About" do
    before { visit about_path }
    
    it { should have_content('About') }
    it { should have_selector('title', text: full_title('About') ) }
  end

  describe "Get Involved" do
    before { visit get_involved_path }
    
    it { should have_content('Binghamton Food Co-Op') }
    it { should have_selector('title', text: full_title('Get Involved') ) }
  end

  describe "Products" do
    before { visit products_path }
    
    it { should have_content('Binghamton Food Co-Op') }
    it { should have_selector('title', text: full_title('Product') ) }
  end
  
  describe "Personal Orders" do
    before { visit personal_orders_path }
    
    it { should have_content('Binghamton Food Co-Op') }
    it { should have_selector('title', text: full_title('Personal Orders') ) }
  end
  
  describe "Recipes" do
    before { visit recipes_path }
    
    it { should have_selector('title', text: full_title('Recipes') ) }
  end
  
  describe "Resources" do
    before { visit resources_path }
    
    it { should have_content('Binghamton Food Co-Op') }
    it { should have_selector('title', text: full_title('Resources') ) }
  end
  
  describe "Contact Us" do
    before { visit contact_path }
    
    it { should have_content('Binghamton Food Co-Op') }
    it { should have_selector('title', text: full_title('Contact Us') ) }
  end
  
end
