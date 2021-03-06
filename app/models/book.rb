# == Schema Information
#
# Table name: books
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  author     :string(255)
#  kind       :string(255)
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Book < ActiveRecord::Base
  attr_accessible :author, :kind, :name
  
  def to_s
    if self.name.present?
      "#{self.name} by #{self.author}"
    else
      self.author
    end
  end
end
