# == Schema Information
#
# Table name: suggestions
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  email      :string(255)
#  message    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe Suggestion do
  let(:suggestion) { FactoryGirl.create(:suggestion) }
  
  subject { suggestion }
  
  it { should respond_to :name }
  it { should respond_to :email}
  it { should respond_to :message }
  
  it { should be_valid }
  
  describe "when the message is too long" do
    before { suggestion.message = "a" * 4097 }
    it { should_not be_valid }
  end
end
