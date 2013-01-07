# == Schema Information
#
# Table name: movies
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  kind       :string(255)
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  url        :string(255)
#

class Movie < ActiveRecord::Base
  attr_accessible :kind, :name, :url
  
  def to_s
    if self.url.present?
      "<a href=\"#{self.url}\"> #{self.name} </a>"
    else
      self.name
    end
  end
end
