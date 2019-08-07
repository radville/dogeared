class BookChooser::Book
    attr_accessor :name, :url, :author, :description, :time_on_list

    @@all = []

    def initialize(book_hash)
        book_hash.each { |key, value| self.send(("#{key}="), value)}
        BookChooser::Genre.books << self
        @@all << self
    end

    def self.create_from_book_list(books_array)
        books_array.each do |book|
            self.new(book)
        end
    end

    def self.all
        @@all
    end

    def self.print_book(index)
        book = self.all[index-1]
        puts book.name
        puts "by #{book.author}"
        puts book.description
        puts "Buy here: #{book.url}"
    end

end