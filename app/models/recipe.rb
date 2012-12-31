class Recipe < ActiveRecord::Base

  DISH_TYPES={""=>"", "Breakfast"=>"breakfast", "Lunch"=>"lunch", "Soup"=>"soup", "Entree"=>"entree", "Desert"=>"desert"}
  SEASONS={"Any Season"=>"any", "Fall"=>"fall", "Winter"=>"winter", "Spring"=>"spring", "Summer"=>"summer"}
  DIETS={""=>"", "Vegan"=>"vegan", "Vegetarian"=>"vegetarian", "Omnivore"=>"omnivore"}
  
  DISH_TYPES_R={""=>"", "breakfast"=>"Breakfast", "lunch"=>"Lunch", "soup"=>"Soup", "entree"=>"Entree", "desert"=>"Desert"}
  SEASONS_R={"any"=>"Any Season", "fall"=>"Fall", "winter"=>"Winter", "spring"=>"Spring", "summer"=>"Summer"}
  DIETS_R={""=>"", "vegan"=>"Vegan", "vegetarian"=>"Vegetarian", "omnivore"=>"Omnivore"}

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

  private
  
    STRING_ATTRIBUTES = [:dish_type, :season, :diet]
    
end
