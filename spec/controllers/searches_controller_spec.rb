require File.dirname(__FILE__) + '/../spec_helper'

describe SearchesController do
  fixtures :recipes#, :searches
  render_views

  #let(:search) { searches(:breakfast_vegetarian) }

  describe "#new" do
    it "should create a blank search and not direct" do
      get :new, :format => :json

      assigns[:search].class.should == Search
      response.should_not be_redirect
    end
  end

  describe "#create" do
    it "not redirect" do
      Search.any_instance.stubs(:recipes).returns("recipes_search")
      Search.any_instance.stubs(:valid?).returns(true)
=begin
      post :create, :format => :json

      assigns[:recipes].should == "recipes_search"
      response.should_not be_redirect
      response.should render_template :create # how to do it like implementation?
=end
    end

    it "should pass params to search on create" do
      params = {  
        search: {
          diet: "vegetarian"
        }
      }
      #post 'create', params, :format => :json
      #assigns[:search].diet.should == params[:search][:diet]
    end
  end
end