# == Schema Information
#
# Table name: ingredients
#
#  id         :integer          not null, primary key
#  recipe_id  :integer
#  name       :string(255)
#  unit       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  amount     :string(255)
#

include ActionView::Helpers::TextHelper

class Ingredient < ActiveRecord::Base
  # t.string "name"
  # t.string "amount"
  # t.string "unit"

  attr_protected :id, :recipe_id
  belongs_to :recipe
  
  validates_presence_of :name
  validates_presence_of :recipe
  
  def to_s
    if self.amount.present?
      name = (self.amount.to_r > 1 && self.amount.to_r != 0) ?
                self.name.pluralize : self.name
      if self.unit.present?
        return "#{self.amount} #{self.unit} #{name}"
      else
        return "#{self.amount} #{name}"
      end
    else
      if self.unit.present?
        return "#{self.unit} #{self.name}"
      else
        return self.name
      end
    end      
  end
  
end
