require 'spec_helper'

# Specs in this file have access to a helper object that includes
# the RecipesHelper. For example:
#
# describe RecipesHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       helper.concat_strings("this","that").should == "this that"
#     end
#   end
# end


RSpec::Matchers.define :be_valid do
  match do |model|
    model.valid?
  end

  failure_message_for_should do |model|
    "expected valid? to return true, got false:\n #{model.errors.full_messages.join("\n ")}"
  end

  failure_message_for_should_not do |model|
    "expected valid? to return false, got true"
  end

  description do
    "be valid"
  end
end

