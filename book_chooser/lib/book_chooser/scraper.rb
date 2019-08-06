require "pry"
require "nokogiri"
require "open-uri"

class BookChooser::Scraper

    def self.scrape_genres(main_url)
        doc = Nokogiri::HTML(open(main_url))
        binding.pry
        doc.css(".css-nzgijy").each do |genre|
            genre = BookChooser::Genre.new
            genre.name = doc.css(".css-nzgijy").text
            genre.url = "https://www.nytimes.com" + doc.css(".css-nzgijy")["href"]
        end
        Genre.all
    end


end

Scraper.scrape_genres("https://www.nytimes.com/books/best-sellers")