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

    def self.print_book(index)
        book = self.all[index-1]
        puts book.title
        puts book.author
        puts book.description
        puts "Buy here: #{book.url}"
    end

end