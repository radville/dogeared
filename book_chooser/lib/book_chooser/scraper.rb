class BookChooser::Scraper

    def get_genres
        doc = Nokogiri::HTML(open("https://www.nytimes.com/books/best-sellers"))
        doc.css(".css-nzgijy").each do |g|
            genre = BookChooser::Genre.new
            genre.name = g.text
            genre.url = "https://www.nytimes.com" + g["href"]
        end
    end
end
# BookChooser:Scraper.get_genres("https://www.nytimes.com/books/best-sellers")