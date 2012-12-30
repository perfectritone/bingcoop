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
        return "#{self.unit} #{name}"
      else
        return name
      end
    end      
  end
  
end

=begin
 5 oz lemon peel
 1 whole carrot
 lemon
=end
