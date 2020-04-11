class Room

    attr_reader :name, :capacity, :entry_fee, :guests, :playlist, :takings

    def initialize(name, capacity, entry_fee)
        @name = name
        @capacity = capacity
        @entry_fee = entry_fee
        @guests = []
        @playlist = []
        @takings = 0.00
    end

    def is_full?()
        return @guests.length == @capacity
    end

    def check_in(guest)
        if !@guests.include?(guest) && !is_full?() && guest.can_afford?(@entry_fee)
            guest.pay(@entry_fee)
            @takings += @entry_fee
            @guests << guest
        end
    end

    def check_out(guest)
        @guests.delete(guest)
    end

    def add_song(song)
        @playlist << song
    end

    def remove_song(song)
        @playlist.delete(song)
    end
    
end