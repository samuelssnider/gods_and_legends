class Deity < ApplicationRecord
  validates :tier, :gender, :mythology_id, :classification, presence: true
  validates :name, :description, presence: true, uniqueness: :true
  
  has_many :child_births, foreign_key: :parent_id, class_name: "Birth" 
  has_many :children, through: :child_births, source: :child
  has_many :parent_births, foreign_key: :child_id, class_name: "Birth"    
  has_many :parents, through: :parent_births, source: :parent
  has_many :event_actors
  has_many :events, through: :event_actors
  has_many :deity_domains
  has_many :domains, through: :deity_domains
  
  belongs_to :mythology
  
  
  # has_many :deities, through: :deity_children
  
  enum gender:    [:male, :female, :unknown, :hermaphriditic]
  enum tier:      ["Founder", "Greater God", "God", "Lesser God", "Demi-god"]
  
  def find_books_with_subject(number = 5)
    BookSearch.find_books_with_subject({title: self.name, number: number})
  end
  
  def siblings
    parent_one_siblings = Birth.where(parent: parents.first).map do |birth|
      unless birth.child == self 
        birth.child
      end
    end.compact!
    if parents.second
      parent_two_siblings = Birth.where(parent: parents.second).map do |birth|
        unless birth.child == self 
          birth.child
        end
      end.compact!
      full_siblings = parent_one_siblings.select do |sibling|
        parent_two_siblings.include?(sibling)
      end
    else
      full_siblings = parent_one_siblings
    end
    full_siblings
  end
  
end
