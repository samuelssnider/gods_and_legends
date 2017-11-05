class BookSearch
  def self.find_books_with_title(name, number)
    conn = Faraday.new(url: "https://www.googleapis.com/books/v1/volumes?q=intitle:#{name}&maxResults=#{number}&api_key=#{ENV['google_api_key']}") do |faraday|
      faraday.adapter Faraday.default_adapter
    end
    raw_books = JSON.parse(conn.get.body, symbolize_names: true)
    raw_books[:items].map do |raw_book|
      Book.new(raw_book)
    end
  end
end