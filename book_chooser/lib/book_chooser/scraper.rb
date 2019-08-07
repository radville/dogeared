class BookChooser::Scraper

    def get_genres
        doc = Nokogiri::HTML(open("https://www.nytimes.com/books/best-sellers"))
        doc.css(".css-nzgijy").each do |g|
            genre = BookChooser::Genre.new
            genre.name = g.text
            genre.url = "https://www.nytimes.com" + g["href"]
        end
    end

    def self.get_books(genre_url)
        doc = Nokogiri::HTML(open(genre_url))
        books_array = []
        doc.css(".css-1k9h61").each do |book|
            hash = {}
            hash[:author] = book.css("p.css-1j7a9fx").text
            hash[:title] = book.css(".css-5pe77f").text.split.map(&:capitalize).join(' ')
            hash[:description] = book.css(".css-14lubdp").text
            hash[:url] = book.css(".css-wq7ea0")[0]["href"]
            hash[:time_on_list] = book.css(".css-1o26r9v").text 
            hash[:genre] = doc.css(".css-1sezlx").text.split("- ")[0]
            books_array << hash
        end
        books_array
    end

    def self.make_books(genre_url)
        self.get_books(genre_url).each do |book|
            BookChooser::Book.new(book)
        end
    end
end