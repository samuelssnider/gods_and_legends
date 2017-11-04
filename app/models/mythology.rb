class Mythology < ApplicationRecord
  validates :name, :origin_story, presence: true, uniqueness: :true
  
  has_many :deities
end
