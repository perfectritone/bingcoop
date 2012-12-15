class User < ActiveRecord::Base
  attr_accessible :name, :email, :password, :password_confirmation
  has_many :recipes, dependent: :destroy
  has_many :ingredients
  
  has_secure_password

  before_save { self.email.downcase! }
  before_save :create_remember_token

  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence:   true,
                    format:     { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates :password,  length: { minimum: 6 },
                        confirmation: true
  validates :password_confirmation, presence: true
  
  validates_associated :recipes
  
  private
    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end
end
