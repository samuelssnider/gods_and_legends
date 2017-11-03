class User < ApplicationRecord
  has_secure_password
  has_many :orders

  validates :password,        presence: true
  validates :email, :username, presence: true, uniqueness: true
end