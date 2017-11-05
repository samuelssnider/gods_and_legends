class Book
  attr_reader :link, :title, :authors, :publisher, :image
  def initialize(attrs)
    @link      = attrs[:selfLink]
    @title     = attrs[:volumeInfo][:title]
    @authors   = attrs[:volumeInfo][:authors]
    @publisher = attrs[:volumeInfo][:publisher]
    @image     = attrs[:volumeInfo][:imageLinks][:thumbnail] if attrs[:volumeInfo][:imageLinks]
  end
end
     