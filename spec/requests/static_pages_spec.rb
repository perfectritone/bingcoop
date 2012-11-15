require 'spec_helper'

describe "StaticPages" do
  describe "GET /static_pages" do
    it "should have the content 'Binghamton Food Co-Op'" do
      visit '/static_pages/home'
      page.should have_content('Binghamton Food Co-Op')
    end
  end
end
