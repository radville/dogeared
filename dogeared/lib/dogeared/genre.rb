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
        puts "Top books in #{genre.name}:".bold.colorize(:green)
        genre.books.each_with_index { |book, i| puts "#{i+1}. #{book.title} #{book.author}" }
    end

    def self.list_books(genre)
        puts "Top books in #{genre.name}:".bold.colorize(:green)
        genre.books.each { |book| puts "   #{book.title} #{book.author}" }
    end

    def self.list_new_books(genre)
        puts "New books this week in #{genre.name}:".bold.colorize(:green)
        if genre.books.any? { |book| book.time_on_list == "New this week"}
            genre.books.each do |book| 
                puts "   #{book.title} #{book.author}" if book.time_on_list == "New this week"
            end
        else
            puts "No new books this week. Check back next week!"
        end
    end

    def self.find_genre(genre_name)
        self.all.detect { |genre| genre.name == genre_name }
    end

    def self.print_all_genres
        puts "Genres".bold.colorize(:green)
        self.all.each_with_index { |genre, index| puts "   #{index+1}. #{genre.name}" }
    end

end