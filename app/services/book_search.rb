class BookSearch
  
  def parse_results(conn)
    JSON.parse(conn.get.body, symbolize_names: true)
  end
  
  
  def get_url(parameters)
    conn = Faraday.new(url: "https://www.googleapis.com/books/v1/volumes") do |faraday|
      faraday.adapter Faraday.default_adapter
      faraday.headers["api_key"] = ENV['google_api_key']
      faraday.params["q"] = "intitle:#{parameters[:title]}" if parameters[:title]
      faraday.params["maxResults"] = parameters[:number] if parameters[:number]
      faraday.params.merge!("q": "subject:#{parameters[:subject]}") if parameters[:subject]
    end
  end
  
  
  def self.find_books_with_subject(parameters)
    BookSearch.new.find_books_with_subject(parameters)
  end
  
  def find_books_with_subject(parameters)
    raw_books = parse_results(get_url(parameters))
    raw_books[:items].map do |raw_book|
      Book.new(raw_book)
    end
  end
    
end