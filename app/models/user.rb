class User < ApplicationRecord

  attr_accessor :remember_token

  before_save { self.name = name.downcase }

  VALID_NAME_REGEX = /\A[a-z\d][a-z\d-]*[a-z\d]\z/i
  validates :name,  presence: true, length: { maximum: 35 },
                    format: { with: VALID_NAME_REGEX },
                    uniqueness:  {case_sensitive: false }
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true

  def self.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  def self.new_token
    SecureRandom.urlsafe_base64
  end

  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  def forget
    update_attribute(:remember_digest, nil)
  end

  def authenticated?(remember_token)
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end
end
