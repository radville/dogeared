class BookChooser::Book
    attr_accessor :name, :url, :author, :description, :time_on_list

    @@all = []

    def initialize
        BookChooser::Genre.books << self
        @@all << self
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