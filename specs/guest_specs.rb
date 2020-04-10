require('minitest/autorun')
require('minitest/reporters')
MiniTest::Reporters.use! MiniTest::Reporters::SpecReporter.new

require_relative('../guest')
require_relative('../song')

class GuestTest < MiniTest::Test

    def setup()
        @song = Song.new("My Way", "Frank Sinatra")
        @guest = Guest.new("Scarlett", 35, 1000000.00, @song, false)
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

end

