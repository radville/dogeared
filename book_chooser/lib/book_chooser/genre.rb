class BookChooser::Genre
    attr_accessor :name, :url, :books

    @@all = []

    def initialize
        @books = []
        @@all << self
    end

    def self.all
        @@all
    end

    def self.find_genre(genre_name)
        self.all.detect do |genre|
            genre.name == genre_name
        end
    end

    def self.print_genre(index) ##do I need this?
        genre = self.all[index-1]
        puts genre.name
    end

end