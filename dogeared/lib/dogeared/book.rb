class DogEared::Book
    attr_accessor :title, :url, :author, :description, :time_on_list, :genre

    @@all = []

    def initialize(book_hash)
        book_hash.each { |key, value| self.send(("#{key}="), value)}
        @@all << self
    end

    def self.new_from_scraper(book, doc)
        hash = {}
        hash[:author] = book.css("p.css-1j7a9fx").text
        hash[:title] = book.css(".css-5pe77f").text.split.map(&:capitalize).join(' ')
        hash[:description] = book.css(".css-14lubdp").text
        hash[:url] = book.css(".css-wq7ea0")[0]["href"]
        hash[:genre] = doc.css(".css-1sezlx").text.split("- ")[0]
        if book.css(".css-1o26r9v").text == "New this week"
            time_on_list = book.css(".css-1o26r9v").text
        else
            time_on_list = "#{book.css(".css-1o26r9v").text.split[0]} weeks"
        end
        hash[:time_on_list] = time_on_list
        self.new(hash)
    end

    def genre=(genre)
        @genre = genre
        DogEared::Genre.find_genre(genre).books << self
    end

    def self.all
        @@all
    end

    def self.print_book_from_genre(genre, index)
        book = genre.books[index-1]
        (book.title.length+book.author.length+1).times{print "~"}
        puts "\n" + book.title + " " + book.author
        (book.title.length+book.author.length+1).times{print "~"}
        puts "\n##{index}".colorize(:green) + " in #{genre.name}"
        puts "Time on NY Times Best Sellers list:".colorize(:green) + " #{book.time_on_list}"
        puts "Summary:".colorize(:green) + " #{book.description}"
        puts "Buy here: ".colorize(:green) + book.url.colorize(:light_blue)
        puts "\n"
    end

end