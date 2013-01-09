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

class Suggestion < ActiveRecord::Base
  attr_accessible :name, :email, :message
  
  validates_length_of :message, maximum: 4096, allow_blank: true
  
end
