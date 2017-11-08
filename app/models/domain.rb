class Domain < ApplicationRecord
  has_many :deity_domains
  has_many :deities, through: :deity_domains
end
