class Guest

    attr_reader :name, :age, :wallet, :favourite_song, :is_vegetarian

    def initialize(name, age, wallet, favourite_song, is_vegetarian)
        @name = name
        @age = age
        @wallet = wallet
        @favourite_song = favourite_song
        @is_vegetarian = is_vegetarian
    end

end