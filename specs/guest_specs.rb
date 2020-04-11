require('minitest/autorun')
require('minitest/reporters')
MiniTest::Reporters.use! MiniTest::Reporters::SpecReporter.new

require_relative('../guest')
require_relative('../song')
require_relative('../room')

class GuestTest < MiniTest::Test

    def setup()
        @song = Song.new("My Way", "Frank Sinatra")
        @song2 = Song.new("Song 2", "Blur")
        @guest = Guest.new("Scarlett", 35, 1000000.00, @song, false)
        @room = Room.new("Little Blue Room", 4, 5.00)
    end

    def test_guest_has_name()
        assert_equal("Scarlett", @guest.name)
    end

    def test_guest_has_age()
        assert_equal(35, @guest.age)
    end

    def test_guest_has_wallet()
        assert_equal(1000000.00, @guest.wallet)
    end

    def test_guest_has_favourite_song()
        assert_equal(Song, @guest.favourite_song.class)
    end

    def test_guest_is_vegetarian()
        refute(@guest.is_vegetarian)
    end

    def test_can_afford__true()
        assert(@guest.can_afford?(50.00))
    end

    def test_can_afford__false()
        refute(@guest.can_afford?(2000000.00))
    end
    
    def test_guest_can_pay__success()
        @guest.pay(400000.00)
        assert_equal(600000.00, @guest.wallet)
    end

    def test_guest_can_pay__failure()
        @guest.pay(4000000.00)
        assert_equal(1000000.00, @guest.wallet)
    end

    def test_guest_can_cheer__success()
        @room.check_in(@guest)
        @room.add_song(@song)
        assert_equal("Yay! 'My Way' is my favourite song!", @guest.cheer(@room))
    end

    def test_guest_can_cheer__failure()
        @room.check_in(@guest)
        @room.add_song(@song2)
        assert_equal("Let's add some cool music to the playlist!", @guest.cheer(@room))
    end
    
end

