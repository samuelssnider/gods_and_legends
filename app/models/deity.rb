class Deity < ApplicationRecord
  validates :name, :tier, presence: true
  
  has_many :child_births, foreign_key: :parent_id, class_name: "Birth" 
  has_many :children, through: :child_births, source: :child
  has_many :parent_births, foreign_key: :child_id, class_name: "Birth"    
  has_many :parents, through: :parent_births, source: :parent
  has_many :event_actors
  has_many :events, through: :event_actors
  belongs_to :mythology
  
  
  has_many :deities, through: :deity_children
  
  enum gender:    [:male, :female, :unknown, :hermaphriditic]
  enum tier:      ["Founder", "Greater God", "God", "Lesser God", "Demi-god"]
  
  def find_books
    conn = Faraday.new(url: "https://www.googleapis.com/books/v1/volumes?q=intitle:zeus&maxResults=10&api_key=#{ENV['google_api_key']}") do |faraday|
      faraday.apapter Faraday.default_adapter
    end
    raw_stores = JSON.parse(conn.get.body, symbolize_names: true)
    binding.pry
  end
end
