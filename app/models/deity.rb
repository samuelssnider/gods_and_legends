class Deity < ApplicationRecord
  validates :name, :tier, :mythology, presence: true
  
  enum gender: [:male, :female, :unknown, :hermaphriditic, :none]
  enum tier:   [:founder, :greater_god, :god, :lesser_god, :demi_god]
  enum 
end
