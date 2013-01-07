# == Schema Information
#
# Table name: recipes
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  dish_type  :string(255)
#  season     :string(255)
#  diet       :string(255)
#  directions :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#

class Recipe < ActiveRecord::Base

  DISH_TYPES={"Any Dish Type"=>"", "Breakfast"=>"breakfast", "Lunch"=>"lunch", "Soup"=>"soup", "Entree"=>"entree", "Dessert"=>"dessert", "Juice"=>"juice"}
  SEASONS={"Any Season"=>"", "Fall"=>"fall", "Winter"=>"winter", "Spring"=>"spring", "Summer"=>"summer"}
  DIETS={"Any Diet"=>"", "Vegan"=>"vegan", "Vegetarian"=>"vegetarian", "Meat"=>"meat"}
  
  DISH_TYPES_R={""=>"Any Dish Type", "breakfast"=>"Breakfast", "lunch"=>"Lunch", "soup"=>"Soup", "entree"=>"Entree", "dessert"=>"Dessert", "juice"=>"Juice"}
  SEASONS_R={""=>"Any Season", "fall"=>"Fall", "winter"=>"Winter", "spring"=>"Spring", "summer"=>"Summer"}
  DIETS_R={""=>"Any Diet", "vegan"=>"Vegan", "vegetarian"=>"Vegetarian", "meat"=>"Meat"}

  attr_protected :user_id
  # Do NOT include user_id in the attr_accessible method, to avoid
  # the possibility of it being changed externally.
  belongs_to :user
  validates_presence_of :user  
  has_many :ingredients, dependent: :destroy, inverse_of: :recipe
  
  # attributes_acceptable :ingredients_attributes
  # Allows for forms to write attributes down the hierarchy.
  accepts_nested_attributes_for :ingredients, allow_destroy: true, reject_if: lambda { |a| a[:name].blank? }
  
  before_save do
    # Lowercase and convert to strings all of the attributes
    # that require a specific format, namely the values in the
    # constant hashes above.
    STRING_ATTRIBUTES.each do |s|
      self.send("#{s}=".to_sym, self.send(s).downcase.to_s)
    end
  end
  
  validates :user_id, presence: true
  validates :name,  presence: true,
                    length: { maximum: 64 } #,uniqueness: true
  validates :dish_type, inclusion: { in: DISH_TYPES.values }
  validates :season, inclusion: { in: SEASONS.values }
  validates :diet, inclusion: { in: DIETS.values}
  validates :directions,  presence: true,
                          length: { maximum: 8192 }
                          
  validates_associated :ingredients
                      
        
  default_scope order: "recipes.created_at DESC"

  def method_missing (method)
    method = method.to_s
    if method.slice!("display_")
      if STRING_ATTRIBUTES.include?(method.to_sym)
        hash_name = method.upcase + 'S_R'
        Recipe.const_get(hash_name)[self.send(method.to_sym)]
      else
        method
      end
    else 
      method.class
    end
  end


  scope :with_dish_type, lambda {|dish_type| dish_type.present? ? { conditions: {dish_type: dish_type} } : {} }
  scope :with_diet, lambda {|diet| diet.present? ? { conditions: {diet: diet} } : {} }
  scope :with_season, lambda {|season| season.present? ? { conditions: {season: season} } : {} }
  scope :with_gluten_free, lambda {|gf| gf.present? ? { conditions: {gluten_free: (gf == "true") } } : {} }
  scope :with_raw, lambda {|raw| raw.present? ? { conditions: {raw: (raw == "true") } } : {} }

=begin
  scope :with_dish_type, (lambda do |dish_type|
    if dish_type.present?
      { conditions: {dish_type: dish_type} } 
    elsif session[:search].present? && session[:search][:dish_type].present?
      { conditions: {dish_type: session[:search][:dish_type] } }
    else {}
    end
  end)
  scope :with_season, (lambda do |season|
    if season.present?
      { conditions: {season: season} } 
    elsif session[:search][:season].present?
      { conditions: {season: session[:search][:season] } }
    else {}
    end
  end)
  scope :with_diet, (lambda do |diet|
    if diet.present?
      { conditions: {diet: diet} } 
    elsif session[:search][:diet].present?
      { conditions: {diet: session[:search][:diet] } }
    else {}
    end
  end)
=end

  def self.search (search_params)
    if search_params.respond_to? :slice # ensure it quacks like a hash
      unique_search_params = search_params.slice *UNIQUE_SEARCH_OPTIONS
      basic_search_params = search_params.slice *SEARCH_OPTIONS
      
      Recipe.where( basic_search_params )
    end
    #conditions_clauses = search_params.map do |param, value|
    #  send "#{param}_conditions", value
    #end
    #conditions = conditions_clauses.join(' AND ')
    #Recipe.find(:all, :conditions => conditions)
  end

  private
  
    STRING_ATTRIBUTES = [:dish_type, :season, :diet]
      
    SEARCH_OPTIONS = [:diet, :dish_type, :season, :gluten_free, :raw]
    UNIQUE_SEARCH_OPTIONS = [:name, :keyword, :ingredients]


    def self.diet_conditions diet
      ["recipes.diet LIKE ?", "#{diet}"] unless diet.blank?
    end
=begin
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
=end
end
