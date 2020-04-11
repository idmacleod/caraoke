require('minitest/autorun')
require('minitest/reporters')
MiniTest::Reporters.use! MiniTest::Reporters::SpecReporter.new

require_relative('../karaoke_bar')
require_relative('../room')
require_relative('../drink')
require_relative('../sushi')

class KaraokeBarTest < MiniTest::Test

    def setup()
        @room1 = Room.new("Little Blue Room", 4, 5.00)
        @room2 = Room.new("Big Red Room", 15, 10.00)
        @room3 = Room.new("Tiny Green Room", 2, 2.50)
        @room4 = Room.new("Silver Suite", 30, 15.00)
        @rooms = [@room1, @room2, @room3, @room4]
        @drink1 = Drink.new("Sawanotsuru", :sake, 5.00, 20)
        @drink2 = Drink.new("Kirin Ichiban", :beer, 2.50, 5)
        @drink3 = Drink.new("Dassai Limited Edition", :sake, 25.00, 16)
        @drink4 = Drink.new("Coca-Cola", :soft, 2.00, 0)
        @drink_stock = {@drink1 => 100, @drink2 => 150, @drink3 => 5, @drink4 => 500}
        @sushi1 = Sushi.new("Dragon Roll", :maki, 4.50, false)
        @sushi2 = Sushi.new("Special Deluxe Garden Banquet", :set, 16.50, true)
        @sushi3 = Sushi.new("Salmon Nigiri", :nigiri, 4.00, false)
        @sushi4 = Sushi.new("Edamame", :snack, 2.50, true)
        @sushi_stock = {@sushi1 => 50, @sushi2 => 5, @sushi3 => 100, @sushi4 => 200}
        @karaoke_bar = KaraokeBar.new("Sakura", @rooms, @drink_stock, @sushi_stock)
    end

    def test_bar_has_name()
        assert_equal("Sakura", @karaoke_bar.name)
    end

    def test_bar_has_rooms()
        assert_equal(4, @karaoke_bar.rooms.length)
        assert_equal(Room, @karaoke_bar.rooms[0].class)
    end

    def test_bar_has_drinks()
        assert_equal(4, @karaoke_bar.drink_stock.length)
        assert_equal(Drink, @karaoke_bar.drink_stock.keys[0].class)
    end

    def test_bar_has_sushi()
        assert_equal(4, @karaoke_bar.sushi_stock.length)
        assert_equal(Sushi, @karaoke_bar.sushi_stock.keys[0].class)
    end

end