# == Schema Information
#
# Table name: websites
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  kind       :string(255)
#  location   :string(255)
#  url        :string(255)
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Website < ActiveRecord::Base
  attr_accessible :kind, :location, :name, :url
  
  validates_presence_of :name
  validates_presence_of :url
  
  def to_s
    if self.location.present?
      "#{self.name} (#{self.location})"
    else
      "#{self.name}"
    end
  end
end
