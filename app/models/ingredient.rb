class Ingredient < ActiveRecord::Base
  attr_accessible :amount, :name, :preparation, :unit
  belongs_to :recipe
  
  validates :name, presence: true
end
