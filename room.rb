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

end