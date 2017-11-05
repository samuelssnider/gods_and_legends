class Mythology < ApplicationRecord
  validates :name, :origin_story, presence: true, uniqueness: :true
  
  has_many :deities
  
  def find_books_with_subject(number = 40)
    BookSearch.find_books_with_subject({title: self.name, subject: self.class.name, number: number})
  end
end
