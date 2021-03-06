class Guest

    attr_reader :name, :age, :wallet, :favourite_song, :is_vegetarian

    def initialize(name, age, wallet, favourite_song, is_vegetarian)
        @name = name
        @age = age
        @wallet = wallet
        @favourite_song = favourite_song
        @is_vegetarian = is_vegetarian
    end

    def can_afford?(cash)
        return @wallet >= cash
    end

    def pay(cash)
        @wallet -= cash if can_afford?(cash)
    end

    def cheer(room)
        if room.playlist.include?(@favourite_song)
            return "Yay! '#{@favourite_song.title}' is my favourite song!"
        else
            return "Let's add some cool music to the playlist!"
        end
    end

end