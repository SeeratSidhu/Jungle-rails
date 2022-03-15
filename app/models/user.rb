class User < ActiveRecord::Base
  validates :email, presence: true, uniqueness: { case_sensitive: false }

  validates :first_name, presence: true
  validates :last_name, presence: true

  validates :password, presence: true
  validates_length_of :password, minimum: 6, on: :create
  validates_presence_of :password_confirmation
  has_secure_password
end
