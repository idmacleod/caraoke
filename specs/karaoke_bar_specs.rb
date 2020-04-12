require('minitest/autorun')
require('minitest/reporters')
MiniTest::Reporters.use! MiniTest::Reporters::SpecReporter.new

require_relative('../karaoke_bar')
require_relative('../room')
require_relative('../drink')
require_relative('../sushi')
require_relative('../song')
require_relative('../guest')

class KaraokeBarTest < MiniTest::Test

    def setup()
        @room = Room.new("Little Blue Room", 4, 5.00)
        @room2 = Room.new("Big Red Room", 15, 10.00)
        @room3 = Room.new("Tiny Green Room", 2, 2.00)
        @room4 = Room.new("Silver Suite", 30, 15.00)
        @rooms = [@room, @room2, @room3, @room4]
        @drink = Drink.new("Sawanotsuru", :sake, 5.00, 20)
        @drink2 = Drink.new("Kirin Ichiban", :beer, 2.50, 5)
        @drink3 = Drink.new("Dassai Limited Edition", :sake, 25.00, 16)
        @drink4 = Drink.new("Coca-Cola", :soft, 2.00, 0)
        @drink_stock = {@drink => 100, @drink2 => 150, @drink3 => 5, @drink4 => 500}
        @sushi = Sushi.new("Dragon Roll", :maki, 4.50, false)
        @sushi2 = Sushi.new("Special Deluxe Garden Banquet", :set, 16.50, true)
        @sushi3 = Sushi.new("Salmon Nigiri", :nigiri, 4.00, false)
        @sushi4 = Sushi.new("Edamame", :snack, 2.50, true)
        @sushi_stock = {@sushi => 50, @sushi2 => 5, @sushi3 => 100, @sushi4 => 200}
        @bar = KaraokeBar.new("Sakura", @rooms, @drink_stock, @sushi_stock)
        @song = Song.new("My Way", "Frank Sinatra")
        @guest = Guest.new("Scarlett", 35, 1000000.00, @song, false)
        @guest2 = Guest.new("Poor Joe", 81, 2.50, @song, true)
        @guest3 = Guest.new("Brad", 56, 1000000.00, @song, true)
        @guest4 = Guest.new("Young Joe", 4, 20.00, @song, false)
    end

    def test_bar_has_name()
        assert_equal("Sakura", @bar.name)
    end

    def test_bar_has_rooms()
        assert_equal(4, @bar.rooms.length)
        assert_equal(Room, @bar.rooms[0].class)
    end

    def test_bar_has_drinks()
        assert_equal(4, @bar.drink_stock.length)
        assert_equal(Drink, @bar.drink_stock.keys[0].class)
    end

    def test_bar_has_sushi()
        assert_equal(4, @bar.sushi_stock.length)
        assert_equal(Sushi, @bar.sushi_stock.keys[0].class)
    end

    def test_till_starts_empty()
        assert_equal(0.00, @bar.till)
    end

    def test_bar_can_sell_drink_to_guest
        @bar.sell_drink_to_guest(@drink, @guest)
        assert_equal(999995.00, @guest.wallet)
        assert_equal(5.00, @bar.till)
        assert_equal(99, @bar.stock_count(@drink))
    end

    def test_bar_can_sell_sushi_to_guest
        @bar.sell_sushi_to_guest(@sushi, @guest)
        assert_equal(999995.50, @guest.wallet)
        assert_equal(4.50, @bar.till)
        assert_equal(49, @bar.stock_count(@sushi))
    end

end