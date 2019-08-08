class DogEared::Genre
    attr_accessor :name, :url, :books

    @@all = []

    def initialize
        @books = []
        @@all << self
    end

    def self.all
        @@all
    end

    def self.list_books_numbered(genre)
        DogEared::Scraper.make_books(genre.url) unless genre.books.length > 0
        puts "Top books in #{genre.name}:".bold.colorize(:green)
        genre.books.each_with_index { |book, i| puts "#{i+1}. #{book.title} #{book.author}" }
    end

    def self.list_books(genre)
        DogEared::Scraper.make_books(genre.url) unless genre.books.length > 0
        puts "Top books in #{genre.name}:".bold.colorize(:green)
        genre.books.each { |book| puts "   #{book.title} #{book.author}" }
    end

    def self.find_genre(genre_name)
        self.all.detect do |genre|
            genre.name == genre_name
        end
    end

    def self.print_all_genres
        puts "Genres".bold.colorize(:green)
        self.all.each_with_index { |genre, index| puts "   #{index+1}. #{genre.name}" }
    end

    def self.print_genre(index) ##do I need this?
        genre = self.all[index-1]
        puts genre.name
    end

end