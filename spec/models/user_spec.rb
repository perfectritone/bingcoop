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
  
  describe "remember token" do
    before { @user.save }
    
    its(:remember_token) { should_not be_blank } 
    # same as it { @user.remember_token.should_not be_blank }
  end
end
