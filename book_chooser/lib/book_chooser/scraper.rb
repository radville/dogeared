class BookChooser::Scraper

    def get_genres
        doc = Nokogiri::HTML(open("https://www.nytimes.com/books/best-sellers"))
        doc.css(".css-nzgijy").each do |genre|
            genre = BookChooser::Genre.new
            genre.name = doc.css(".css-nzgijy").text
            genre.url = "https://www.nytimes.com" + doc.css(".css-nzgijy")["href"]
        end
    end
end
# BookChooser:Scraper.get_genres("https://www.nytimes.com/books/best-sellers")