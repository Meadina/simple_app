class User < ApplicationRecord

  attr_accessor :remember_token

  VALID_NAME_REGEX = /\A[a-z\d][a-z\d-]*[a-z\d]\z/i
  validates :name,  presence: true, length: { maximum: 35 },
                    format: { with: VALID_NAME_REGEX },
                    uniqueness:  {case_sensitive: false }
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true


end
