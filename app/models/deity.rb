class Deity < ApplicationRecord
  validates :name, :tier, presence: true
  
  has_many :child_births, foreign_key: :parent_id, class_name: "Birth" 
  has_many :children, through: :child_births, source: :child
  has_many :parent_births, foreign_key: :child_id, class_name: "Birth"    
  has_many :parents, through: :parent_births, source: :parent
  belongs_to :mythology
  
  
  has_many :deities, through: :deity_children
  
  enum gender:    [:male, :female, :unknown, :hermaphriditic]
  enum tier:      ["Founder", "Greater God", "God", "Lesser God", "Demi-god"]
end
