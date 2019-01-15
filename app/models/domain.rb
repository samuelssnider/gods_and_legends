class Domain < ApplicationRecord
  has_many :deity_domains
  has_many :deities, through: :deity_domains
  
  validates :name, presence: true, uniqueness: :true
  
  
  def find_books_with_subject(number = 5)
    BookSearch.find_books_with_subject({title: "mythology #{self.name}", number: number})
  end
end
