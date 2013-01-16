class Product < ActiveRecord::Base
  attr_accessible :description, :name, :price, :food_type, :diet
  
  FOOD_TYPES = { 
    "Desserts & Snacks"=>"dessert_or_snack",
    "Beverages"=>"beverage",
    "Pizza"=>"pizza",
  }
  PRICE_FORMAT = "%.2f"
  
  before_validation do
    self.price.gsub!('$','') if self.price.respond_to? :gsub!
  end
  
  validates_inclusion_of :diet, { in: Recipe::DIETS.values }
  validates_inclusion_of :food_type, { in: FOOD_TYPES.values }
  validates_length_of :description, { maximum: 255 }
  validate :name, length: { maximum: 255 },
                  presence: true
  validates_numericality_of :price
  
  # Name - $9.99
  # Description, Diet
  def to_s
    to_return = self.name.sentence_case
    to_return += " - $#{PRICE_FORMAT % self.price}" unless self.price.nil?
    to_return += "\n"
    to_return += self.description.sentence_case unless self.description.nil?
    to_return += ", #{self.diet.sentence_case}" unless self.diet.nil?     
  end 
   
  def to_haml
    to_return = self.name.sentence_case
    to_return += " - <b>$#{PRICE_FORMAT % self.price}</b>" unless self.price.nil?
    to_return += "<br>"
    to_return += self.description.sentence_case unless self.description.nil?
    to_return += ", #{self.diet.sentence_case}" unless self.diet.nil? 
  end
end

class String
  def sentence_case
    to_return = self
    to_return[0] = to_return[0].upcase
    to_return
  end
end
