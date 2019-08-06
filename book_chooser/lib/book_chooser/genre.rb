class BookChooser::Genre
    attr_accessor :name, :url

    @@all = []

    def initialize
        @@all << self
    end

    def self.all
        @@all
    end

    def self.print_genre(index)
        genre = self.all[index-1]
        puts genre.name
    end

end