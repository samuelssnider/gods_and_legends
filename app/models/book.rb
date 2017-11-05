class Book
  attr_reader :link, :title, :authors, :publisher, :image, :store_link
  def initialize(attrs)
    @api_link      = attrs[:selfLink]
    @title      = attrs[:volumeInfo][:title]
    @authors    = attrs[:volumeInfo][:authors]
    @publisher  = attrs[:volumeInfo][:publisher]
    @image      = attrs[:volumeInfo][:imageLinks][:thumbnail] if attrs[:volumeInfo][:imageLinks]
    @store_link = attrs[:volumeInfo][:infoLink]
  end
end
     