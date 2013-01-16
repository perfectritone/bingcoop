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
  attr_protected :id, :recipe_id
  belongs_to :recipe
  
  # before_validation :destroy_if_blank_on_update
  
  validates_presence_of :name
  validates_presence_of :recipe
  
=begin Not quite working, but clicking the 'x' will suffice
  def destroy_if_blank_on_update
    if self.id
      self.destroy if self.name.blank?
    else true
    end
  end
=end
  
  def to_s
    if self.amount.present?
      name = (self.amount.to_r > 1 && self.amount.to_r != 0) ?
                self.name.pluralize : self.name
      amount = self.amount.capitalize if self.amount.respond_to? :capitalize
      if self.unit.present?
        unit = self.unit.capitalize if self.unit.respond_to? :capitalize
        return "#{amount} #{unit} #{name}"
      else
        return "#{amount} #{name}"
      end
    else
      if self.unit.present?
        unit = self.unit.capitalize if self.unit.respond_to? :capitalize
        return "#{unit} #{self.name}"
      else
        return self.name
      end
    end      
  end
  
  def <=>(other)
    self.created_at <=> other.created_at
  end
  
end
