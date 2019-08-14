class DogEared::Scraper

    def get_genres
        doc = Nokogiri::HTML(open("https://www.nytimes.com/books/best-sellers"))
        doc.css(".css-nzgijy").each do |g|
            genre = DogEared::Genre.new
            genre.name = g.text
            genre.url = "https://www.nytimes.com" + g["href"]
        end
    end

    def self.get_books(genre_url)
        @genre_doc = Nokogiri::HTML(open(genre_url))
        @genre_doc.css(".css-1k9h61")
    end

    def self.make_books(genre)
        if genre.books.length == 0
            self.get_books(genre.url).each { |book| DogEared::Book.new_from_scraper(book, @genre_doc) }
        end
    end
end