class Event < ApplicationRecord
  has_many :event_actors
  has_many :deities, through: :event_actors
  
  validates :title, :description, presence: true, uniqueness: true
end
