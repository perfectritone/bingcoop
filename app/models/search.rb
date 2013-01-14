class Search
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming
  
  attr_accessor :diet, :dish_type, :season, :raw, :gluten_free
  
  #validates :diet, array: { inclusion: { in: Recipe::DIETS.values } }
  #validates :season, array: { inclusion: { in: Recipe::DIETS.values } }
  #validates :dish_type, array: { inclusion: { in: Recipe::DIETS.values } }
  validate :diet_inclusion
  validate :season_inclusion
  validate :dish_type_inclusion

  def recipes
    find_recipes
  end
  
  def initialize(attributes={})
    unless attributes.blank?
      attributes.each do |name, value|
        send("#{name}=", value)
      end
    end
  end  
  
  def persisted?
    false
  end
    
  private
    SEARCH_OPTIONS = { string: [:diet, :dish_type],
                       boolean: [:gluten_free, :raw] }
    def find_recipes   
      conditions = Hash.new
      SEARCH_OPTIONS[:string].each do |option|
        conditions[option] = self.send(option) unless self.send(option).nil?
      end
      SEARCH_OPTIONS[:boolean].each do |option|
        conditions[option] = (self.send(option) == '1') unless self.send(option).nil?
      end
      unless self.season.nil?
        unless self.season.length == 4
          conditions[:season] = self.season 
        end
      end
      
      Recipe.find(:all, :conditions => conditions)
    end
    
    def diet_inclusion
      if self.diet.is_a? Enumerator
        self.diet.each do |d|
          unless Recipe::DIETS.include d
            errors.add(:diet, "must be included in the list")
          end
        end
      end
    end
       
    def season_inclusion
      if self.season.is_a? Enumerator
        self.season.each do |d|
          unless Recipe::SEASONS.include d
            errors.add(:season, "must be included in the list")
          end
        end
      end
    end 
    
    def dish_type_inclusion
      if self.dish_type.is_a? Enumerator
        self.dish_type.each do |d|
          unless Recipe::DISH_TYPES.include d
            errors.add(:dish_type, "must be included in the list")
          end
        end
      end
    end


=begin

    def find_recipes    
      Recipe.find(:all, :conditions => conditions)
    end
    
    def diet_conditions
      ["recipes.diet LIKE ?", self.diet] unless self.diet.blank?
    end
    
    def dish_type_conditions
      ["recipes.dish_type LIKE ?", self.dish_type] unless self.dish_type.blank?
    end
    
    def season_conditions
      ["recipes.season LIKE ?", self.season] unless self.season.blank?
    end
    
    def raw_conditions
      ["recipes.raw LIKE ?", self.raw] unless self.raw.blank?
    end
    
    def gluten_free_conditions
      ["recipes.gluten_free LIKE ?", self.gluten_free] unless self.gluten_free.blank?
    end
    
    def conditions
      [conditions_clauses.join(' AND '), *conditions_options]
    end

    def conditions_clauses
      conditions_parts.map { |condition| condition.first }
    end

    def conditions_options
      conditions_parts.map { |condition| condition[1..-1] }.flatten
    end

    def conditions_parts
      private_methods(false).grep(/_conditions$/).map { |m| send(m) }.compact
    end
=end
end
