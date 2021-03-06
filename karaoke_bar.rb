class KaraokeBar

    attr_reader :name, :rooms, :drink_stock, :sushi_stock, :till

    def initialize(name, rooms, drink_stock, sushi_stock)
        @name = name
        @rooms = rooms
        @drink_stock = drink_stock
        @sushi_stock = sushi_stock
        @till = 0.00
    end

    def stock_count(item)
        return @drink_stock[item] if item.class == Drink
        return @sushi_stock[item] if item.class == Sushi
    end

    def in_stock?(item)
        return false if !stock_count(item)
        return stock_count(item) > 0
    end

    def check_age_ok?(guest, drink)
        return true if drink.alcohol == 0
        return guest.age >= 18
    end

    def check_diet_ok?(guest, sushi)
        return true if !guest.is_vegetarian
        return sushi.is_vegetarian
    end

    def sell_drink_to_guest(drink, guest)
        if in_stock?(drink) && check_age_ok?(guest, drink)
            guest.pay(drink.price)
            @till += drink.price
            @drink_stock[drink] -= 1
        end
    end

    def sell_sushi_to_guest(sushi, guest)
        if in_stock?(sushi) && check_diet_ok?(guest, sushi)
            guest.pay(sushi.price)
            @till += sushi.price
            @sushi_stock[sushi] -= 1
        end
    end

end