class Recipe < ActiveRecord::Base
  attr_accessible :diet, :directions, :name, :season, :dish_type
  # Do NOT include user_id in the attr_accessible method, to avoid
  # the possibility of it being changed externally.
  belongs_to :user
  has_many :ingredients, dependent: :destroy
  
  validates :user_id, presence: true
  validates :name,  presence: true,
                    length: { maximum: 64 },
                    uniqueness: true
  validates :dish_type, inclusion: { in: %w(breakfast lunch soup entree desert) }
  validates :season, inclusion: { in: %w(fall winter spring summer any) }
  validates :diet, inclusion: { in: %w(vegan vegetarian omnivore) }
  validates :directions,  presence: true,
                          length: { maximum: 1024 }
                          
  validates_associated :ingredients
                          
  default_scope order: "recipes.created_at DESC"
end
