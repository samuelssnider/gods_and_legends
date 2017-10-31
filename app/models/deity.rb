class Deity < ApplicationRecord
  validates :name, :tier, :mythology, presence: true
  
  has_many :child_births, foreign_key: :parent_id, class_name: "Birth" 
  has_many :children, through: :child_births, source: :follower
  has_many :parent_births, foreign_key: :follower_id, class_name: "Birth"    
  has_many :parents, through: :parent_births, source: :parent
  
  
  has_many :deities, through: :deity_children
  
  enum gender:    [:male, :female, :unknown, :hermaphriditic]
  enum tier:      [:founder, :greater_god, :god, :lesser_god, :demi_god]
  enum mythology: [:norse, :greek]
end
