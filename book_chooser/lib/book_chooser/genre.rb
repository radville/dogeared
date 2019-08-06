class BookChooser::Genre
    attr_accessor :name, :url

    @@all == []

    def initialize
        @@all << self
    end

    def all
        @@all
    end

end