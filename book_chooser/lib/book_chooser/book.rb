class BookChooser::Book
    attr_accessor :title, :url, :author, :description, :time_on_list, :genre

    @@all = []

    def initialize(book_hash)
        book_hash.each { |key, value| self.send(("#{key}="), value)}
        @@all << self
    end

    def genre=(genre)
        @genre = genre
        BookChooser::Genre.find_genre(genre).books << self
    end

    def self.all
        @@all
    end

    def self.print_book_from_genre(genre, index)
        book = genre.books[index-1]
        (book.title.length+book.author.length+1).times{print "-"}
        puts "\n" + book.title + " " + book.author
        (book.title.length+book.author.length+1).times{print "-"}
        puts "\n##{index} in #{genre.name}"
        puts "Time on NY Times Best Sellers list: #{book.time_on_list}"
        puts "Summary: #{book.description}"
        puts "Buy here: " + book.url.colorize(:light_blue)
        puts "\n"
    end

end