class BookChooser::Genre
    attr_accessor :name, :url

    @@all = []

    def initialize
        @@all << self
    end

    def self.all
        @@all
    end

end