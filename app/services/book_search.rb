class BookSearch
  
  def parse_results(conn)
    JSON.parse(conn.body, symbolize_names: true)
  end
  
  
  # def base_url
  #   @conn = "https://www.googleapis.com/books/v1/volumes"
  # end
  
  def simple_params(parameters)
    conn_params = ""
    conn_params << "intitle:#{parameters[:title].parameterize}" if parameters[:title]
    conn_params << "&subject:#{parameters[:subject]}" if parameters[:subject]
    conn_params << "&max_results=#{parameters[:number]}"
  end
  
  
  def get_url(parameters)
    conn_params = simple_params(parameters)
    Faraday.get("https://www.googleapis.com/books/v1/volumes?q=#{conn_params}")
  end
  
  def self.find_books_with_subject(parameters)
    BookSearch.new.find_books_with_subject(parameters)
  end
  
  def find_books_with_subject(parameters)
    raw_books = parse_results(get_url(parameters))
    unless raw_books[:totalItems] == 0
      raw_books[:items].map do |raw_book|
        Book.new(raw_book)
      end
    end
  end
    
end